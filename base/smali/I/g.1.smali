.class public final LI/g;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/l;


# instance fields
.field public final synthetic i:I

.field public j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;LA3/d;I)V
    .locals 0

    .line 1
    iput p3, p0, LI/g;->i:I

    iput-object p1, p0, LI/g;->k:Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LI/g;->i:I

    .line 2
    .line 3
    check-cast p1, LA3/d;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, LI/g;

    .line 9
    .line 10
    iget-object v1, p0, LI/g;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, LI/G;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-direct {v0, v1, p1, v2}, LI/g;-><init>(Ljava/lang/Object;LA3/d;I)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, LI/g;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    return-object p1

    .line 25
    :pswitch_0
    new-instance v0, LI/g;

    .line 26
    .line 27
    iget-object v1, p0, LI/g;->k:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v1, LK/d;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-direct {v0, v1, p1, v2}, LI/g;-><init>(Ljava/lang/Object;LA3/d;I)V

    .line 33
    .line 34
    .line 35
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, LI/g;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    return-object p1

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, LI/g;->i:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget v0, p0, LI/g;->j:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, LI/g;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, LI/G;

    .line 31
    .line 32
    iput v1, p0, LI/g;->j:I

    .line 33
    .line 34
    invoke-virtual {p1, p0}, LI/G;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v0, LB3/a;->e:LB3/a;

    .line 39
    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    move-object p1, v0

    .line 43
    :cond_2
    :goto_0
    return-object p1

    .line 44
    :pswitch_0
    iget v0, p0, LI/g;->j:I

    .line 45
    .line 46
    sget-object v1, Ly3/h;->a:Ly3/h;

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    if-ne v0, v2, :cond_3

    .line 52
    .line 53
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 60
    .line 61
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw p1

    .line 65
    :cond_4
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, LI/g;->k:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p1, LK/d;

    .line 71
    .line 72
    iput v2, p0, LI/g;->j:I

    .line 73
    .line 74
    iget-object v0, p1, LK/d;->e:Ly3/f;

    .line 75
    .line 76
    invoke-virtual {v0}, Ly3/f;->a()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Landroid/content/SharedPreferences;

    .line 81
    .line 82
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v2, p1, LK/d;->f:Ljava/util/LinkedHashSet;

    .line 87
    .line 88
    if-nez v2, :cond_5

    .line 89
    .line 90
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_5
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_6

    .line 103
    .line 104
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    check-cast v4, Ljava/lang/String;

    .line 109
    .line 110
    invoke-interface {v0, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_6
    :goto_2
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_a

    .line 119
    .line 120
    iget-object v0, p1, LK/d;->e:Ly3/f;

    .line 121
    .line 122
    invoke-virtual {v0}, Ly3/f;->a()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Landroid/content/SharedPreferences;

    .line 127
    .line 128
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_7

    .line 137
    .line 138
    iget-object v0, p1, LK/d;->c:Landroid/content/Context;

    .line 139
    .line 140
    if-eqz v0, :cond_7

    .line 141
    .line 142
    iget-object p1, p1, LK/d;->d:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz p1, :cond_7

    .line 145
    .line 146
    invoke-static {v0, p1}, LK/b;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    :cond_7
    if-eqz v2, :cond_8

    .line 150
    .line 151
    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 152
    .line 153
    .line 154
    :cond_8
    sget-object p1, LB3/a;->e:LB3/a;

    .line 155
    .line 156
    if-ne v1, p1, :cond_9

    .line 157
    .line 158
    move-object v1, p1

    .line 159
    :cond_9
    :goto_3
    return-object v1

    .line 160
    :cond_a
    new-instance p1, Ljava/io/IOException;

    .line 161
    .line 162
    const-string v0, "Unable to delete migrated keys from SharedPreferences."

    .line 163
    .line 164
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw p1

    .line 168
    nop

    .line 169
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
