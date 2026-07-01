.class public final Lb3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/f;


# instance fields
.field public final e:Lio/flutter/embedding/engine/FlutterJNI;

.field public final f:Landroid/content/res/AssetManager;

.field public final g:J

.field public final h:Lb3/i;

.field public final i:LA0/c;

.field public j:Z


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/FlutterJNI;Landroid/content/res/AssetManager;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lb3/b;->j:Z

    .line 6
    .line 7
    new-instance v0, LN0/f;

    .line 8
    .line 9
    const/16 v1, 0xc

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, LN0/f;-><init>(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lb3/b;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 15
    .line 16
    iput-object p2, p0, Lb3/b;->f:Landroid/content/res/AssetManager;

    .line 17
    .line 18
    iput-wide p3, p0, Lb3/b;->g:J

    .line 19
    .line 20
    new-instance p2, Lb3/i;

    .line 21
    .line 22
    invoke-direct {p2, p1}, Lb3/i;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Lb3/b;->h:Lb3/i;

    .line 26
    .line 27
    const-string p3, "flutter/isolate"

    .line 28
    .line 29
    const/4 p4, 0x0

    .line 30
    invoke-virtual {p2, p3, v0, p4}, Lb3/i;->r(Ljava/lang/String;Lk3/d;LN1/e;)V

    .line 31
    .line 32
    .line 33
    new-instance p3, LA0/c;

    .line 34
    .line 35
    const/16 p4, 0x18

    .line 36
    .line 37
    invoke-direct {p3, p4, p2}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Lb3/b;->i:LA0/c;

    .line 41
    .line 42
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lb3/b;->j:Z

    .line 50
    .line 51
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(LB2/a;)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lb3/b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p1, "DartExecutor"

    .line 6
    .line 7
    const-string v0, "Attempted to run a DartExecutor that is already running."

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "DartExecutor#executeDartCallback"

    .line 14
    .line 15
    invoke-static {v0}, Lw3/a;->b(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :try_start_0
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lb3/b;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 22
    .line 23
    iget-object v0, p1, LB2/a;->g:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v2, v0

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p1, LB2/a;->h:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Lio/flutter/view/FlutterCallbackInformation;

    .line 31
    .line 32
    iget-object v3, v0, Lio/flutter/view/FlutterCallbackInformation;->callbackName:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v4, v0, Lio/flutter/view/FlutterCallbackInformation;->callbackLibraryPath:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 37
    .line 38
    move-object v5, p1

    .line 39
    check-cast v5, Landroid/content/res/AssetManager;

    .line 40
    .line 41
    iget-wide v7, p0, Lb3/b;->g:J

    .line 42
    .line 43
    const/4 v6, 0x0

    .line 44
    invoke-virtual/range {v1 .. v8}, Lio/flutter/embedding/engine/FlutterJNI;->runBundleAndSnapshotFromLibrary(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/AssetManager;Ljava/util/List;J)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Lb3/b;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p1, v0

    .line 56
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_1
    move-exception v0

    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    throw p1
.end method

.method public final b(Lb3/a;Ljava/util/List;)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lb3/b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p1, "DartExecutor"

    .line 6
    .line 7
    const-string p2, "Attempted to run a DartExecutor that is already running."

    .line 8
    .line 9
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "DartExecutor#executeDartEntrypoint"

    .line 14
    .line 15
    invoke-static {v0}, Lw3/a;->b(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :try_start_0
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lb3/b;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 22
    .line 23
    iget-object v2, p1, Lb3/a;->a:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lb3/a;->c:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v4, p1, Lb3/a;->b:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v5, p0, Lb3/b;->f:Landroid/content/res/AssetManager;

    .line 30
    .line 31
    iget-wide v7, p0, Lb3/b;->g:J

    .line 32
    .line 33
    move-object v6, p2

    .line 34
    invoke-virtual/range {v1 .. v8}, Lio/flutter/embedding/engine/FlutterJNI;->runBundleAndSnapshotFromLibrary(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/AssetManager;Ljava/util/List;J)V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    iput-boolean p1, p0, Lb3/b;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p1, v0

    .line 46
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_1
    move-exception v0

    .line 51
    move-object p2, v0

    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    throw p1
.end method

.method public final h(Ljava/lang/String;Ljava/nio/ByteBuffer;Lk3/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lb3/b;->i:LA0/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, LA0/c;->h(Ljava/lang/String;Ljava/nio/ByteBuffer;Lk3/e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lb3/b;->i:LA0/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LA0/c;->j(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l(Lk3/j;)LN1/e;
    .locals 1

    .line 1
    iget-object v0, p0, Lb3/b;->i:LA0/c;

    .line 2
    .line 3
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lb3/i;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lb3/i;->l(Lk3/j;)LN1/e;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    return-object p1
.end method

.method public final m(Ljava/lang/String;Lk3/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lb3/b;->i:LA0/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LA0/c;->m(Ljava/lang/String;Lk3/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final r(Ljava/lang/String;Lk3/d;LN1/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lb3/b;->i:LA0/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, LA0/c;->r(Ljava/lang/String;Lk3/d;LN1/e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
