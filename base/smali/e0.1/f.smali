.class public final Le0/f;
.super LT0/a;
.source "SourceFile"


# instance fields
.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/String;

.field public final l:I

.field public final m:LJ0/o;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Le0/a;I)V
    .locals 3

    .line 1
    const-string p3, "value"

    .line 2
    .line 3
    invoke-static {p1, p3}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p3, "verificationMode"

    .line 7
    .line 8
    invoke-static {p3, p4}, LE1/j;->o(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const/16 p3, 0xb

    .line 12
    .line 13
    invoke-direct {p0, p3}, LT0/a;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Le0/f;->j:Ljava/lang/Object;

    .line 17
    .line 18
    iput-object p2, p0, Le0/f;->k:Ljava/lang/String;

    .line 19
    .line 20
    iput p4, p0, Le0/f;->l:I

    .line 21
    .line 22
    new-instance p3, LJ0/o;

    .line 23
    .line 24
    invoke-static {p1, p2}, LT0/a;->k(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "message"

    .line 29
    .line 30
    invoke-static {p1, p2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string p2, "stackTrace"

    .line 41
    .line 42
    invoke-static {p1, p2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    array-length p2, p1

    .line 46
    add-int/lit8 p2, p2, -0x2

    .line 47
    .line 48
    const/4 p4, 0x0

    .line 49
    if-gez p2, :cond_0

    .line 50
    .line 51
    move p2, p4

    .line 52
    :cond_0
    if-ltz p2, :cond_7

    .line 53
    .line 54
    if-nez p2, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    array-length v0, p1

    .line 58
    const/4 v1, 0x1

    .line 59
    if-lt p2, v0, :cond_4

    .line 60
    .line 61
    array-length p2, p1

    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    if-eq p2, v1, :cond_2

    .line 65
    .line 66
    new-instance p2, Ljava/util/ArrayList;

    .line 67
    .line 68
    new-instance v0, Lz3/a;

    .line 69
    .line 70
    invoke-direct {v0, p1, p4}, Lz3/a;-><init>([Ljava/lang/Object;Z)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    aget-object p1, p1, p4

    .line 78
    .line 79
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    goto :goto_2

    .line 84
    :cond_3
    :goto_0
    sget-object p2, Lz3/l;->e:Lz3/l;

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    if-ne p2, v1, :cond_5

    .line 88
    .line 89
    sub-int/2addr v0, v1

    .line 90
    aget-object p1, p1, v0

    .line 91
    .line 92
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    new-instance v1, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 100
    .line 101
    .line 102
    sub-int p2, v0, p2

    .line 103
    .line 104
    :goto_1
    if-ge p2, v0, :cond_6

    .line 105
    .line 106
    aget-object v2, p1, p2

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    add-int/lit8 p2, p2, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_6
    move-object p2, v1

    .line 115
    :goto_2
    new-array p1, p4, [Ljava/lang/StackTraceElement;

    .line 116
    .line 117
    invoke-interface {p2, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, [Ljava/lang/StackTraceElement;

    .line 122
    .line 123
    invoke-virtual {p3, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 124
    .line 125
    .line 126
    iput-object p3, p0, Le0/f;->m:LJ0/o;

    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    const-string p1, "Requested element count "

    .line 130
    .line 131
    const-string p3, " is less than zero."

    .line 132
    .line 133
    invoke-static {p2, p1, p3}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    throw p2
.end method


# virtual methods
.method public final G(Ljava/lang/String;LH3/l;)LT0/a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public final e()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Le0/f;->l:I

    .line 2
    .line 3
    invoke-static {v0}, LL/i;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_0
    new-instance v0, LD1/n;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    .line 20
    .line 21
    .line 22
    throw v0

    .line 23
    :cond_1
    iget-object v0, p0, Le0/f;->j:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v1, p0, Le0/f;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v1}, LT0/a;->k(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "message"

    .line 32
    .line 33
    invoke-static {v0, v1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v1, "g"

    .line 37
    .line 38
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_2
    iget-object v0, p0, Le0/f;->m:LJ0/o;

    .line 43
    .line 44
    throw v0
.end method
