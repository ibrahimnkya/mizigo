.class public abstract LI3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LK3/a;
.implements Ljava/io/Serializable;


# instance fields
.field public transient e:LK3/a;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Class;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI3/c;->f:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, LI3/c;->g:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p3, p0, LI3/c;->h:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, LI3/c;->i:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, LI3/c;->j:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public abstract b()LK3/a;
.end method

.method public final d()LI3/d;
    .locals 2

    .line 1
    iget-boolean v0, p0, LI3/c;->j:Z

    .line 2
    .line 3
    iget-object v1, p0, LI3/c;->g:Ljava/lang/Class;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, LI3/q;->a:LI3/r;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance v0, LI3/j;

    .line 13
    .line 14
    invoke-direct {v0, v1}, LI3/j;-><init>(Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    invoke-static {v1}, LI3/q;->a(Ljava/lang/Class;)LI3/e;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method
