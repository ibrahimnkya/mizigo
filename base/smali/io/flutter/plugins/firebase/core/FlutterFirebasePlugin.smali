.class public interface abstract Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field public static final cachedThreadPool:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public abstract didReinitializeFirebaseCore()Li1/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Li1/h;"
        }
    .end annotation
.end method

.method public abstract getPluginConstantsForFirebaseApp(LA1/g;)Li1/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LA1/g;",
            ")",
            "Li1/h;"
        }
    .end annotation
.end method
