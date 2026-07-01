.class public interface abstract LV2/h;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a(LV2/f;)V
.end method

.method public b(LV2/e;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, LE/i;

    .line 6
    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    invoke-direct {v0, v1, p1}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    move-object p1, v0

    .line 13
    :goto_0
    new-instance v0, LV2/f;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2}, LV2/f;-><init>(LE/i;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v0}, LV2/h;->a(LV2/f;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public abstract c()V
.end method

.method public abstract start()V
.end method
