.class public final LI/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LQ3/e;


# direct methods
.method public synthetic constructor <init>(LQ3/e;I)V
    .locals 0

    .line 1
    iput p2, p0, LI/t;->e:I

    iput-object p1, p0, LI/t;->f:LQ3/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, LI/t;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, Lv3/z;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, Lv3/z;

    .line 12
    .line 13
    iget v1, v0, Lv3/z;->i:I

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
    iput v1, v0, Lv3/z;->i:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, Lv3/z;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Lv3/z;-><init>(LI/t;LA3/d;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, v0, Lv3/z;->h:Ljava/lang/Object;

    .line 31
    .line 32
    iget v1, v0, Lv3/z;->i:I

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
    check-cast p1, LM/b;

    .line 55
    .line 56
    invoke-virtual {p1}, LM/b;->a()Ljava/util/Map;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput v2, v0, Lv3/z;->i:I

    .line 65
    .line 66
    iget-object p2, p0, LI/t;->f:LQ3/e;

    .line 67
    .line 68
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget-object p2, LB3/a;->e:LB3/a;

    .line 73
    .line 74
    if-ne p1, p2, :cond_3

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    :goto_1
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 78
    .line 79
    :goto_2
    return-object p2

    .line 80
    :pswitch_0
    instance-of v0, p2, LI/s;

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    move-object v0, p2

    .line 85
    check-cast v0, LI/s;

    .line 86
    .line 87
    iget v1, v0, LI/s;->i:I

    .line 88
    .line 89
    const/high16 v2, -0x80000000

    .line 90
    .line 91
    and-int v3, v1, v2

    .line 92
    .line 93
    if-eqz v3, :cond_4

    .line 94
    .line 95
    sub-int/2addr v1, v2

    .line 96
    iput v1, v0, LI/s;->i:I

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_4
    new-instance v0, LI/s;

    .line 100
    .line 101
    invoke-direct {v0, p0, p2}, LI/s;-><init>(LI/t;LA3/d;)V

    .line 102
    .line 103
    .line 104
    :goto_3
    iget-object p2, v0, LI/s;->h:Ljava/lang/Object;

    .line 105
    .line 106
    iget v1, v0, LI/s;->i:I

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    if-eqz v1, :cond_6

    .line 110
    .line 111
    if-ne v1, v2, :cond_5

    .line 112
    .line 113
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 118
    .line 119
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 120
    .line 121
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    throw p1

    .line 125
    :cond_6
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    check-cast p1, LI/k0;

    .line 129
    .line 130
    instance-of p2, p1, LI/c0;

    .line 131
    .line 132
    if-nez p2, :cond_b

    .line 133
    .line 134
    instance-of p2, p1, LI/d;

    .line 135
    .line 136
    if-eqz p2, :cond_8

    .line 137
    .line 138
    check-cast p1, LI/d;

    .line 139
    .line 140
    iget-object p1, p1, LI/d;->b:Ljava/lang/Object;

    .line 141
    .line 142
    iput v2, v0, LI/s;->i:I

    .line 143
    .line 144
    iget-object p2, p0, LI/t;->f:LQ3/e;

    .line 145
    .line 146
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    sget-object p2, LB3/a;->e:LB3/a;

    .line 151
    .line 152
    if-ne p1, p2, :cond_7

    .line 153
    .line 154
    goto :goto_5

    .line 155
    :cond_7
    :goto_4
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 156
    .line 157
    :goto_5
    return-object p2

    .line 158
    :cond_8
    instance-of p2, p1, LI/a0;

    .line 159
    .line 160
    if-eqz p2, :cond_9

    .line 161
    .line 162
    goto :goto_6

    .line 163
    :cond_9
    instance-of v2, p1, LI/l0;

    .line 164
    .line 165
    :goto_6
    if-eqz v2, :cond_a

    .line 166
    .line 167
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 168
    .line 169
    const-string p2, "This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542"

    .line 170
    .line 171
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    throw p1

    .line 175
    :cond_a
    new-instance p1, LD1/n;

    .line 176
    .line 177
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 178
    .line 179
    .line 180
    throw p1

    .line 181
    :cond_b
    check-cast p1, LI/c0;

    .line 182
    .line 183
    iget-object p1, p1, LI/c0;->b:Ljava/lang/Throwable;

    .line 184
    .line 185
    throw p1

    .line 186
    nop

    .line 187
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
