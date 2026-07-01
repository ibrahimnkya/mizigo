.class public final LL/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:LA0/c;

.field public final c:LH3/l;

.field public final d:LN3/t;

.field public final e:Ljava/lang/Object;

.field public volatile f:LE/i;


# direct methods
.method public constructor <init>(Ljava/lang/String;LA0/c;LH3/l;LN3/t;)V
    .locals 1

    .line 1
    const-string v0, "name"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LL/b;->a:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p2, p0, LL/b;->b:LA0/c;

    .line 12
    .line 13
    iput-object p3, p0, LL/b;->c:LH3/l;

    .line 14
    .line 15
    iput-object p4, p0, LL/b;->d:LN3/t;

    .line 16
    .line 17
    new-instance p1, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, LL/b;->e:Ljava/lang/Object;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;LK3/c;)LE/i;
    .locals 6

    .line 1
    const-string v0, "thisRef"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "property"

    .line 7
    .line 8
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, LL/b;->f:LE/i;

    .line 12
    .line 13
    if-nez p2, :cond_2

    .line 14
    .line 15
    iget-object p2, p0, LL/b;->e:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter p2

    .line 18
    :try_start_0
    iget-object v0, p0, LL/b;->f:LE/i;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, LL/b;->b:LA0/c;

    .line 27
    .line 28
    iget-object v1, p0, LL/b;->c:LH3/l;

    .line 29
    .line 30
    const-string v2, "applicationContext"

    .line 31
    .line 32
    invoke-static {p1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, p1}, LH3/l;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/util/List;

    .line 40
    .line 41
    iget-object v2, p0, LL/b;->d:LN3/t;

    .line 42
    .line 43
    new-instance v3, LK/a;

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    invoke-direct {v3, v4, p1, p0}, LK/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    const-string p1, "migrations"

    .line 50
    .line 51
    invoke-static {v1, p1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance p1, LI/U;

    .line 55
    .line 56
    new-instance v4, LI/T;

    .line 57
    .line 58
    const/4 v5, 0x1

    .line 59
    invoke-direct {v4, v5, v3}, LI/T;-><init>(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p1, v4}, LI/U;-><init>(LI/T;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, LE/i;

    .line 66
    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    new-instance v0, LN0/f;

    .line 71
    .line 72
    const/4 v4, 0x2

    .line 73
    invoke-direct {v0, v4}, LN0/f;-><init>(I)V

    .line 74
    .line 75
    .line 76
    :goto_0
    new-instance v4, LI/e;

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    invoke-direct {v4, v1, v5}, LI/e;-><init>(Ljava/util/List;LA3/d;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v4}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    new-instance v4, LI/O;

    .line 87
    .line 88
    invoke-direct {v4, p1, v1, v0, v2}, LI/O;-><init>(LI/U;Ljava/util/List;LI/c;LN3/t;)V

    .line 89
    .line 90
    .line 91
    const/4 p1, 0x5

    .line 92
    invoke-direct {v3, p1, v4}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    new-instance p1, LE/i;

    .line 96
    .line 97
    const/4 v0, 0x5

    .line 98
    invoke-direct {p1, v0, v3}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iput-object p1, p0, LL/b;->f:LE/i;

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :catchall_0
    move-exception p1

    .line 105
    goto :goto_2

    .line 106
    :cond_1
    :goto_1
    iget-object p1, p0, LL/b;->f:LE/i;

    .line 107
    .line 108
    invoke-static {p1}, LI3/h;->b(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    .line 110
    .line 111
    monitor-exit p2

    .line 112
    return-object p1

    .line 113
    :goto_2
    monitor-exit p2

    .line 114
    throw p1

    .line 115
    :cond_2
    return-object p2
.end method
