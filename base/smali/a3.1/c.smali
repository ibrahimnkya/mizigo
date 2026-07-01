.class public final La3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw3/b;


# static fields
.field public static y:J = 0x1L

.field public static final z:Ljava/util/HashMap;


# instance fields
.field public final a:Lio/flutter/embedding/engine/FlutterJNI;

.field public final b:Lio/flutter/embedding/engine/renderer/j;

.field public final c:Lb3/b;

.field public final d:La3/d;

.field public final e:Ll3/a;

.field public final f:LB2/a;

.field public final g:Lj3/a;

.field public final h:Lio/flutter/plugin/editing/j;

.field public final i:Lj3/b;

.field public final j:Lio/flutter/plugin/editing/j;

.field public final k:Lj3/j;

.field public final l:LZ2/s;

.field public final m:Lio/flutter/plugin/editing/j;

.field public final n:Lio/flutter/plugin/editing/j;

.field public final o:Lj3/l;

.field public final p:Lio/flutter/plugin/editing/j;

.field public final q:Lj3/b;

.field public final r:LZ2/s;

.field public final s:Lio/flutter/plugin/platform/p;

.field public final t:Lio/flutter/plugin/platform/o;

.field public final u:LZ2/s;

.field public final v:Ljava/util/HashSet;

.field public final w:J

.field public final x:La3/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, La3/c;->z:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/engine/FlutterJNI;Lio/flutter/plugin/platform/p;[Ljava/lang/String;ZZ)V
    .locals 6

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, La3/c;->v:Ljava/util/HashSet;

    .line 5
    new-instance v0, La3/a;

    invoke-direct {v0, p0}, La3/a;-><init>(La3/c;)V

    iput-object v0, p0, La3/c;->x:La3/a;

    .line 6
    sget-wide v0, La3/c;->y:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    sput-wide v2, La3/c;->y:J

    iput-wide v0, p0, La3/c;->w:J

    .line 7
    sget-object v2, La3/c;->z:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 9
    :catch_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 10
    :goto_0
    invoke-static {}, LB2/a;->J()LB2/a;

    move-result-object v1

    if-nez p2, :cond_0

    .line 11
    iget-object p2, v1, LB2/a;->g:Ljava/lang/Object;

    .line 12
    new-instance p2, Lio/flutter/embedding/engine/FlutterJNI;

    invoke-direct {p2}, Lio/flutter/embedding/engine/FlutterJNI;-><init>()V

    .line 13
    :cond_0
    iput-object p2, p0, La3/c;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 14
    new-instance v2, Lb3/b;

    iget-wide v3, p0, La3/c;->w:J

    invoke-direct {v2, p2, v0, v3, v4}, Lb3/b;-><init>(Lio/flutter/embedding/engine/FlutterJNI;Landroid/content/res/AssetManager;J)V

    iput-object v2, p0, La3/c;->c:Lb3/b;

    .line 15
    iget-object v0, v2, Lb3/b;->h:Lb3/i;

    invoke-virtual {p2, v0}, Lio/flutter/embedding/engine/FlutterJNI;->setPlatformMessageHandler(Lb3/j;)V

    .line 16
    invoke-static {}, LB2/a;->J()LB2/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    new-instance v0, LB2/a;

    invoke-direct {v0, v2, p2}, LB2/a;-><init>(Lb3/b;Lio/flutter/embedding/engine/FlutterJNI;)V

    iput-object v0, p0, La3/c;->f:LB2/a;

    .line 18
    new-instance v0, LN0/f;

    invoke-direct {v0, v2}, LN0/f;-><init>(Lb3/b;)V

    .line 19
    new-instance v0, Lj3/a;

    invoke-direct {v0, v2}, Lj3/a;-><init>(Lb3/b;)V

    iput-object v0, p0, La3/c;->g:Lj3/a;

    .line 20
    new-instance v0, LZ2/s;

    const/16 v3, 0xa

    invoke-direct {v0, v2, v3}, LZ2/s;-><init>(Lb3/b;I)V

    .line 21
    new-instance v3, Lio/flutter/plugin/editing/j;

    const/4 v4, 0x4

    invoke-direct {v3, v2, v4}, Lio/flutter/plugin/editing/j;-><init>(Lb3/b;I)V

    iput-object v3, p0, La3/c;->h:Lio/flutter/plugin/editing/j;

    .line 22
    new-instance v3, Lj3/b;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lj3/b;-><init>(Lb3/b;I)V

    iput-object v3, p0, La3/c;->i:Lj3/b;

    .line 23
    new-instance v3, Lio/flutter/plugin/editing/j;

    const/4 v4, 0x1

    invoke-direct {v3, v2, v4}, Lio/flutter/plugin/editing/j;-><init>(Lb3/b;I)V

    iput-object v3, p0, La3/c;->j:Lio/flutter/plugin/editing/j;

    .line 24
    new-instance v3, LZ2/s;

    const/16 v4, 0xb

    invoke-direct {v3, v2, v4}, LZ2/s;-><init>(Lb3/b;I)V

    iput-object v3, p0, La3/c;->l:LZ2/s;

    .line 25
    new-instance v3, LZ2/s;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-direct {v3, v2, v4}, LZ2/s;-><init>(Lb3/b;Landroid/content/pm/PackageManager;)V

    .line 26
    new-instance v4, Lj3/j;

    invoke-direct {v4, v2, p6}, Lj3/j;-><init>(Lb3/b;Z)V

    iput-object v4, p0, La3/c;->k:Lj3/j;

    .line 27
    new-instance p6, Lio/flutter/plugin/editing/j;

    const/16 v4, 0x8

    invoke-direct {p6, v2, v4}, Lio/flutter/plugin/editing/j;-><init>(Lb3/b;I)V

    iput-object p6, p0, La3/c;->m:Lio/flutter/plugin/editing/j;

    .line 28
    new-instance p6, Lio/flutter/plugin/editing/j;

    const/16 v4, 0x9

    invoke-direct {p6, v2, v4}, Lio/flutter/plugin/editing/j;-><init>(Lb3/b;I)V

    iput-object p6, p0, La3/c;->n:Lio/flutter/plugin/editing/j;

    .line 29
    new-instance p6, Lj3/l;

    invoke-direct {p6, v2}, Lj3/l;-><init>(Lb3/b;)V

    iput-object p6, p0, La3/c;->o:Lj3/l;

    .line 30
    new-instance v4, Lio/flutter/plugin/editing/j;

    const/16 v5, 0xa

    invoke-direct {v4, v2, v5}, Lio/flutter/plugin/editing/j;-><init>(Lb3/b;I)V

    iput-object v4, p0, La3/c;->p:Lio/flutter/plugin/editing/j;

    .line 31
    new-instance v4, Lj3/b;

    const/4 v5, 0x6

    invoke-direct {v4, v2, v5}, Lj3/b;-><init>(Lb3/b;I)V

    iput-object v4, p0, La3/c;->q:Lj3/b;

    .line 32
    new-instance v4, LZ2/s;

    const/16 v5, 0x10

    invoke-direct {v4, v2, v5}, LZ2/s;-><init>(Lb3/b;I)V

    iput-object v4, p0, La3/c;->r:LZ2/s;

    .line 33
    new-instance v2, Ll3/a;

    invoke-direct {v2, p1, v0}, Ll3/a;-><init>(Landroid/content/Context;LZ2/s;)V

    iput-object v2, p0, La3/c;->e:Ll3/a;

    .line 34
    iget-object v0, v1, LB2/a;->f:Ljava/lang/Object;

    check-cast v0, Le3/e;

    .line 35
    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    move-result v4

    if-nez v4, :cond_1

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0, v4}, Le3/e;->d(Landroid/content/Context;)V

    .line 37
    invoke-virtual {v0, p1, p4}, Le3/e;->a(Landroid/content/Context;[Ljava/lang/String;)V

    .line 38
    :cond_1
    new-instance p4, Lio/flutter/plugin/platform/o;

    invoke-direct {p4}, Lio/flutter/plugin/platform/o;-><init>()V

    .line 39
    iget-object v4, p3, Lio/flutter/plugin/platform/p;->e:Lio/flutter/plugin/platform/m;

    .line 40
    iput-object v4, p4, Lio/flutter/plugin/platform/o;->e:Lio/flutter/plugin/platform/m;

    .line 41
    iput-object p2, p4, Lio/flutter/plugin/platform/o;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 42
    iput-object p2, p3, Lio/flutter/plugin/platform/p;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 43
    iget-object v4, p0, La3/c;->x:La3/a;

    invoke-virtual {p2, v4}, Lio/flutter/embedding/engine/FlutterJNI;->addEngineLifecycleListener(La3/b;)V

    .line 44
    invoke-virtual {p2, p3}, Lio/flutter/embedding/engine/FlutterJNI;->setPlatformViewsController(Lio/flutter/plugin/platform/p;)V

    .line 45
    invoke-virtual {p2, p4}, Lio/flutter/embedding/engine/FlutterJNI;->setPlatformViewsController2(Lio/flutter/plugin/platform/o;)V

    .line 46
    invoke-virtual {p2, v2}, Lio/flutter/embedding/engine/FlutterJNI;->setLocalizationPlugin(Ll3/a;)V

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lio/flutter/embedding/engine/FlutterJNI;->setDeferredComponentManager(Lc3/a;)V

    .line 48
    invoke-virtual {p2, p6}, Lio/flutter/embedding/engine/FlutterJNI;->setSettingsChannel(Lj3/l;)V

    .line 49
    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    move-result p6

    if-nez p6, :cond_3

    .line 50
    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterJNI;->attachToNative()V

    .line 51
    invoke-virtual {p2}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    move-result p6

    if-eqz p6, :cond_2

    goto :goto_1

    .line 52
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "FlutterEngine failed to attach to its native Object reference."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_3
    :goto_1
    new-instance p6, Lio/flutter/embedding/engine/renderer/j;

    invoke-direct {p6, p2}, Lio/flutter/embedding/engine/renderer/j;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    iput-object p6, p0, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 54
    iput-object p3, p0, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 55
    iput-object p4, p0, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 56
    new-instance p2, LZ2/s;

    const/16 p6, 0x8

    const/4 v1, 0x0

    .line 57
    invoke-direct {p2, p6, v1}, LZ2/s;-><init>(IZ)V

    .line 58
    iput-object p3, p2, LZ2/s;->f:Ljava/lang/Object;

    .line 59
    iput-object p4, p2, LZ2/s;->g:Ljava/lang/Object;

    .line 60
    iput-object p2, p0, La3/c;->u:LZ2/s;

    .line 61
    new-instance p2, La3/d;

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3, p0}, La3/d;-><init>(Landroid/content/Context;La3/c;)V

    iput-object p2, p0, La3/c;->d:La3/d;

    .line 63
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    invoke-virtual {v2, p3}, Ll3/a;->b(Landroid/content/res/Configuration;)V

    if-eqz p5, :cond_4

    .line 64
    iget-object p3, v0, Le3/e;->d:LV1/q;

    .line 65
    iget-boolean p3, p3, LV1/q;->a:Z

    if-eqz p3, :cond_4

    .line 66
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->H(La3/c;)V

    .line 67
    :cond_4
    invoke-static {p1, p0}, Lc1/g;->c(Landroid/content/Context;Lw3/b;)V

    .line 68
    new-instance p1, Ln3/a;

    invoke-direct {p1, v3}, Ln3/a;-><init>(LZ2/s;)V

    .line 69
    invoke-virtual {p2, p1}, La3/d;->a(Lg3/b;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v3, Lio/flutter/plugin/platform/p;

    invoke-direct {v3}, Lio/flutter/plugin/platform/p;-><init>()V

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    .line 2
    invoke-direct/range {v0 .. v6}, La3/c;-><init>(Landroid/content/Context;Lio/flutter/embedding/engine/FlutterJNI;Lio/flutter/plugin/platform/p;[Ljava/lang/String;ZZ)V

    return-void
.end method
