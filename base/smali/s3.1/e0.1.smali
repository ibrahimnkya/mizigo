.class public final Ls3/e0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ls3/C;

.field public c:Ls3/j0;

.field public d:Ls3/k0;

.field public e:Ljava/lang/Double;

.field public f:Ljava/lang/Double;

.field public g:Ls3/c0;

.field public h:Ljava/lang/Double;

.field public i:Ljava/lang/Double;

.field public j:Ljava/lang/Long;

.field public k:Ljava/lang/Boolean;

.field public l:Ljava/lang/Boolean;


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
    const-class v2, Ls3/e0;

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
    check-cast p1, Ls3/e0;

    .line 19
    .line 20
    iget-object v2, p0, Ls3/e0;->a:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, p1, Ls3/e0;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    iget-object v2, p0, Ls3/e0;->b:Ls3/C;

    .line 31
    .line 32
    iget-object v3, p1, Ls3/e0;->b:Ls3/C;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ls3/C;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ls3/e0;->c:Ls3/j0;

    .line 41
    .line 42
    iget-object v3, p1, Ls3/e0;->c:Ls3/j0;

    .line 43
    .line 44
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    iget-object v2, p0, Ls3/e0;->d:Ls3/k0;

    .line 51
    .line 52
    iget-object v3, p1, Ls3/e0;->d:Ls3/k0;

    .line 53
    .line 54
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_2

    .line 59
    .line 60
    iget-object v2, p0, Ls3/e0;->e:Ljava/lang/Double;

    .line 61
    .line 62
    iget-object v3, p1, Ls3/e0;->e:Ljava/lang/Double;

    .line 63
    .line 64
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p0, Ls3/e0;->f:Ljava/lang/Double;

    .line 71
    .line 72
    iget-object v3, p1, Ls3/e0;->f:Ljava/lang/Double;

    .line 73
    .line 74
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget-object v2, p0, Ls3/e0;->g:Ls3/c0;

    .line 81
    .line 82
    iget-object v3, p1, Ls3/e0;->g:Ls3/c0;

    .line 83
    .line 84
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    iget-object v2, p0, Ls3/e0;->h:Ljava/lang/Double;

    .line 91
    .line 92
    iget-object v3, p1, Ls3/e0;->h:Ljava/lang/Double;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_2

    .line 99
    .line 100
    iget-object v2, p0, Ls3/e0;->i:Ljava/lang/Double;

    .line 101
    .line 102
    iget-object v3, p1, Ls3/e0;->i:Ljava/lang/Double;

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
    iget-object v2, p0, Ls3/e0;->j:Ljava/lang/Long;

    .line 111
    .line 112
    iget-object v3, p1, Ls3/e0;->j:Ljava/lang/Long;

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_2

    .line 119
    .line 120
    iget-object v2, p0, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 121
    .line 122
    iget-object v3, p1, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_2

    .line 129
    .line 130
    iget-object v2, p0, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 131
    .line 132
    iget-object p1, p1, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 133
    .line 134
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_2

    .line 139
    .line 140
    return v0

    .line 141
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 12

    .line 1
    iget-object v0, p0, Ls3/e0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ls3/e0;->b:Ls3/C;

    .line 4
    .line 5
    iget-object v2, p0, Ls3/e0;->c:Ls3/j0;

    .line 6
    .line 7
    iget-object v3, p0, Ls3/e0;->d:Ls3/k0;

    .line 8
    .line 9
    iget-object v4, p0, Ls3/e0;->e:Ljava/lang/Double;

    .line 10
    .line 11
    iget-object v5, p0, Ls3/e0;->f:Ljava/lang/Double;

    .line 12
    .line 13
    iget-object v6, p0, Ls3/e0;->g:Ls3/c0;

    .line 14
    .line 15
    iget-object v7, p0, Ls3/e0;->h:Ljava/lang/Double;

    .line 16
    .line 17
    iget-object v8, p0, Ls3/e0;->i:Ljava/lang/Double;

    .line 18
    .line 19
    iget-object v9, p0, Ls3/e0;->j:Ljava/lang/Long;

    .line 20
    .line 21
    iget-object v10, p0, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 22
    .line 23
    iget-object v11, p0, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    return v0
.end method
