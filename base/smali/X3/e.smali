.class public final LX3/e;
.super Lio/flutter/plugin/platform/f;
.source "SourceFile"


# instance fields
.field public final b:Lk3/f;


# direct methods
.method public constructor <init>(Lk3/f;)V
    .locals 1

    .line 1
    const-string v0, "messenger"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lk3/u;->a:Lk3/u;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/f;-><init>(Lk3/u;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, LX3/e;->b:Lk3/f;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/e;
    .locals 2

    .line 1
    const-string v0, "null cannot be cast to non-null type java.util.HashMap<kotlin.String, kotlin.Any>"

    .line 2
    .line 3
    invoke-static {p3, v0}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p3, Ljava/util/HashMap;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance v0, LX3/d;

    .line 11
    .line 12
    iget-object v1, p0, LX3/e;->b:Lk3/f;

    .line 13
    .line 14
    invoke-direct {v0, p1, v1, p2, p3}, LX3/d;-><init>(Landroid/content/Context;Lk3/f;ILjava/util/HashMap;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 19
    .line 20
    const-string p2, "Required value was null."

    .line 21
    .line 22
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p1
.end method
