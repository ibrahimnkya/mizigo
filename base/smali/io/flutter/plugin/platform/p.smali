.class public final Lio/flutter/plugin/platform/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/flutter/plugin/platform/i;


# static fields
.field public static final B:[Ljava/lang/Class;


# instance fields
.field public final A:Lio/flutter/plugin/platform/m;

.field public final e:Lio/flutter/plugin/platform/m;

.field public f:LZ2/a;

.field public g:LZ2/d;

.field public h:LZ2/p;

.field public i:Lio/flutter/embedding/engine/FlutterJNI;

.field public j:Lio/flutter/embedding/engine/renderer/j;

.field public k:Lio/flutter/plugin/editing/k;

.field public l:LZ2/s;

.field public final m:Lio/flutter/plugin/platform/a;

.field public final n:Ljava/util/HashMap;

.field public final o:Ljava/util/HashMap;

.field public final p:Landroid/util/SparseArray;

.field public final q:Landroid/util/SparseArray;

.field public final r:Landroid/util/SparseArray;

.field public final s:Landroid/util/SparseArray;

.field public t:I

.field public u:Z

.field public v:Z

.field public final w:Ljava/util/HashSet;

.field public final x:Ljava/util/HashSet;

.field public final y:LZ2/s;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Landroid/view/SurfaceView;

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lio/flutter/plugin/platform/p;->B:[Ljava/lang/Class;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lio/flutter/plugin/platform/p;->t:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lio/flutter/plugin/platform/p;->u:Z

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Lio/flutter/plugin/platform/p;->v:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lio/flutter/plugin/platform/p;->z:Z

    .line 16
    .line 17
    new-instance v0, Lio/flutter/plugin/platform/m;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, v1, p0}, Lio/flutter/plugin/platform/m;-><init>(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 24
    .line 25
    new-instance v0, Lio/flutter/plugin/platform/m;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-direct {v0, v1}, Lio/flutter/plugin/platform/m;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->e:Lio/flutter/plugin/platform/m;

    .line 32
    .line 33
    new-instance v0, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 39
    .line 40
    new-instance v0, Lio/flutter/plugin/platform/a;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 46
    .line 47
    new-instance v0, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->o:Ljava/util/HashMap;

    .line 53
    .line 54
    new-instance v0, Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->r:Landroid/util/SparseArray;

    .line 60
    .line 61
    new-instance v0, Ljava/util/HashSet;

    .line 62
    .line 63
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->w:Ljava/util/HashSet;

    .line 67
    .line 68
    new-instance v0, Ljava/util/HashSet;

    .line 69
    .line 70
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->x:Ljava/util/HashSet;

    .line 74
    .line 75
    new-instance v0, Landroid/util/SparseArray;

    .line 76
    .line 77
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 81
    .line 82
    new-instance v0, Landroid/util/SparseArray;

    .line 83
    .line 84
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 88
    .line 89
    new-instance v0, Landroid/util/SparseArray;

    .line 90
    .line 91
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->q:Landroid/util/SparseArray;

    .line 95
    .line 96
    sget-object v0, LZ2/s;->h:LZ2/s;

    .line 97
    .line 98
    if-nez v0, :cond_0

    .line 99
    .line 100
    new-instance v0, LZ2/s;

    .line 101
    .line 102
    const/4 v1, 0x1

    .line 103
    invoke-direct {v0, v1}, LZ2/s;-><init>(I)V

    .line 104
    .line 105
    .line 106
    sput-object v0, LZ2/s;->h:LZ2/s;

    .line 107
    .line 108
    :cond_0
    sget-object v0, LZ2/s;->h:LZ2/s;

    .line 109
    .line 110
    iput-object v0, p0, Lio/flutter/plugin/platform/p;->y:LZ2/s;

    .line 111
    .line 112
    return-void
.end method

.method public static a(Lio/flutter/plugin/platform/p;Lj3/e;)V
    .locals 3

    .line 1
    iget p0, p1, Lj3/e;->g:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 10
    .line 11
    const-string v1, "Trying to create a view with unknown direction value: "

    .line 12
    .line 13
    const-string v2, "(view id: "

    .line 14
    .line 15
    invoke-static {p0, v1, v2}, LE1/j;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget p1, p1, Lj3/e;->a:I

    .line 20
    .line 21
    const-string v1, ")"

    .line 22
    .line 23
    invoke-static {p0, p1, v1}, LE1/j;->l(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public static e(I)V
    .locals 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    if-lt v0, p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 7
    .line 8
    const-string v2, "Trying to use platform views with API "

    .line 9
    .line 10
    const-string v3, ", required API level is: "

    .line 11
    .line 12
    invoke-static {v2, v0, v3, p0}, LE1/j;->k(Ljava/lang/String;ILjava/lang/String;I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw v1
.end method

.method public static k(Lio/flutter/embedding/engine/renderer/j;)Lio/flutter/plugin/platform/g;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    const/16 v1, 0x22

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    :goto_0
    invoke-virtual {p0, v0}, Lio/flutter/embedding/engine/renderer/j;->d(I)Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lio/flutter/plugin/platform/m;

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    invoke-direct {v0, v1}, Lio/flutter/plugin/platform/m;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object p0, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    if-lt v0, v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Lio/flutter/embedding/engine/renderer/j;->c()Lio/flutter/view/TextureRegistry$ImageTextureEntry;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, LX/z;

    .line 34
    .line 35
    invoke-direct {v0, p0}, LX/z;-><init>(Lio/flutter/view/TextureRegistry$ImageTextureEntry;)V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_2
    invoke-virtual {p0}, Lio/flutter/embedding/engine/renderer/j;->e()Lio/flutter/embedding/engine/renderer/g;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Lio/flutter/plugin/platform/w;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lio/flutter/plugin/platform/w;-><init>(Lio/flutter/embedding/engine/renderer/g;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method


# virtual methods
.method public final b(Lj3/e;Z)Lio/flutter/plugin/platform/e;
    .locals 4

    .line 1
    iget-object v0, p1, Lj3/e;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p1, Lj3/e;->a:I

    .line 4
    .line 5
    iget-object v2, p0, Lio/flutter/plugin/platform/p;->e:Lio/flutter/plugin/platform/m;

    .line 6
    .line 7
    iget-object v2, v2, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lio/flutter/plugin/platform/f;

    .line 16
    .line 17
    if-eqz v2, :cond_3

    .line 18
    .line 19
    iget-object v0, p1, Lj3/e;->i:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v3, v2, Lio/flutter/plugin/platform/f;->a:Lk3/u;

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Lk3/u;->b(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    if-eqz p2, :cond_1

    .line 32
    .line 33
    new-instance p2, Landroid/content/MutableContextWrapper;

    .line 34
    .line 35
    iget-object v3, p0, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 36
    .line 37
    invoke-direct {p2, v3}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object p2, p0, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 42
    .line 43
    :goto_1
    invoke-virtual {v2, p2, v1, v0}, Lio/flutter/plugin/platform/f;->a(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/e;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p2}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget p1, p1, Lj3/e;->g:I

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutDirection(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 59
    .line 60
    invoke-virtual {p1, v1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object p2

    .line 64
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 65
    .line 66
    const-string p2, "PlatformView#getView() returned null, but an Android view reference was expected."

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p1

    .line 72
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 73
    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "Trying to create a platform view of unregistered type: "

    .line 77
    .line 78
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw p1
.end method

.method public final c(Lio/flutter/view/i;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 2
    .line 3
    iput-object p1, v0, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 4
    .line 5
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/p;->r:Landroid/util/SparseArray;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lio/flutter/plugin/platform/c;

    .line 15
    .line 16
    invoke-virtual {v1}, LZ2/i;->a()V

    .line 17
    .line 18
    .line 19
    iget-object v1, v1, LZ2/i;->e:Landroid/media/ImageReader;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final f(Z)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lio/flutter/plugin/platform/p;->r:Landroid/util/SparseArray;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/16 v4, 0x8

    .line 10
    .line 11
    if-ge v1, v3, :cond_3

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lio/flutter/plugin/platform/c;

    .line 22
    .line 23
    iget-object v5, p0, Lio/flutter/plugin/platform/p;->w:Ljava/util/HashSet;

    .line 24
    .line 25
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v5, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    iget-object v3, p0, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 36
    .line 37
    iget-object v3, v3, LZ2/p;->n:La3/c;

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    iget-object v3, v3, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, LZ2/i;->c(Lio/flutter/embedding/engine/renderer/j;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-virtual {v2}, LZ2/i;->e()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    and-int/2addr p1, v2

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    iget-boolean v3, p0, Lio/flutter/plugin/platform/p;->u:Z

    .line 53
    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    invoke-virtual {v2}, LZ2/i;->a()V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 63
    .line 64
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    move v1, v0

    .line 71
    :goto_2
    iget-object v2, p0, Lio/flutter/plugin/platform/p;->q:Landroid/util/SparseArray;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-ge v1, v3, :cond_6

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Landroid/view/View;

    .line 88
    .line 89
    iget-object v5, p0, Lio/flutter/plugin/platform/p;->x:Ljava/util/HashSet;

    .line 90
    .line 91
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v5, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_5

    .line 100
    .line 101
    if-nez p1, :cond_4

    .line 102
    .line 103
    iget-boolean v3, p0, Lio/flutter/plugin/platform/p;->v:Z

    .line 104
    .line 105
    if-nez v3, :cond_5

    .line 106
    .line 107
    :cond_4
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    return-void
.end method

.method public final g(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    return p1
.end method

.method public final h(I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lio/flutter/plugin/platform/B;

    .line 18
    .line 19
    invoke-virtual {p1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    return-object p1

    .line 24
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lio/flutter/plugin/platform/e;

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    return-object p1

    .line 36
    :cond_1
    invoke-interface {p1}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    return-object p1
.end method

.method public final i()F
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    return v0
.end method

.method public final j()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lio/flutter/plugin/platform/p;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Lio/flutter/plugin/platform/p;->u:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 10
    .line 11
    iget-object v1, v0, LZ2/p;->j:Landroid/view/View;

    .line 12
    .line 13
    invoke-interface {v1}, Lio/flutter/embedding/engine/renderer/m;->d()V

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, LZ2/p;->i:LZ2/i;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance v1, LZ2/i;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-direct {v1, v3, v4, v5, v2}, LZ2/i;-><init>(Landroid/content/Context;III)V

    .line 36
    .line 37
    .line 38
    iput-object v1, v0, LZ2/p;->i:LZ2/i;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v1, v3, v4}, LZ2/i;->g(II)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object v1, v0, LZ2/p;->j:Landroid/view/View;

    .line 56
    .line 57
    iput-object v1, v0, LZ2/p;->k:Landroid/view/View;

    .line 58
    .line 59
    iget-object v1, v0, LZ2/p;->i:LZ2/i;

    .line 60
    .line 61
    iput-object v1, v0, LZ2/p;->j:Landroid/view/View;

    .line 62
    .line 63
    iget-object v0, v0, LZ2/p;->n:La3/c;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, v0, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, LZ2/i;->c(Lio/flutter/embedding/engine/renderer/j;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iput-boolean v2, p0, Lio/flutter/plugin/platform/p;->u:Z

    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 5
    .line 6
    return-void
.end method

.method public final m()V
    .locals 15

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

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
    check-cast v1, Lio/flutter/plugin/platform/B;

    .line 22
    .line 23
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->f:Lio/flutter/plugin/platform/g;

    .line 24
    .line 25
    iget-object v3, v1, Lio/flutter/plugin/platform/B;->f:Lio/flutter/plugin/platform/g;

    .line 26
    .line 27
    invoke-interface {v2}, Lio/flutter/plugin/platform/g;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-interface {v3}, Lio/flutter/plugin/platform/g;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/view/View;->isFocused()Z

    .line 40
    .line 41
    .line 42
    move-result v14

    .line 43
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 44
    .line 45
    invoke-virtual {v2}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/u;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v4, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-virtual {v4, v5}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 53
    .line 54
    .line 55
    iget-object v4, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 58
    .line 59
    .line 60
    iget-object v4, v1, Lio/flutter/plugin/platform/B;->b:Landroid/content/Context;

    .line 61
    .line 62
    const-string v5, "display"

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Landroid/hardware/display/DisplayManager;

    .line 69
    .line 70
    new-instance v5, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v8, "flutter-vd#"

    .line 73
    .line 74
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget v8, v1, Lio/flutter/plugin/platform/B;->e:I

    .line 78
    .line 79
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    iget v8, v1, Lio/flutter/plugin/platform/B;->d:I

    .line 87
    .line 88
    invoke-interface {v3}, Lio/flutter/plugin/platform/g;->getSurface()Landroid/view/Surface;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    sget-object v11, Lio/flutter/plugin/platform/B;->i:Lio/flutter/plugin/platform/x;

    .line 93
    .line 94
    const/4 v12, 0x0

    .line 95
    const/4 v10, 0x0

    .line 96
    invoke-virtual/range {v4 .. v12}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    iput-object v3, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 101
    .line 102
    new-instance v8, Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 103
    .line 104
    iget-object v9, v1, Lio/flutter/plugin/platform/B;->b:Landroid/content/Context;

    .line 105
    .line 106
    iget-object v3, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 107
    .line 108
    invoke-virtual {v3}, Landroid/hardware/display/VirtualDisplay;->getDisplay()Landroid/view/Display;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    iget-object v11, v1, Lio/flutter/plugin/platform/B;->c:Lio/flutter/plugin/platform/a;

    .line 113
    .line 114
    iget-object v13, v1, Lio/flutter/plugin/platform/B;->g:Lio/flutter/plugin/platform/k;

    .line 115
    .line 116
    move-object v12, v2

    .line 117
    invoke-direct/range {v8 .. v14}, Lio/flutter/plugin/platform/SingleViewPresentation;-><init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/a;Lio/flutter/plugin/platform/u;Landroid/view/View$OnFocusChangeListener;Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v8}, Landroid/app/Dialog;->show()V

    .line 121
    .line 122
    .line 123
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 124
    .line 125
    invoke-virtual {v2}, Landroid/app/Dialog;->cancel()V

    .line 126
    .line 127
    .line 128
    iput-object v8, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_0
    return-void
.end method

.method public final n(FLj3/f;Z)Landroid/view/MotionEvent;
    .locals 25

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    iget-wide v1, v0, Lj3/f;->p:J

    .line 4
    .line 5
    iget v3, v0, Lj3/f;->e:I

    .line 6
    .line 7
    new-instance v4, LZ2/D;

    .line 8
    .line 9
    invoke-direct {v4, v1, v2}, LZ2/D;-><init>(J)V

    .line 10
    .line 11
    .line 12
    move-object/from16 v1, p0

    .line 13
    .line 14
    iget-object v2, v1, Lio/flutter/plugin/platform/p;->y:LZ2/s;

    .line 15
    .line 16
    invoke-virtual {v2, v4}, LZ2/s;->B(LZ2/D;)Landroid/view/MotionEvent;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v4, v0, Lj3/f;->g:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v4, Ljava/util/List;

    .line 23
    .line 24
    new-instance v5, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    const/4 v7, 0x1

    .line 38
    const/4 v8, 0x0

    .line 39
    if-eqz v6, :cond_0

    .line 40
    .line 41
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    check-cast v6, Ljava/util/List;

    .line 46
    .line 47
    new-instance v9, Landroid/view/MotionEvent$PointerCoords;

    .line 48
    .line 49
    invoke-direct {v9}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    check-cast v8, Ljava/lang/Double;

    .line 57
    .line 58
    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    .line 59
    .line 60
    .line 61
    move-result-wide v10

    .line 62
    double-to-float v8, v10

    .line 63
    iput v8, v9, Landroid/view/MotionEvent$PointerCoords;->orientation:F

    .line 64
    .line 65
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    check-cast v7, Ljava/lang/Double;

    .line 70
    .line 71
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 72
    .line 73
    .line 74
    move-result-wide v7

    .line 75
    double-to-float v7, v7

    .line 76
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 77
    .line 78
    const/4 v7, 0x2

    .line 79
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    check-cast v7, Ljava/lang/Double;

    .line 84
    .line 85
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 86
    .line 87
    .line 88
    move-result-wide v7

    .line 89
    double-to-float v7, v7

    .line 90
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 91
    .line 92
    const/4 v7, 0x3

    .line 93
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    check-cast v7, Ljava/lang/Double;

    .line 98
    .line 99
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 100
    .line 101
    .line 102
    move-result-wide v7

    .line 103
    move/from16 v10, p1

    .line 104
    .line 105
    float-to-double v11, v10

    .line 106
    mul-double/2addr v7, v11

    .line 107
    double-to-float v7, v7

    .line 108
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->toolMajor:F

    .line 109
    .line 110
    const/4 v7, 0x4

    .line 111
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    check-cast v7, Ljava/lang/Double;

    .line 116
    .line 117
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 118
    .line 119
    .line 120
    move-result-wide v7

    .line 121
    mul-double/2addr v7, v11

    .line 122
    double-to-float v7, v7

    .line 123
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->toolMinor:F

    .line 124
    .line 125
    const/4 v7, 0x5

    .line 126
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    check-cast v7, Ljava/lang/Double;

    .line 131
    .line 132
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 133
    .line 134
    .line 135
    move-result-wide v7

    .line 136
    mul-double/2addr v7, v11

    .line 137
    double-to-float v7, v7

    .line 138
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->touchMajor:F

    .line 139
    .line 140
    const/4 v7, 0x6

    .line 141
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    check-cast v7, Ljava/lang/Double;

    .line 146
    .line 147
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 148
    .line 149
    .line 150
    move-result-wide v7

    .line 151
    mul-double/2addr v7, v11

    .line 152
    double-to-float v7, v7

    .line 153
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->touchMinor:F

    .line 154
    .line 155
    const/4 v7, 0x7

    .line 156
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    check-cast v7, Ljava/lang/Double;

    .line 161
    .line 162
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 163
    .line 164
    .line 165
    move-result-wide v7

    .line 166
    mul-double/2addr v7, v11

    .line 167
    double-to-float v7, v7

    .line 168
    iput v7, v9, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 169
    .line 170
    const/16 v7, 0x8

    .line 171
    .line 172
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    check-cast v6, Ljava/lang/Double;

    .line 177
    .line 178
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    .line 179
    .line 180
    .line 181
    move-result-wide v6

    .line 182
    mul-double/2addr v6, v11

    .line 183
    double-to-float v6, v6

    .line 184
    iput v6, v9, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 185
    .line 186
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_0
    new-array v4, v3, [Landroid/view/MotionEvent$PointerCoords;

    .line 192
    .line 193
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    check-cast v4, [Landroid/view/MotionEvent$PointerCoords;

    .line 198
    .line 199
    iget-object v5, v0, Lj3/f;->f:Ljava/lang/Object;

    .line 200
    .line 201
    check-cast v5, Ljava/util/List;

    .line 202
    .line 203
    new-instance v6, Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 213
    .line 214
    .line 215
    move-result v9

    .line 216
    if-eqz v9, :cond_1

    .line 217
    .line 218
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v9

    .line 222
    check-cast v9, Ljava/util/List;

    .line 223
    .line 224
    new-instance v10, Landroid/view/MotionEvent$PointerProperties;

    .line 225
    .line 226
    invoke-direct {v10}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v11

    .line 233
    check-cast v11, Ljava/lang/Integer;

    .line 234
    .line 235
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 236
    .line 237
    .line 238
    move-result v11

    .line 239
    iput v11, v10, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 240
    .line 241
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v9

    .line 245
    check-cast v9, Ljava/lang/Integer;

    .line 246
    .line 247
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v9

    .line 251
    iput v9, v10, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 252
    .line 253
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    goto :goto_1

    .line 257
    :cond_1
    new-array v5, v3, [Landroid/view/MotionEvent$PointerProperties;

    .line 258
    .line 259
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    move-object v15, v5

    .line 264
    check-cast v15, [Landroid/view/MotionEvent$PointerProperties;

    .line 265
    .line 266
    if-nez p3, :cond_4

    .line 267
    .line 268
    if-eqz v2, :cond_4

    .line 269
    .line 270
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 271
    .line 272
    .line 273
    move-result v5

    .line 274
    if-ne v5, v3, :cond_3

    .line 275
    .line 276
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    iget v5, v0, Lj3/f;->d:I

    .line 281
    .line 282
    if-ne v3, v5, :cond_3

    .line 283
    .line 284
    array-length v0, v4

    .line 285
    if-ge v0, v7, :cond_2

    .line 286
    .line 287
    return-object v2

    .line 288
    :cond_2
    aget-object v0, v4, v8

    .line 289
    .line 290
    iget v0, v0, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 291
    .line 292
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    sub-float/2addr v0, v3

    .line 297
    aget-object v3, v4, v8

    .line 298
    .line 299
    iget v3, v3, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 300
    .line 301
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    sub-float/2addr v3, v4

    .line 306
    invoke-virtual {v2, v0, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 307
    .line 308
    .line 309
    return-object v2

    .line 310
    :cond_3
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getDownTime()J

    .line 311
    .line 312
    .line 313
    move-result-wide v9

    .line 314
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getEventTime()J

    .line 315
    .line 316
    .line 317
    move-result-wide v11

    .line 318
    iget v13, v0, Lj3/f;->d:I

    .line 319
    .line 320
    iget v14, v0, Lj3/f;->e:I

    .line 321
    .line 322
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getMetaState()I

    .line 323
    .line 324
    .line 325
    move-result v17

    .line 326
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getButtonState()I

    .line 327
    .line 328
    .line 329
    move-result v18

    .line 330
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getXPrecision()F

    .line 331
    .line 332
    .line 333
    move-result v19

    .line 334
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getYPrecision()F

    .line 335
    .line 336
    .line 337
    move-result v20

    .line 338
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getDeviceId()I

    .line 339
    .line 340
    .line 341
    move-result v21

    .line 342
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 343
    .line 344
    .line 345
    move-result v22

    .line 346
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getSource()I

    .line 347
    .line 348
    .line 349
    move-result v23

    .line 350
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getFlags()I

    .line 351
    .line 352
    .line 353
    move-result v24

    .line 354
    move-object/from16 v16, v4

    .line 355
    .line 356
    invoke-static/range {v9 .. v24}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    return-object v0

    .line 361
    :cond_4
    move-object/from16 v16, v4

    .line 362
    .line 363
    iget-object v2, v0, Lj3/f;->b:Ljava/lang/Number;

    .line 364
    .line 365
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    .line 366
    .line 367
    .line 368
    move-result-wide v9

    .line 369
    iget-object v2, v0, Lj3/f;->c:Ljava/lang/Number;

    .line 370
    .line 371
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    .line 372
    .line 373
    .line 374
    move-result-wide v11

    .line 375
    iget v13, v0, Lj3/f;->d:I

    .line 376
    .line 377
    iget v14, v0, Lj3/f;->e:I

    .line 378
    .line 379
    iget v2, v0, Lj3/f;->h:I

    .line 380
    .line 381
    iget v3, v0, Lj3/f;->i:I

    .line 382
    .line 383
    iget v4, v0, Lj3/f;->j:F

    .line 384
    .line 385
    iget v5, v0, Lj3/f;->k:F

    .line 386
    .line 387
    iget v6, v0, Lj3/f;->l:I

    .line 388
    .line 389
    iget v7, v0, Lj3/f;->m:I

    .line 390
    .line 391
    iget v8, v0, Lj3/f;->n:I

    .line 392
    .line 393
    iget v0, v0, Lj3/f;->o:I

    .line 394
    .line 395
    move/from16 v24, v0

    .line 396
    .line 397
    move/from16 v17, v2

    .line 398
    .line 399
    move/from16 v18, v3

    .line 400
    .line 401
    move/from16 v19, v4

    .line 402
    .line 403
    move/from16 v20, v5

    .line 404
    .line 405
    move/from16 v21, v6

    .line 406
    .line 407
    move/from16 v22, v7

    .line 408
    .line 409
    move/from16 v23, v8

    .line 410
    .line 411
    invoke-static/range {v9 .. v24}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    return-object v0
.end method

.method public final o(D)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lio/flutter/plugin/platform/p;->i()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-double v0, v0

    .line 6
    mul-double/2addr p1, v0

    .line 7
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    long-to-int p1, p1

    .line 12
    return p1
.end method
