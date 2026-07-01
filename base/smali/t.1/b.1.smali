.class public final Lt/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/core/graphics/drawable/IconCompat;

.field public final b:Ljava/lang/CharSequence;

.field public final c:Landroid/app/PendingIntent;

.field public d:Z

.field public final e:Landroid/os/Bundle;

.field public f:Ljava/util/ArrayList;

.field public g:I

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lt/b;->d:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Lt/b;->h:Z

    .line 13
    .line 14
    iput-object p1, p0, Lt/b;->a:Landroidx/core/graphics/drawable/IconCompat;

    .line 15
    .line 16
    invoke-static {p2}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lt/b;->b:Ljava/lang/CharSequence;

    .line 21
    .line 22
    iput-object p3, p0, Lt/b;->c:Landroid/app/PendingIntent;

    .line 23
    .line 24
    iput-object v0, p0, Lt/b;->e:Landroid/os/Bundle;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lt/b;->f:Ljava/util/ArrayList;

    .line 28
    .line 29
    iput-boolean v1, p0, Lt/b;->d:Z

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput p1, p0, Lt/b;->g:I

    .line 33
    .line 34
    iput-boolean v1, p0, Lt/b;->h:Z

    .line 35
    .line 36
    iput-boolean p1, p0, Lt/b;->i:Z

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final a()Lt/c;
    .locals 15

    .line 1
    iget-boolean v0, p0, Lt/b;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lt/b;->c:Landroid/app/PendingIntent;

    .line 7
    .line 8
    if-eqz v0, :cond_6

    .line 9
    .line 10
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lt/b;->f:Ljava/util/ArrayList;

    .line 21
    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    :goto_1
    if-ge v4, v3, :cond_3

    .line 30
    .line 31
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    add-int/lit8 v4, v4, 0x1

    .line 36
    .line 37
    check-cast v5, Lt/J;

    .line 38
    .line 39
    iget-boolean v6, v5, Lt/J;->c:Z

    .line 40
    .line 41
    if-nez v6, :cond_2

    .line 42
    .line 43
    iget-object v6, v5, Lt/J;->b:[Ljava/lang/CharSequence;

    .line 44
    .line 45
    if-eqz v6, :cond_1

    .line 46
    .line 47
    array-length v6, v6

    .line 48
    if-nez v6, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-object v6, v5, Lt/J;->e:Ljava/util/HashSet;

    .line 51
    .line 52
    invoke-virtual {v6}, Ljava/util/HashSet;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-nez v6, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    const/4 v3, 0x0

    .line 71
    if-eqz v2, :cond_4

    .line 72
    .line 73
    move-object v10, v3

    .line 74
    goto :goto_2

    .line 75
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    new-array v2, v2, [Lt/J;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, [Lt/J;

    .line 86
    .line 87
    move-object v10, v0

    .line 88
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    :goto_3
    move-object v9, v3

    .line 95
    goto :goto_4

    .line 96
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    new-array v0, v0, [Lt/J;

    .line 101
    .line 102
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    move-object v3, v0

    .line 107
    check-cast v3, [Lt/J;

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :goto_4
    new-instance v4, Lt/c;

    .line 111
    .line 112
    iget-boolean v11, p0, Lt/b;->d:Z

    .line 113
    .line 114
    iget v12, p0, Lt/b;->g:I

    .line 115
    .line 116
    iget-boolean v13, p0, Lt/b;->h:Z

    .line 117
    .line 118
    iget-boolean v14, p0, Lt/b;->i:Z

    .line 119
    .line 120
    iget-object v5, p0, Lt/b;->a:Landroidx/core/graphics/drawable/IconCompat;

    .line 121
    .line 122
    iget-object v6, p0, Lt/b;->b:Ljava/lang/CharSequence;

    .line 123
    .line 124
    iget-object v7, p0, Lt/b;->c:Landroid/app/PendingIntent;

    .line 125
    .line 126
    iget-object v8, p0, Lt/b;->e:Landroid/os/Bundle;

    .line 127
    .line 128
    invoke-direct/range {v4 .. v14}, Lt/c;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lt/J;[Lt/J;ZIZZ)V

    .line 129
    .line 130
    .line 131
    return-object v4

    .line 132
    :cond_6
    new-instance v0, Ljava/lang/NullPointerException;

    .line 133
    .line 134
    const-string v1, "Contextual Actions must contain a valid PendingIntent"

    .line 135
    .line 136
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw v0
.end method
