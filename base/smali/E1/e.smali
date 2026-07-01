.class public final synthetic LE1/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:LE1/f;

.field public final synthetic b:Ljava/util/concurrent/Callable;

.field public final synthetic c:LA0/c;


# direct methods
.method public synthetic constructor <init>(LE1/f;Ljava/util/concurrent/Callable;LA0/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LE1/e;->a:LE1/f;

    iput-object p2, p0, LE1/e;->b:Ljava/util/concurrent/Callable;

    iput-object p3, p0, LE1/e;->c:LA0/c;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, LE1/e;->a:LE1/f;

    .line 2
    .line 3
    iget-object v0, v0, LE1/f;->e:Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    new-instance v1, LD1/h;

    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    iget-object v3, p0, LE1/e;->b:Ljava/util/concurrent/Callable;

    .line 9
    .line 10
    iget-object v4, p0, LE1/e;->c:LA0/c;

    .line 11
    .line 12
    invoke-direct {v1, v2, v3, v4}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method
