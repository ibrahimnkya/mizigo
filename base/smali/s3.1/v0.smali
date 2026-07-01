.class public final Ls3/v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/Boolean;

.field public c:Ls3/b0;

.field public d:Ljava/lang/Boolean;

.field public e:Ljava/util/List;

.field public f:Ljava/util/List;

.field public g:Ljava/lang/Boolean;

.field public h:Ls3/b0;

.field public i:Ljava/lang/Long;

.field public j:Ljava/lang/Long;


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
    const-class v2, Ls3/v0;

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
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ls3/v0;

    .line 18
    .line 19
    iget-object v2, p0, Ls3/v0;->a:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Ls3/v0;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 30
    .line 31
    iget-object v3, p1, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Ls3/v0;->c:Ls3/b0;

    .line 40
    .line 41
    iget-object v3, p1, Ls3/v0;->c:Ls3/b0;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ls3/b0;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 50
    .line 51
    iget-object v3, p1, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Ls3/v0;->e:Ljava/util/List;

    .line 60
    .line 61
    iget-object v3, p1, Ls3/v0;->e:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    iget-object v2, p0, Ls3/v0;->f:Ljava/util/List;

    .line 70
    .line 71
    iget-object v3, p1, Ls3/v0;->f:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    iget-object v2, p0, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 80
    .line 81
    iget-object v3, p1, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    iget-object v2, p0, Ls3/v0;->h:Ls3/b0;

    .line 90
    .line 91
    iget-object v3, p1, Ls3/v0;->h:Ls3/b0;

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ls3/b0;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    iget-object v2, p0, Ls3/v0;->i:Ljava/lang/Long;

    .line 100
    .line 101
    iget-object v3, p1, Ls3/v0;->i:Ljava/lang/Long;

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    iget-object v2, p0, Ls3/v0;->j:Ljava/lang/Long;

    .line 110
    .line 111
    iget-object p1, p1, Ls3/v0;->j:Ljava/lang/Long;

    .line 112
    .line 113
    invoke-virtual {v2, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    return v0

    .line 120
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 10

    .line 1
    iget-object v0, p0, Ls3/v0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 4
    .line 5
    iget-object v2, p0, Ls3/v0;->c:Ls3/b0;

    .line 6
    .line 7
    iget-object v3, p0, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 8
    .line 9
    iget-object v4, p0, Ls3/v0;->e:Ljava/util/List;

    .line 10
    .line 11
    iget-object v5, p0, Ls3/v0;->f:Ljava/util/List;

    .line 12
    .line 13
    iget-object v6, p0, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 14
    .line 15
    iget-object v7, p0, Ls3/v0;->h:Ls3/b0;

    .line 16
    .line 17
    iget-object v8, p0, Ls3/v0;->i:Ljava/lang/Long;

    .line 18
    .line 19
    iget-object v9, p0, Ls3/v0;->j:Ljava/lang/Long;

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    return v0
.end method
