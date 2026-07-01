.class public final LM3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public e:I

.field public f:I

.field public g:I

.field public h:LJ3/c;

.field public final synthetic i:LM3/c;


# direct methods
.method public constructor <init>(LM3/c;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM3/b;->i:LM3/c;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, LM3/b;->e:I

    .line 8
    .line 9
    iget-object p1, p1, LM3/c;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-ltz p1, :cond_1

    .line 16
    .line 17
    if-gez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput p1, p0, LM3/b;->f:I

    .line 22
    .line 23
    iput p1, p0, LM3/b;->g:I

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 27
    .line 28
    const-string v1, "Cannot coerce value to an empty range: maximum "

    .line 29
    .line 30
    const-string v2, " is less than minimum 0."

    .line 31
    .line 32
    invoke-static {p1, v1, v2}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw v0
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget-object v0, p0, LM3/b;->i:LM3/c;

    .line 2
    .line 3
    iget-object v1, v0, LM3/c;->a:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget v2, p0, LM3/b;->g:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-gez v2, :cond_0

    .line 9
    .line 10
    iput v3, p0, LM3/b;->e:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, LM3/b;->h:LJ3/c;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, -0x1

    .line 21
    const/4 v6, 0x1

    .line 22
    if-le v2, v4, :cond_1

    .line 23
    .line 24
    new-instance v0, LJ3/c;

    .line 25
    .line 26
    iget v2, p0, LM3/b;->f:I

    .line 27
    .line 28
    invoke-static {v1}, LM3/l;->d0(Ljava/lang/CharSequence;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {v0, v2, v1, v6}, LJ3/a;-><init>(III)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, LM3/b;->h:LJ3/c;

    .line 36
    .line 37
    iput v5, p0, LM3/b;->g:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget-object v0, v0, LM3/c;->b:LM3/k;

    .line 41
    .line 42
    iget v2, p0, LM3/b;->g:I

    .line 43
    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v1, v2}, LM3/k;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ly3/c;

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    new-instance v0, LJ3/c;

    .line 57
    .line 58
    iget v2, p0, LM3/b;->f:I

    .line 59
    .line 60
    invoke-static {v1}, LM3/l;->d0(Ljava/lang/CharSequence;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-direct {v0, v2, v1, v6}, LJ3/a;-><init>(III)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, LM3/b;->h:LJ3/c;

    .line 68
    .line 69
    iput v5, p0, LM3/b;->g:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-object v1, v0, Ly3/c;->e:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v1, Ljava/lang/Number;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget-object v0, v0, Ly3/c;->f:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v0, Ljava/lang/Number;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget v2, p0, LM3/b;->f:I

    .line 89
    .line 90
    const/high16 v4, -0x80000000

    .line 91
    .line 92
    if-gt v1, v4, :cond_3

    .line 93
    .line 94
    sget-object v2, LJ3/c;->h:LJ3/c;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    new-instance v4, LJ3/c;

    .line 98
    .line 99
    add-int/lit8 v5, v1, -0x1

    .line 100
    .line 101
    invoke-direct {v4, v2, v5, v6}, LJ3/a;-><init>(III)V

    .line 102
    .line 103
    .line 104
    move-object v2, v4

    .line 105
    :goto_0
    iput-object v2, p0, LM3/b;->h:LJ3/c;

    .line 106
    .line 107
    add-int/2addr v1, v0

    .line 108
    iput v1, p0, LM3/b;->f:I

    .line 109
    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    move v3, v6

    .line 113
    :cond_4
    add-int/2addr v1, v3

    .line 114
    iput v1, p0, LM3/b;->g:I

    .line 115
    .line 116
    :goto_1
    iput v6, p0, LM3/b;->e:I

    .line 117
    .line 118
    return-void
.end method

.method public final hasNext()Z
    .locals 2

    .line 1
    iget v0, p0, LM3/b;->e:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, LM3/b;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, LM3/b;->e:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LM3/b;->e:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, LM3/b;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, LM3/b;->e:I

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, LM3/b;->h:LJ3/c;

    .line 14
    .line 15
    const-string v2, "null cannot be cast to non-null type kotlin.ranges.IntRange"

    .line 16
    .line 17
    invoke-static {v0, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput-object v2, p0, LM3/b;->h:LJ3/c;

    .line 22
    .line 23
    iput v1, p0, LM3/b;->e:I

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 29
    .line 30
    .line 31
    throw v0
.end method

.method public final remove()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v1, "Operation is not supported for read-only collection"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method
