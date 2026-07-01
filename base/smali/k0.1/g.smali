.class public final Lk0/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "verificationMode"

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v0, v1}, LE1/j;->o(Ljava/lang/String;I)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput v1, p0, Lk0/g;->a:I

    .line 11
    .line 12
    return-void
.end method

.method public static a(Landroidx/window/sidecar/SidecarDisplayFeature;Landroidx/window/sidecar/SidecarDisplayFeature;)Z
    .locals 2

    .line 1
    invoke-static {p0, p1}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    if-nez p0, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    if-nez p1, :cond_2

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_2
    invoke-virtual {p0}, Landroidx/window/sidecar/SidecarDisplayFeature;->getType()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroidx/window/sidecar/SidecarDisplayFeature;->getType()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eq v0, v1, :cond_3

    .line 24
    .line 25
    :goto_0
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_3
    invoke-virtual {p0}, Landroidx/window/sidecar/SidecarDisplayFeature;->getRect()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1}, Landroidx/window/sidecar/SidecarDisplayFeature;->getRect()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p0, p1}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public static b(Ljava/util/List;Ljava/util/List;)Z
    .locals 5

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    move v1, v2

    .line 21
    :goto_0
    if-ge v1, v0, :cond_3

    .line 22
    .line 23
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroidx/window/sidecar/SidecarDisplayFeature;

    .line 28
    .line 29
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Landroidx/window/sidecar/SidecarDisplayFeature;

    .line 34
    .line 35
    invoke-static {v3, v4}, Lk0/g;->a(Landroidx/window/sidecar/SidecarDisplayFeature;Landroidx/window/sidecar/SidecarDisplayFeature;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_2

    .line 40
    .line 41
    :goto_1
    return v2

    .line 42
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    :goto_2
    const/4 p0, 0x1

    .line 46
    return p0
.end method


# virtual methods
.method public final c(Landroidx/window/sidecar/SidecarWindowLayoutInfo;Landroidx/window/sidecar/SidecarDeviceState;)Lh0/j;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lh0/j;

    .line 4
    .line 5
    sget-object p2, Lz3/l;->e:Lz3/l;

    .line 6
    .line 7
    invoke-direct {p1, p2}, Lh0/j;-><init>(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-object p1

    .line 11
    :cond_0
    new-instance v0, Landroidx/window/sidecar/SidecarDeviceState;

    .line 12
    .line 13
    invoke-direct {v0}, Landroidx/window/sidecar/SidecarDeviceState;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Lk0/b;->b(Landroidx/window/sidecar/SidecarDeviceState;)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-static {v0, p2}, Lk0/b;->d(Landroidx/window/sidecar/SidecarDeviceState;I)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Lk0/b;->c(Landroidx/window/sidecar/SidecarWindowLayoutInfo;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1, v0}, Lk0/g;->d(Ljava/util/List;Landroidx/window/sidecar/SidecarDeviceState;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Lh0/j;

    .line 32
    .line 33
    invoke-direct {p2, p1}, Lh0/j;-><init>(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-object p2
.end method

.method public final d(Ljava/util/List;Landroidx/window/sidecar/SidecarDeviceState;)Ljava/util/ArrayList;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroidx/window/sidecar/SidecarDisplayFeature;

    .line 21
    .line 22
    invoke-virtual {p0, v1, p2}, Lk0/g;->e(Landroidx/window/sidecar/SidecarDisplayFeature;Landroidx/window/sidecar/SidecarDeviceState;)Lh0/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-object v0
.end method

.method public final e(Landroidx/window/sidecar/SidecarDisplayFeature;Landroidx/window/sidecar/SidecarDeviceState;)Lh0/c;
    .locals 4

    .line 1
    sget-object v0, Lh0/b;->i:Lh0/b;

    .line 2
    .line 3
    const-string v1, "feature"

    .line 4
    .line 5
    invoke-static {p1, v1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "verificationMode"

    .line 9
    .line 10
    iget v2, p0, Lk0/g;->a:I

    .line 11
    .line 12
    invoke-static {v1, v2}, LE1/j;->o(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Le0/g;

    .line 16
    .line 17
    sget-object v3, Le0/a;->a:Le0/a;

    .line 18
    .line 19
    invoke-direct {v1, p1, v2, v3}, Le0/g;-><init>(Ljava/lang/Object;ILe0/a;)V

    .line 20
    .line 21
    .line 22
    const-string v2, "Type must be either TYPE_FOLD or TYPE_HINGE"

    .line 23
    .line 24
    sget-object v3, Lk0/c;->f:Lk0/c;

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Le0/g;->G(Ljava/lang/String;LH3/l;)LT0/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "Feature bounds must not be 0"

    .line 31
    .line 32
    sget-object v3, Lk0/d;->f:Lk0/d;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, LT0/a;->G(Ljava/lang/String;LH3/l;)LT0/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "TYPE_FOLD must have 0 area"

    .line 39
    .line 40
    sget-object v3, Lk0/e;->f:Lk0/e;

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, LT0/a;->G(Ljava/lang/String;LH3/l;)LT0/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "Feature be pinned to either left or top"

    .line 47
    .line 48
    sget-object v3, Lk0/f;->f:Lk0/f;

    .line 49
    .line 50
    invoke-virtual {v1, v2, v3}, LT0/a;->G(Ljava/lang/String;LH3/l;)LT0/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, LT0/a;->e()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Landroidx/window/sidecar/SidecarDisplayFeature;

    .line 59
    .line 60
    if-nez v1, :cond_0

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_0
    invoke-virtual {v1}, Landroidx/window/sidecar/SidecarDisplayFeature;->getType()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const/4 v2, 0x2

    .line 68
    const/4 v3, 0x1

    .line 69
    if-eq v1, v3, :cond_2

    .line 70
    .line 71
    if-eq v1, v2, :cond_1

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_1
    sget-object v1, Lh0/b;->l:Lh0/b;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    sget-object v1, Lh0/b;->k:Lh0/b;

    .line 78
    .line 79
    :goto_0
    invoke-static {p2}, Lk0/b;->b(Landroidx/window/sidecar/SidecarDeviceState;)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_5

    .line 84
    .line 85
    if-eq p2, v3, :cond_5

    .line 86
    .line 87
    if-eq p2, v2, :cond_3

    .line 88
    .line 89
    const/4 v2, 0x3

    .line 90
    if-eq p2, v2, :cond_4

    .line 91
    .line 92
    const/4 v2, 0x4

    .line 93
    if-eq p2, v2, :cond_5

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    sget-object v0, Lh0/b;->j:Lh0/b;

    .line 97
    .line 98
    :cond_4
    :goto_1
    new-instance p2, Lh0/c;

    .line 99
    .line 100
    new-instance v2, Le0/b;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroidx/window/sidecar/SidecarDisplayFeature;->getRect()Landroid/graphics/Rect;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const-string v3, "feature.rect"

    .line 107
    .line 108
    invoke-static {p1, v3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {v2, p1}, Le0/b;-><init>(Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p2, v2, v1, v0}, Lh0/c;-><init>(Le0/b;Lh0/b;Lh0/b;)V

    .line 115
    .line 116
    .line 117
    return-object p2

    .line 118
    :cond_5
    :goto_2
    const/4 p1, 0x0

    .line 119
    return-object p1
.end method
