.class public final Ls3/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc1/a;


# instance fields
.field public final e:Landroid/content/Context;

.field public final f:Ljava/util/HashMap;

.field public final g:LZ2/s;

.field public h:Ll2/b;

.field public i:LB2/a;

.field public final j:Ls3/r0;

.field public k:Ls3/j;

.field public l:Ls3/j;


# direct methods
.method public constructor <init>(LZ2/s;Landroid/content/Context;Ls3/r0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ls3/g;->f:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p2, p0, Ls3/g;->e:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p1, p0, Ls3/g;->g:LZ2/s;

    .line 14
    .line 15
    iput-object p3, p0, Ls3/g;->j:Ls3/r0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/g;->f:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Li2/c;

    .line 28
    .line 29
    invoke-virtual {v1}, Li2/c;->H()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public final a(Ljava/util/List;)V
    .locals 5

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ls3/a0;

    .line 16
    .line 17
    iget-object v0, v0, Ls3/a0;->a:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v1, Li2/c;

    .line 20
    .line 21
    iget-object v2, p0, Ls3/g;->i:LB2/a;

    .line 22
    .line 23
    iget-object v3, p0, Ls3/g;->h:Ll2/b;

    .line 24
    .line 25
    iget-object v4, p0, Ls3/g;->e:Landroid/content/Context;

    .line 26
    .line 27
    invoke-direct {v1, v4, v2, v3}, Li2/c;-><init>(Landroid/content/Context;LB2/a;Ll2/b;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ls3/g;->j:Ls3/r0;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x1

    .line 37
    if-eq v2, v3, :cond_0

    .line 38
    .line 39
    new-instance v2, Ls3/f;

    .line 40
    .line 41
    iget-object v3, p0, Ls3/g;->i:LB2/a;

    .line 42
    .line 43
    invoke-direct {v2, v4, v3, v1, p0}, Ls3/f;-><init>(Landroid/content/Context;LB2/a;Li2/c;Ls3/g;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    new-instance v2, Ls3/e;

    .line 48
    .line 49
    iget-object v3, p0, Ls3/g;->i:LB2/a;

    .line 50
    .line 51
    invoke-direct {v2, v4, v3, v1, p0}, Ls3/e;-><init>(Landroid/content/Context;LB2/a;Li2/c;Ls3/g;)V

    .line 52
    .line 53
    .line 54
    :goto_1
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    invoke-interface {v3, v4}, Lk2/a;->c(Ls3/g;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 61
    .line 62
    invoke-interface {v3, v4}, Lk2/a;->e(Ls3/j;)V

    .line 63
    .line 64
    .line 65
    iget-object v3, v1, Li2/c;->g:Ll2/a;

    .line 66
    .line 67
    invoke-virtual {v3}, Ll2/a;->a()V

    .line 68
    .line 69
    .line 70
    iget-object v3, v1, Li2/c;->f:Ll2/a;

    .line 71
    .line 72
    invoke-virtual {v3}, Ll2/a;->a()V

    .line 73
    .line 74
    .line 75
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 76
    .line 77
    invoke-interface {v3}, Lk2/a;->d()V

    .line 78
    .line 79
    .line 80
    iput-object v2, v1, Li2/c;->i:Lk2/a;

    .line 81
    .line 82
    invoke-interface {v2}, Lk2/a;->b()V

    .line 83
    .line 84
    .line 85
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 86
    .line 87
    iget-object v3, v1, Li2/c;->o:Ls3/g;

    .line 88
    .line 89
    invoke-interface {v2, v3}, Lk2/a;->c(Ls3/g;)V

    .line 90
    .line 91
    .line 92
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 98
    .line 99
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 103
    .line 104
    iget-object v3, v1, Li2/c;->n:Ls3/j;

    .line 105
    .line 106
    invoke-interface {v2, v3}, Lk2/a;->e(Ls3/j;)V

    .line 107
    .line 108
    .line 109
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    iget-object v2, v1, Li2/c;->i:Lk2/a;

    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Li2/c;->a()V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Ls3/g;->k:Ls3/j;

    .line 123
    .line 124
    iput-object p0, v1, Li2/c;->o:Ls3/g;

    .line 125
    .line 126
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 127
    .line 128
    invoke-interface {v3, p0}, Lk2/a;->c(Ls3/g;)V

    .line 129
    .line 130
    .line 131
    iput-object v2, v1, Li2/c;->n:Ls3/j;

    .line 132
    .line 133
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 134
    .line 135
    invoke-interface {v3, v2}, Lk2/a;->e(Ls3/j;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ls3/g;->f:Ljava/util/HashMap;

    .line 139
    .line 140
    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_1
    return-void
.end method

.method public final b(Li2/a;)V
    .locals 6

    .line 1
    invoke-interface {p1}, Li2/a;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Li2/a;->b()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    new-array v2, v1, [Ls3/t;

    .line 13
    .line 14
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, [Ls3/t;

    .line 19
    .line 20
    aget-object v0, v0, v1

    .line 21
    .line 22
    iget-object v0, v0, Ls3/t;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, p1}, Landroid/support/v4/media/session/a;->e(Ljava/lang/String;Li2/a;)Ls3/Z;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, LK0/h;

    .line 29
    .line 30
    const/16 v1, 0x11

    .line 31
    .line 32
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onClusterTap"

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ls3/g;->g:LZ2/s;

    .line 43
    .line 44
    iget-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v3, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v3, LV1/y;

    .line 56
    .line 57
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v2, Lk3/f;

    .line 60
    .line 61
    sget-object v4, Ls3/B;->d:Ls3/B;

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-direct {v3, v2, v1, v4, v5}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 74
    .line 75
    .line 76
    new-instance p1, LV1/n;

    .line 77
    .line 78
    const/16 v4, 0x9

    .line 79
    .line 80
    invoke-direct {p1, v0, v1, v4}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, v2, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method
