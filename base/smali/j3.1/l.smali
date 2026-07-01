.class public final Lj3/l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LB2/a;

.field public final b:LV1/y;


# direct methods
.method public constructor <init>(Lb3/b;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LB2/a;

    .line 5
    .line 6
    invoke-direct {v0}, LB2/a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lj3/l;->a:LB2/a;

    .line 10
    .line 11
    new-instance v0, LV1/y;

    .line 12
    .line 13
    sget-object v1, Lk3/i;->a:Lk3/i;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, "flutter/settings"

    .line 17
    .line 18
    invoke-direct {v0, p1, v3, v1, v2}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lj3/l;->b:LV1/y;

    .line 22
    .line 23
    return-void
.end method
