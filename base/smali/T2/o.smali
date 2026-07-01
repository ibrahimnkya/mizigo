.class public final LT2/o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LU2/g;

.field public b:Landroid/os/HandlerThread;

.field public c:Landroid/os/Handler;

.field public d:LT2/l;

.field public final e:Landroid/os/Handler;

.field public f:Landroid/graphics/Rect;

.field public g:Z

.field public final h:Ljava/lang/Object;

.field public final i:LJ0/l;

.field public final j:LE/i;


# direct methods
.method public constructor <init>(LU2/g;LT2/l;Landroid/os/Handler;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LT2/o;->g:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LT2/o;->h:Ljava/lang/Object;

    .line 13
    .line 14
    new-instance v0, LJ0/l;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-direct {v0, v1, p0}, LJ0/l;-><init>(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, LT2/o;->i:LJ0/l;

    .line 21
    .line 22
    new-instance v0, LE/i;

    .line 23
    .line 24
    const/16 v1, 0xd

    .line 25
    .line 26
    invoke-direct {v0, v1, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, LT2/o;->j:LE/i;

    .line 30
    .line 31
    invoke-static {}, LT0/a;->N()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, LT2/o;->a:LU2/g;

    .line 35
    .line 36
    iput-object p2, p0, LT2/o;->d:LT2/l;

    .line 37
    .line 38
    iput-object p3, p0, LT2/o;->e:Landroid/os/Handler;

    .line 39
    .line 40
    return-void
.end method
