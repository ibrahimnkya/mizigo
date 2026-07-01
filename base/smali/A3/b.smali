.class public final synthetic LA3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LA3/b;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LA3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, LS3/w;

    .line 7
    .line 8
    check-cast p2, LA3/g;

    .line 9
    .line 10
    return-object p1

    .line 11
    :pswitch_0
    check-cast p1, LN3/g0;

    .line 12
    .line 13
    check-cast p2, LA3/g;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    instance-of p1, p2, LN3/g0;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    move-object p1, p2

    .line 23
    check-cast p1, LN3/g0;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    :goto_0
    return-object p1

    .line 28
    :pswitch_1
    check-cast p2, LA3/g;

    .line 29
    .line 30
    instance-of v0, p2, LN3/g0;

    .line 31
    .line 32
    if-eqz v0, :cond_5

    .line 33
    .line 34
    instance-of v0, p1, Ljava/lang/Integer;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    check-cast p1, Ljava/lang/Integer;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    const/4 p1, 0x0

    .line 42
    :goto_1
    const/4 v0, 0x1

    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    goto :goto_2

    .line 50
    :cond_3
    move p1, v0

    .line 51
    :goto_2
    if-nez p1, :cond_4

    .line 52
    .line 53
    move-object p1, p2

    .line 54
    goto :goto_3

    .line 55
    :cond_4
    add-int/2addr p1, v0

    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :cond_5
    :goto_3
    return-object p1

    .line 61
    :pswitch_2
    check-cast p1, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    check-cast p2, LA3/g;

    .line 68
    .line 69
    add-int/lit8 p1, p1, 0x1

    .line 70
    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    return-object p1

    .line 76
    :pswitch_3
    check-cast p1, LA3/i;

    .line 77
    .line 78
    check-cast p2, LA3/g;

    .line 79
    .line 80
    invoke-interface {p1, p2}, LA3/i;->h(LA3/i;)LA3/i;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    return-object p1

    .line 85
    :pswitch_4
    check-cast p1, LA3/i;

    .line 86
    .line 87
    check-cast p2, LA3/g;

    .line 88
    .line 89
    invoke-interface {p1, p2}, LA3/i;->h(LA3/i;)LA3/i;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    return-object p1

    .line 94
    :pswitch_5
    check-cast p1, Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    check-cast p2, LA3/g;

    .line 100
    .line 101
    return-object p1

    .line 102
    :pswitch_6
    check-cast p1, LA3/i;

    .line 103
    .line 104
    check-cast p2, LA3/g;

    .line 105
    .line 106
    const-string v0, "acc"

    .line 107
    .line 108
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string v0, "element"

    .line 112
    .line 113
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {p2}, LA3/g;->getKey()LA3/h;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {p1, v0}, LA3/i;->r(LA3/h;)LA3/i;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget-object v0, LA3/j;->e:LA3/j;

    .line 125
    .line 126
    if-ne p1, v0, :cond_6

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_6
    sget-object v1, LA3/e;->e:LA3/e;

    .line 130
    .line 131
    invoke-interface {p1, v1}, LA3/i;->m(LA3/h;)LA3/g;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, LA3/f;

    .line 136
    .line 137
    if-nez v2, :cond_7

    .line 138
    .line 139
    new-instance v0, LA3/c;

    .line 140
    .line 141
    invoke-direct {v0, p1, p2}, LA3/c;-><init>(LA3/i;LA3/g;)V

    .line 142
    .line 143
    .line 144
    :goto_4
    move-object p2, v0

    .line 145
    goto :goto_5

    .line 146
    :cond_7
    invoke-interface {p1, v1}, LA3/i;->r(LA3/h;)LA3/i;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    if-ne p1, v0, :cond_8

    .line 151
    .line 152
    new-instance p1, LA3/c;

    .line 153
    .line 154
    invoke-direct {p1, p2, v2}, LA3/c;-><init>(LA3/i;LA3/g;)V

    .line 155
    .line 156
    .line 157
    move-object p2, p1

    .line 158
    goto :goto_5

    .line 159
    :cond_8
    new-instance v0, LA3/c;

    .line 160
    .line 161
    new-instance v1, LA3/c;

    .line 162
    .line 163
    invoke-direct {v1, p1, p2}, LA3/c;-><init>(LA3/i;LA3/g;)V

    .line 164
    .line 165
    .line 166
    invoke-direct {v0, v1, v2}, LA3/c;-><init>(LA3/i;LA3/g;)V

    .line 167
    .line 168
    .line 169
    goto :goto_4

    .line 170
    :goto_5
    return-object p2

    .line 171
    :pswitch_7
    check-cast p1, Ljava/lang/String;

    .line 172
    .line 173
    check-cast p2, LA3/g;

    .line 174
    .line 175
    const-string v0, "acc"

    .line 176
    .line 177
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const-string v0, "element"

    .line 181
    .line 182
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_9

    .line 190
    .line 191
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    goto :goto_6

    .line 196
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string p1, ", "

    .line 205
    .line 206
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    :goto_6
    return-object p1

    .line 217
    :pswitch_data_0
    .packed-switch 0x0
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
