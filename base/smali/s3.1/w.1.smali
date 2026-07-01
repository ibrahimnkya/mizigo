.class public final Ls3/w;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public final c:Ljava/util/HashMap;

.field public final d:LZ2/s;

.field public e:Ll2/a;

.field public final f:Ls3/g;

.field public final g:Landroid/content/res/AssetManager;

.field public final h:F

.field public final i:LN1/e;

.field public final j:Ls3/r0;


# direct methods
.method public constructor <init>(LZ2/s;Ls3/g;Landroid/content/res/AssetManager;FLN1/e;Ls3/r0;)V
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
    iput-object v0, p0, Ls3/w;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ls3/w;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ls3/w;->c:Ljava/util/HashMap;

    .line 24
    .line 25
    iput-object p1, p0, Ls3/w;->d:LZ2/s;

    .line 26
    .line 27
    iput-object p2, p0, Ls3/w;->f:Ls3/g;

    .line 28
    .line 29
    iput-object p3, p0, Ls3/w;->g:Landroid/content/res/AssetManager;

    .line 30
    .line 31
    iput p4, p0, Ls3/w;->h:F

    .line 32
    .line 33
    iput-object p5, p0, Ls3/w;->i:LN1/e;

    .line 34
    .line 35
    iput-object p6, p0, Ls3/w;->j:Ls3/r0;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final a(Ls3/p0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ls3/p0;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ls3/p0;->m:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ls3/t;

    .line 6
    .line 7
    iget-object v3, p0, Ls3/w;->j:Ls3/r0;

    .line 8
    .line 9
    invoke-direct {v2, v0, v1, v3}, Ls3/t;-><init>(Ljava/lang/String;Ljava/lang/String;Ls3/r0;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ls3/w;->h:F

    .line 13
    .line 14
    iget-object v1, p0, Ls3/w;->i:LN1/e;

    .line 15
    .line 16
    iget-object v3, p0, Ls3/w;->g:Landroid/content/res/AssetManager;

    .line 17
    .line 18
    invoke-static {p1, v2, v3, v0, v1}, Landroid/support/v4/media/session/a;->x(Ls3/p0;Ls3/v;Landroid/content/res/AssetManager;FLN1/e;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ls3/w;->a:Ljava/util/HashMap;

    .line 22
    .line 23
    iget-object v0, v2, Ls3/t;->d:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object p1, v2, Ls3/t;->c:Ljava/lang/String;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ls3/w;->e:Ll2/a;

    .line 33
    .line 34
    iget-object v1, p1, Ll2/a;->g:Ll2/b;

    .line 35
    .line 36
    iget-object v1, v1, Ll2/b;->f:LB2/a;

    .line 37
    .line 38
    iget-object v3, v2, Ls3/t;->a:Le1/p;

    .line 39
    .line 40
    invoke-virtual {v1, v3}, LB2/a;->e(Le1/p;)Le1/o;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v3, p1, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 45
    .line 46
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v3, p1, Ll2/a;->b:Ll2/b;

    .line 50
    .line 51
    iget-object v3, v3, Ll2/b;->e:Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-virtual {v3, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    iget-boolean p1, v2, Ls3/t;->e:Z

    .line 57
    .line 58
    new-instance v2, Ls3/u;

    .line 59
    .line 60
    invoke-direct {v2, v1, p1}, Ls3/u;-><init>(Le1/o;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ls3/w;->b:Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ls3/w;->c:Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-virtual {v1}, Le1/o;->a()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Ls3/w;->f:Ls3/g;

    .line 79
    .line 80
    iget-object v0, v0, Ls3/g;->f:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Li2/c;

    .line 87
    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    iget-object v0, p1, Li2/c;->h:Lj2/d;

    .line 91
    .line 92
    iget-object v1, v0, LS/b;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 101
    .line 102
    .line 103
    :try_start_0
    iget-object v1, v0, Lj2/d;->b:Lj2/c;

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Lj2/c;->h(Ls3/t;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, LS/b;->g()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Li2/c;->a()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :catchall_0
    move-exception p1

    .line 116
    invoke-virtual {v0}, LS/b;->g()V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :cond_1
    return-void
.end method

.method public final b(Ljava/lang/String;)Z
    .locals 6

    .line 1
    new-instance v0, LK0/h;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onMarkerTap"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ls3/w;->d:LZ2/s;

    .line 16
    .line 17
    iget-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v3, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v3, LV1/y;

    .line 29
    .line 30
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Lk3/f;

    .line 33
    .line 34
    sget-object v4, Ls3/B;->d:Ls3/B;

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-direct {v3, v2, v1, v4, v5}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 47
    .line 48
    .line 49
    new-instance v4, LV1/n;

    .line 50
    .line 51
    const/16 v5, 0x10

    .line 52
    .line 53
    invoke-direct {v4, v0, v1, v5}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v2, v4}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ls3/w;->b:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ls3/u;

    .line 66
    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    iget-boolean p1, p1, Ls3/u;->c:Z

    .line 70
    .line 71
    return p1

    .line 72
    :cond_0
    const/4 p1, 0x0

    .line 73
    return p1
.end method

.method public final c(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/w;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ls3/t;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v1, p0, Ls3/w;->b:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ls3/u;

    .line 19
    .line 20
    iget-object v1, v0, Ls3/t;->c:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v2, p0, Ls3/w;->f:Ls3/g;

    .line 25
    .line 26
    iget-object v2, v2, Ls3/g;->f:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Li2/c;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    iget-object v2, v1, Li2/c;->h:Lj2/d;

    .line 37
    .line 38
    iget-object v3, v2, LS/b;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v3, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 47
    .line 48
    .line 49
    :try_start_0
    iget-object v3, v2, Lj2/d;->b:Lj2/c;

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Lj2/c;->k(Ls3/t;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, LS/b;->g()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Li2/c;->a()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p1

    .line 62
    invoke-virtual {v2}, LS/b;->g()V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :cond_1
    if-eqz p1, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Ls3/w;->e:Ll2/a;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v1, p1, Ls3/u;->a:Ljava/lang/ref/WeakReference;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Le1/o;

    .line 79
    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v2, v0, Ll2/a;->b:Ll2/b;

    .line 84
    .line 85
    iget-object v0, v0, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 86
    .line 87
    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    iget-object v0, v2, Ll2/b;->e:Ljava/util/HashMap;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll2/b;->d(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Ls3/w;->c:Ljava/util/HashMap;

    .line 104
    .line 105
    iget-object p1, p1, Ls3/u;->b:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    :cond_4
    :goto_1
    return-void
.end method
