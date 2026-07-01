.class public final synthetic Ls1/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/f;
.implements Ls1/C;
.implements Ls1/x;
.implements Ls1/v;
.implements Ls1/d;
.implements Lw3/c;


# instance fields
.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ls1/r;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    return p1
.end method

.method public b(Ls1/H;)Lj1/i;
    .locals 3

    .line 1
    iget v0, p0, Ls1/r;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 7
    .line 8
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Lx1/T;->G(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/T;

    .line 29
    .line 30
    .line 31
    move-result-object v0
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    invoke-virtual {v0}, Lx1/T;->E()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0}, Lx1/T;->C()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, v1, LV1/y;->f:Ljava/lang/Object;

    .line 51
    .line 52
    invoke-virtual {v0}, Lx1/T;->D()Lx1/V;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Lx1/V;->D()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, LV1/y;->g:Ljava/lang/Object;

    .line 65
    .line 66
    sget-object v2, Lu1/c;->b:LM0/f;

    .line 67
    .line 68
    invoke-virtual {v0}, Lx1/T;->D()Lx1/V;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lx1/V;->C()Lx1/O;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v2, v0}, LM0/f;->a(Ljava/lang/Enum;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lt1/j;

    .line 81
    .line 82
    iput-object v0, v1, LV1/y;->h:Ljava/lang/Object;

    .line 83
    .line 84
    sget-object v0, Lu1/c;->a:LM0/f;

    .line 85
    .line 86
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v0, p1}, LM0/f;->a(Ljava/lang/Enum;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lt1/k;

    .line 95
    .line 96
    iput-object p1, v1, LV1/y;->i:Ljava/lang/Object;

    .line 97
    .line 98
    invoke-virtual {v1}, LV1/y;->i()Lt1/l;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    return-object p1

    .line 103
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v2, "Parsing HmacParameters failed: unknown Version "

    .line 108
    .line 109
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Lx1/T;->E()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p1

    .line 127
    :catch_0
    move-exception p1

    .line 128
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 129
    .line 130
    const-string v1, "Parsing HmacParameters failed: "

    .line 131
    .line 132
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 133
    .line 134
    .line 135
    throw v0

    .line 136
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 137
    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v2, "Wrong type URL in call to HmacProtoSerialization.parseParameters: "

    .line 141
    .line 142
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw v0

    .line 160
    :pswitch_0
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 161
    .line 162
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_2

    .line 173
    .line 174
    :try_start_1
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-static {v0, v1}, Lx1/d;->E(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/d;

    .line 183
    .line 184
    .line 185
    move-result-object v0
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1

    .line 186
    invoke-static {}, Lt1/d;->b()Lm/x0;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0}, Lx1/d;->B()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    invoke-virtual {v1, v2}, Lm/x0;->J(I)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Lx1/d;->C()Lx1/f;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v0}, Lx1/f;->B()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    invoke-virtual {v1, v0}, Lm/x0;->K(I)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-static {p1}, Lu1/a;->b(Lx1/t0;)Lt1/c;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, v1, Lm/x0;->h:Ljava/lang/Object;

    .line 217
    .line 218
    invoke-virtual {v1}, Lm/x0;->w()Lt1/d;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    return-object p1

    .line 223
    :catch_1
    move-exception p1

    .line 224
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 225
    .line 226
    const-string v1, "Parsing AesCmacParameters failed: "

    .line 227
    .line 228
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    throw v0

    .line 232
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 233
    .line 234
    new-instance v1, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v2, "Wrong type URL in call to AesCmacProtoSerialization.parseParameters: "

    .line 237
    .line 238
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    throw v0

    .line 256
    nop

    .line 257
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
    .end packed-switch
.end method

.method public c(Landroid/support/v4/media/session/a;)Ls1/G;
    .locals 5

    .line 1
    iget v0, p0, Ls1/r;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lt1/h;

    .line 7
    .line 8
    invoke-static {}, Lx1/Q;->F()Lx1/P;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p1, Lt1/h;->d:Lt1/l;

    .line 13
    .line 14
    invoke-static {}, Lx1/V;->E()Lx1/U;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget v3, v1, Lt1/l;->b:I

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 21
    .line 22
    .line 23
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 24
    .line 25
    check-cast v4, Lx1/V;

    .line 26
    .line 27
    invoke-static {v4, v3}, Lx1/V;->A(Lx1/V;I)V

    .line 28
    .line 29
    .line 30
    sget-object v3, Lu1/c;->b:LM0/f;

    .line 31
    .line 32
    iget-object v1, v1, Lt1/l;->d:Lt1/j;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, LM0/f;->b(Ljava/lang/Object;)Ljava/lang/Enum;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lx1/O;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 41
    .line 42
    .line 43
    iget-object v3, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 44
    .line 45
    check-cast v3, Lx1/V;

    .line 46
    .line 47
    invoke-static {v3, v1}, Lx1/V;->z(Lx1/V;Lx1/O;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lx1/V;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 57
    .line 58
    .line 59
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 60
    .line 61
    check-cast v2, Lx1/Q;

    .line 62
    .line 63
    invoke-static {v2, v1}, Lx1/Q;->z(Lx1/Q;Lx1/V;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p1, Lt1/h;->e:Lio/flutter/plugin/editing/j;

    .line 67
    .line 68
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v1, Lz1/a;

    .line 71
    .line 72
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x0

    .line 77
    array-length v3, v1

    .line 78
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 83
    .line 84
    .line 85
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 86
    .line 87
    check-cast v2, Lx1/Q;

    .line 88
    .line 89
    invoke-static {v2, v1}, Lx1/Q;->A(Lx1/Q;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lx1/Q;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sget-object v1, Lu1/c;->a:LM0/f;

    .line 103
    .line 104
    iget-object v2, p1, Lt1/h;->d:Lt1/l;

    .line 105
    .line 106
    iget-object v2, v2, Lt1/l;->c:Lt1/k;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, LM0/f;->b(Ljava/lang/Object;)Ljava/lang/Enum;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Lx1/t0;

    .line 113
    .line 114
    iget-object p1, p1, Lt1/h;->g:Ljava/lang/Integer;

    .line 115
    .line 116
    const-string v2, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 117
    .line 118
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 119
    .line 120
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    return-object p1

    .line 125
    :sswitch_0
    check-cast p1, Lt1/a;

    .line 126
    .line 127
    invoke-static {}, Lx1/b;->E()Lx1/a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v1, p1, Lt1/a;->d:Lt1/d;

    .line 132
    .line 133
    invoke-static {}, Lx1/f;->C()Lx1/e;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget v1, v1, Lt1/d;->b:I

    .line 138
    .line 139
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 140
    .line 141
    .line 142
    iget-object v3, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 143
    .line 144
    check-cast v3, Lx1/f;

    .line 145
    .line 146
    invoke-static {v3, v1}, Lx1/f;->z(Lx1/f;I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    check-cast v1, Lx1/f;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 156
    .line 157
    .line 158
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 159
    .line 160
    check-cast v2, Lx1/b;

    .line 161
    .line 162
    invoke-static {v2, v1}, Lx1/b;->A(Lx1/b;Lx1/f;)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p1, Lt1/a;->e:Lio/flutter/plugin/editing/j;

    .line 166
    .line 167
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 168
    .line 169
    check-cast v1, Lz1/a;

    .line 170
    .line 171
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/4 v2, 0x0

    .line 176
    array-length v3, v1

    .line 177
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 182
    .line 183
    .line 184
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 185
    .line 186
    check-cast v2, Lx1/b;

    .line 187
    .line 188
    invoke-static {v2, v1}, Lx1/b;->z(Lx1/b;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Lx1/b;

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v1, p1, Lt1/a;->d:Lt1/d;

    .line 202
    .line 203
    iget-object v1, v1, Lt1/d;->c:Lt1/c;

    .line 204
    .line 205
    invoke-static {v1}, Lu1/a;->a(Lt1/c;)Lx1/t0;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iget-object p1, p1, Lt1/a;->g:Ljava/lang/Integer;

    .line 210
    .line 211
    const-string v2, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 212
    .line 213
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 214
    .line 215
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    return-object p1

    .line 220
    :sswitch_1
    check-cast p1, Ls1/i;

    .line 221
    .line 222
    iget-object p1, p1, Ls1/i;->d:Ls1/G;

    .line 223
    .line 224
    invoke-static {p1}, Ls1/i;->d0(Ls1/G;)V

    .line 225
    .line 226
    .line 227
    return-object p1

    .line 228
    nop

    .line 229
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method public d(Lj1/i;)Ls1/H;
    .locals 5

    .line 1
    iget v0, p0, Ls1/r;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lt1/l;

    .line 7
    .line 8
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lx1/T;->F()Lx1/S;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Lx1/V;->E()Lx1/U;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v3, p1, Lt1/l;->b:I

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 28
    .line 29
    .line 30
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 31
    .line 32
    check-cast v4, Lx1/V;

    .line 33
    .line 34
    invoke-static {v4, v3}, Lx1/V;->A(Lx1/V;I)V

    .line 35
    .line 36
    .line 37
    sget-object v3, Lu1/c;->b:LM0/f;

    .line 38
    .line 39
    iget-object v4, p1, Lt1/l;->d:Lt1/j;

    .line 40
    .line 41
    invoke-virtual {v3, v4}, LM0/f;->b(Ljava/lang/Object;)Ljava/lang/Enum;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lx1/O;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 48
    .line 49
    .line 50
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 51
    .line 52
    check-cast v4, Lx1/V;

    .line 53
    .line 54
    invoke-static {v4, v3}, Lx1/V;->z(Lx1/V;Lx1/O;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lx1/V;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 64
    .line 65
    .line 66
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 67
    .line 68
    check-cast v3, Lx1/T;

    .line 69
    .line 70
    invoke-static {v3, v2}, Lx1/T;->z(Lx1/T;Lx1/V;)V

    .line 71
    .line 72
    .line 73
    iget v2, p1, Lt1/l;->a:I

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 76
    .line 77
    .line 78
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 79
    .line 80
    check-cast v3, Lx1/T;

    .line 81
    .line 82
    invoke-static {v3, v2}, Lx1/T;->A(Lx1/T;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lx1/T;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 96
    .line 97
    .line 98
    sget-object v1, Lu1/c;->a:LM0/f;

    .line 99
    .line 100
    iget-object p1, p1, Lt1/l;->c:Lt1/k;

    .line 101
    .line 102
    invoke-virtual {v1, p1}, LM0/f;->b(Ljava/lang/Object;)Ljava/lang/Enum;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lx1/t0;

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lx1/b0;

    .line 116
    .line 117
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    return-object p1

    .line 122
    :pswitch_0
    check-cast p1, Lt1/d;

    .line 123
    .line 124
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lx1/d;->D()Lx1/c;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {}, Lx1/f;->C()Lx1/e;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iget v3, p1, Lt1/d;->b:I

    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 144
    .line 145
    .line 146
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 147
    .line 148
    check-cast v4, Lx1/f;

    .line 149
    .line 150
    invoke-static {v4, v3}, Lx1/f;->z(Lx1/f;I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lx1/f;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 160
    .line 161
    .line 162
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 163
    .line 164
    check-cast v3, Lx1/d;

    .line 165
    .line 166
    invoke-static {v3, v2}, Lx1/d;->A(Lx1/d;Lx1/f;)V

    .line 167
    .line 168
    .line 169
    iget v2, p1, Lt1/d;->a:I

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 172
    .line 173
    .line 174
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 175
    .line 176
    check-cast v3, Lx1/d;

    .line 177
    .line 178
    invoke-static {v3, v2}, Lx1/d;->z(Lx1/d;I)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    check-cast v1, Lx1/d;

    .line 186
    .line 187
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p1, Lt1/d;->c:Lt1/c;

    .line 195
    .line 196
    invoke-static {p1}, Lu1/a;->a(Lt1/c;)Lx1/t0;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    check-cast p1, Lx1/b0;

    .line 208
    .line 209
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    return-object p1

    .line 214
    nop

    .line 215
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
    .end packed-switch
.end method

.method public e(Landroid/support/v4/media/session/a;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Ls1/r;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ls1/i;

    .line 7
    .line 8
    iget-object p1, p1, Ls1/i;->d:Ls1/G;

    .line 9
    .line 10
    invoke-static {p1}, Ls1/i;->d0(Ls1/G;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 14
    .line 15
    sget-object v1, Ls1/b;->d:Ls1/b;

    .line 16
    .line 17
    iget-object v2, p1, Ls1/G;->a:Ljava/lang/String;

    .line 18
    .line 19
    const-class v3, Lj1/h;

    .line 20
    .line 21
    invoke-virtual {v1, v3, v2}, Ls1/b;->a(Ljava/lang/Class;Ljava/lang/String;)Ls1/g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ls1/g;->a(Lcom/google/crypto/tink/shaded/protobuf/i;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lj1/h;

    .line 32
    .line 33
    iget-object p1, p1, Ls1/G;->e:Lx1/t0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/4 v1, 0x1

    .line 40
    if-eq p1, v1, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    if-eq p1, v1, :cond_2

    .line 44
    .line 45
    const/4 v1, 0x3

    .line 46
    if-eq p1, v1, :cond_1

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    if-ne p1, v1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 53
    .line 54
    const-string v0, "unknown output prefix type"

    .line 55
    .line 56
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_1
    sget-object p1, Ls1/t;->a:Lz1/a;

    .line 61
    .line 62
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {p1}, Ls1/t;->a(I)Lz1/a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-static {p1}, Ls1/t;->b(I)Lz1/a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 87
    .line 88
    .line 89
    :goto_1
    new-instance p1, Lu1/d;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 92
    .line 93
    .line 94
    return-object p1

    .line 95
    :pswitch_0
    check-cast p1, Lt1/h;

    .line 96
    .line 97
    new-instance v0, Ly1/m;

    .line 98
    .line 99
    invoke-direct {v0, p1}, Ly1/m;-><init>(Lt1/h;)V

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :pswitch_1
    new-instance v0, Lu1/b;

    .line 104
    .line 105
    check-cast p1, Lt1/h;

    .line 106
    .line 107
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 108
    .line 109
    .line 110
    const/4 p1, 0x2

    .line 111
    invoke-static {p1}, LE1/j;->f(I)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    return-object v0

    .line 118
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 119
    .line 120
    const-string v0, "Can not use HMAC in FIPS-mode, as BoringCrypto module is not available."

    .line 121
    .line 122
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p1

    .line 126
    :pswitch_2
    check-cast p1, Lt1/a;

    .line 127
    .line 128
    iget-object v0, p1, Lt1/a;->d:Lt1/d;

    .line 129
    .line 130
    iget v0, v0, Lt1/d;->a:I

    .line 131
    .line 132
    const/16 v1, 0x20

    .line 133
    .line 134
    if-ne v0, v1, :cond_5

    .line 135
    .line 136
    new-instance v0, Ly1/m;

    .line 137
    .line 138
    invoke-direct {v0, p1}, Ly1/m;-><init>(Lt1/a;)V

    .line 139
    .line 140
    .line 141
    return-object v0

    .line 142
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 143
    .line 144
    const-string v0, "AesCmacKey size wrong, must be 32 bytes"

    .line 145
    .line 146
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    throw p1

    .line 150
    :pswitch_3
    check-cast p1, Lt1/a;

    .line 151
    .line 152
    iget-object v0, p1, Lt1/a;->d:Lt1/d;

    .line 153
    .line 154
    iget v0, v0, Lt1/d;->a:I

    .line 155
    .line 156
    const/16 v1, 0x20

    .line 157
    .line 158
    if-ne v0, v1, :cond_8

    .line 159
    .line 160
    const/4 v0, 0x1

    .line 161
    invoke-static {v0}, LE1/j;->e(I)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_7

    .line 166
    .line 167
    invoke-static {}, Ls1/a;->a()Ljava/security/Provider;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    if-eqz v0, :cond_6

    .line 172
    .line 173
    :try_start_0
    invoke-static {p1, v0}, Lu1/b;->a(Lt1/a;Ljava/security/Provider;)Lu1/b;

    .line 174
    .line 175
    .line 176
    move-result-object p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    goto :goto_2

    .line 178
    :catch_0
    :cond_6
    new-instance p1, Lu1/b;

    .line 179
    .line 180
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 181
    .line 182
    .line 183
    :goto_2
    return-object p1

    .line 184
    :cond_7
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 185
    .line 186
    const-string v0, "Cannot use AES-CMAC in FIPS-mode."

    .line 187
    .line 188
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw p1

    .line 192
    :cond_8
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 193
    .line 194
    const-string v0, "AesCmacKey size wrong, must be 32 bytes"

    .line 195
    .line 196
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    throw p1

    .line 200
    nop

    .line 201
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f(Ls1/G;)Landroid/support/v4/media/session/a;
    .locals 5

    .line 1
    iget v0, p0, Ls1/r;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :try_start_0
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 17
    .line 18
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lx1/Q;->G(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/Q;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lx1/Q;->E()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0}, Lx1/Q;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v2, v1, LV1/y;->f:Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {v0}, Lx1/Q;->D()Lx1/V;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Lx1/V;->D()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iput-object v2, v1, LV1/y;->g:Ljava/lang/Object;

    .line 63
    .line 64
    sget-object v2, Lu1/c;->b:LM0/f;

    .line 65
    .line 66
    invoke-virtual {v0}, Lx1/Q;->D()Lx1/V;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lx1/V;->C()Lx1/O;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v2, v3}, LM0/f;->a(Ljava/lang/Enum;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lt1/j;

    .line 79
    .line 80
    iput-object v2, v1, LV1/y;->h:Ljava/lang/Object;

    .line 81
    .line 82
    sget-object v2, Lu1/c;->a:LM0/f;

    .line 83
    .line 84
    iget-object v3, p1, Ls1/G;->e:Lx1/t0;

    .line 85
    .line 86
    invoke-virtual {v2, v3}, LM0/f;->a(Ljava/lang/Enum;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Lt1/k;

    .line 91
    .line 92
    iput-object v2, v1, LV1/y;->i:Ljava/lang/Object;

    .line 93
    .line 94
    invoke-virtual {v1}, LV1/y;->i()Lt1/l;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    new-instance v2, Lm/x0;

    .line 99
    .line 100
    const/16 v3, 0x8

    .line 101
    .line 102
    const/4 v4, 0x0

    .line 103
    invoke-direct {v2, v4, v3}, Lm/x0;-><init>(CI)V

    .line 104
    .line 105
    .line 106
    const/4 v3, 0x0

    .line 107
    iput-object v3, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 108
    .line 109
    iput-object v3, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 110
    .line 111
    iput-object v1, v2, Lm/x0;->f:Ljava/lang/Object;

    .line 112
    .line 113
    invoke-virtual {v0}, Lx1/Q;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 122
    .line 123
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/16 v3, 0x17

    .line 128
    .line 129
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iput-object v1, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 133
    .line 134
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 135
    .line 136
    iput-object p1, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 137
    .line 138
    invoke-virtual {v2}, Lm/x0;->x()Lt1/h;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    return-object p1

    .line 143
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 144
    .line 145
    const-string v0, "Only version 0 keys are accepted"

    .line 146
    .line 147
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p1
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 152
    .line 153
    const-string v0, "Parsing HmacKey failed"

    .line 154
    .line 155
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p1

    .line 159
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 160
    .line 161
    const-string v0, "Wrong type URL in call to HmacProtoSerialization.parseKey"

    .line 162
    .line 163
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    throw p1

    .line 167
    :pswitch_0
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 168
    .line 169
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_3

    .line 176
    .line 177
    :try_start_1
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 178
    .line 179
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-static {v0, v1}, Lx1/b;->F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/b;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Lx1/b;->D()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-nez v1, :cond_2

    .line 192
    .line 193
    invoke-static {}, Lt1/d;->b()Lm/x0;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0}, Lx1/b;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    invoke-virtual {v1, v2}, Lm/x0;->J(I)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Lx1/b;->C()Lx1/f;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v2}, Lx1/f;->B()I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    invoke-virtual {v1, v2}, Lm/x0;->K(I)V

    .line 217
    .line 218
    .line 219
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 220
    .line 221
    invoke-static {v2}, Lu1/a;->b(Lx1/t0;)Lt1/c;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    iput-object v2, v1, Lm/x0;->h:Ljava/lang/Object;

    .line 226
    .line 227
    invoke-virtual {v1}, Lm/x0;->w()Lt1/d;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    new-instance v2, Lm/x0;

    .line 232
    .line 233
    const/4 v3, 0x6

    .line 234
    const/4 v4, 0x0

    .line 235
    invoke-direct {v2, v4, v3}, Lm/x0;-><init>(CI)V

    .line 236
    .line 237
    .line 238
    const/4 v3, 0x0

    .line 239
    iput-object v3, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 240
    .line 241
    iput-object v3, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 242
    .line 243
    iput-object v1, v2, Lm/x0;->f:Ljava/lang/Object;

    .line 244
    .line 245
    invoke-virtual {v0}, Lx1/b;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 254
    .line 255
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const/16 v3, 0x17

    .line 260
    .line 261
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    iput-object v1, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 265
    .line 266
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 267
    .line 268
    iput-object p1, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 269
    .line 270
    invoke-virtual {v2}, Lm/x0;->v()Lt1/a;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    return-object p1

    .line 275
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 276
    .line 277
    const-string v0, "Only version 0 keys are accepted"

    .line 278
    .line 279
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    throw p1
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 283
    :catch_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 284
    .line 285
    const-string v0, "Parsing AesCmacKey failed"

    .line 286
    .line 287
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    throw p1

    .line 291
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 292
    .line 293
    const-string v0, "Wrong type URL in call to AesCmacProtoSerialization.parseKey"

    .line 294
    .line 295
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    throw p1

    .line 299
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
    .end packed-switch
.end method
