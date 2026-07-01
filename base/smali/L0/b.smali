.class public final LL0/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:LL0/b;


# instance fields
.field public final a:LK0/h;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LK0/h;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, LL0/b;

    .line 12
    .line 13
    invoke-direct {v2, v0, v1}, LL0/b;-><init>(LK0/h;Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    sput-object v2, LL0/b;->b:LL0/b;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(LK0/h;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL0/b;->a:LK0/h;

    .line 5
    .line 6
    return-void
.end method
