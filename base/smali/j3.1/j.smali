.class public final Lj3/j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:[B

.field public final c:Lk3/o;

.field public d:LQ2/g;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lb3/b;Z)V
    .locals 4

    .line 1
    new-instance v0, Lk3/o;

    .line 2
    .line 3
    sget-object v1, Lk3/v;->a:Lk3/v;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "flutter/restoration"

    .line 7
    .line 8
    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lj3/j;->e:Z

    .line 16
    .line 17
    iput-boolean p1, p0, Lj3/j;->f:Z

    .line 18
    .line 19
    new-instance p1, Lio/flutter/plugin/editing/j;

    .line 20
    .line 21
    const/4 v1, 0x7

    .line 22
    invoke-direct {p1, v1, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lj3/j;->c:Lk3/o;

    .line 26
    .line 27
    iput-boolean p2, p0, Lj3/j;->a:Z

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lk3/o;->b(Lk3/m;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static a([B)Ljava/util/HashMap;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "enabled"

    .line 7
    .line 8
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v1, "data"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
