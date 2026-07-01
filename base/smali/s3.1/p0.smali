.class public final Ls3/p0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Double;

.field public b:Ls3/c0;

.field public c:Ljava/lang/Boolean;

.field public d:Ljava/lang/Boolean;

.field public e:Ljava/lang/Boolean;

.field public f:Ls3/C;

.field public g:Ls3/h0;

.field public h:Ls3/j0;

.field public i:Ljava/lang/Double;

.field public j:Ljava/lang/Boolean;

.field public k:Ljava/lang/Double;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ls3/q0;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ls3/p0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_1
    check-cast p1, Ls3/p0;

    .line 19
    .line 20
    iget-object v2, p0, Ls3/p0;->a:Ljava/lang/Double;

    .line 21
    .line 22
    iget-object v3, p1, Ls3/p0;->a:Ljava/lang/Double;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    iget-object v2, p0, Ls3/p0;->b:Ls3/c0;

    .line 31
    .line 32
    iget-object v3, p1, Ls3/p0;->b:Ls3/c0;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ls3/c0;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 41
    .line 42
    iget-object v3, p1, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    iget-object v2, p0, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 51
    .line 52
    iget-object v3, p1, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_2

    .line 59
    .line 60
    iget-object v2, p0, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 61
    .line 62
    iget-object v3, p1, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p0, Ls3/p0;->f:Ls3/C;

    .line 71
    .line 72
    iget-object v3, p1, Ls3/p0;->f:Ls3/C;

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ls3/C;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget-object v2, p0, Ls3/p0;->g:Ls3/h0;

    .line 81
    .line 82
    iget-object v3, p1, Ls3/p0;->g:Ls3/h0;

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ls3/h0;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    iget-object v2, p0, Ls3/p0;->h:Ls3/j0;

    .line 91
    .line 92
    iget-object v3, p1, Ls3/p0;->h:Ls3/j0;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ls3/j0;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_2

    .line 99
    .line 100
    iget-object v2, p0, Ls3/p0;->i:Ljava/lang/Double;

    .line 101
    .line 102
    iget-object v3, p1, Ls3/p0;->i:Ljava/lang/Double;

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_2

    .line 109
    .line 110
    iget-object v2, p0, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 111
    .line 112
    iget-object v3, p1, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_2

    .line 119
    .line 120
    iget-object v2, p0, Ls3/p0;->k:Ljava/lang/Double;

    .line 121
    .line 122
    iget-object v3, p1, Ls3/p0;->k:Ljava/lang/Double;

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_2

    .line 129
    .line 130
    iget-object v2, p0, Ls3/p0;->l:Ljava/lang/String;

    .line 131
    .line 132
    iget-object v3, p1, Ls3/p0;->l:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_2

    .line 139
    .line 140
    iget-object v2, p0, Ls3/p0;->m:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v3, p1, Ls3/p0;->m:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_2

    .line 149
    .line 150
    iget-object v2, p0, Ls3/p0;->n:Ls3/q0;

    .line 151
    .line 152
    iget-object p1, p1, Ls3/p0;->n:Ls3/q0;

    .line 153
    .line 154
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_2

    .line 159
    .line 160
    return v0

    .line 161
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 14

    .line 1
    iget-object v0, p0, Ls3/p0;->a:Ljava/lang/Double;

    .line 2
    .line 3
    iget-object v1, p0, Ls3/p0;->b:Ls3/c0;

    .line 4
    .line 5
    iget-object v2, p0, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 6
    .line 7
    iget-object v3, p0, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 8
    .line 9
    iget-object v4, p0, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 10
    .line 11
    iget-object v5, p0, Ls3/p0;->f:Ls3/C;

    .line 12
    .line 13
    iget-object v6, p0, Ls3/p0;->g:Ls3/h0;

    .line 14
    .line 15
    iget-object v7, p0, Ls3/p0;->h:Ls3/j0;

    .line 16
    .line 17
    iget-object v8, p0, Ls3/p0;->i:Ljava/lang/Double;

    .line 18
    .line 19
    iget-object v9, p0, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 20
    .line 21
    iget-object v10, p0, Ls3/p0;->k:Ljava/lang/Double;

    .line 22
    .line 23
    iget-object v11, p0, Ls3/p0;->l:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v12, p0, Ls3/p0;->m:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v13, p0, Ls3/p0;->n:Ls3/q0;

    .line 28
    .line 29
    filled-new-array/range {v0 .. v13}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    return v0
.end method
