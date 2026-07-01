.class public final Lq0/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lh3/a;


# instance fields
.field public e:Lq0/b;

.field public f:Lk3/o;

.field public g:Lh3/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onAttachedToActivity(Lh3/b;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lm/J0;

    .line 3
    .line 4
    iget-object v1, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Landroid/app/Activity;

    .line 7
    .line 8
    iget-object v2, p0, Lq0/a;->e:Lq0/b;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iput-object v1, v2, Lq0/b;->g:Landroid/app/Activity;

    .line 13
    .line 14
    :cond_0
    iput-object p1, p0, Lq0/a;->g:Lh3/b;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Lm/J0;->a(Lk3/q;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lq0/a;->g:Lh3/b;

    .line 20
    .line 21
    iget-object v0, p0, Lq0/a;->e:Lq0/b;

    .line 22
    .line 23
    check-cast p1, Lm/J0;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lm/J0;->b(Lk3/s;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 6

    .line 1
    new-instance v0, Lq0/b;

    .line 2
    .line 3
    iget-object v1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lq0/b;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lq0/a;->e:Lq0/b;

    .line 9
    .line 10
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 11
    .line 12
    new-instance v0, Lk3/o;

    .line 13
    .line 14
    const-string v2, "flutter.baseflow.com/permissions/methods"

    .line 15
    .line 16
    invoke-direct {v0, p1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lq0/a;->f:Lk3/o;

    .line 20
    .line 21
    new-instance p1, LZ2/s;

    .line 22
    .line 23
    new-instance v2, LN1/e;

    .line 24
    .line 25
    const/16 v3, 0xf

    .line 26
    .line 27
    invoke-direct {v2, v3}, LN1/e;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lq0/a;->e:Lq0/b;

    .line 31
    .line 32
    new-instance v4, LK0/h;

    .line 33
    .line 34
    const/16 v5, 0x10

    .line 35
    .line 36
    invoke-direct {v4, v5}, LK0/h;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p1, v1, v2, v3, v4}, LZ2/s;-><init>(Landroid/content/Context;LN1/e;Lq0/b;LK0/h;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lk3/o;->b(Lk3/m;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 3

    .line 1
    iget-object v0, p0, Lq0/a;->e:Lq0/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, v0, Lq0/b;->g:Landroid/app/Activity;

    .line 7
    .line 8
    :cond_0
    iget-object v2, p0, Lq0/a;->g:Lh3/b;

    .line 9
    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    check-cast v2, Lm/J0;

    .line 13
    .line 14
    iget-object v2, v2, Lm/J0;->h:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lq0/a;->g:Lh3/b;

    .line 22
    .line 23
    iget-object v2, p0, Lq0/a;->e:Lq0/b;

    .line 24
    .line 25
    check-cast v0, Lm/J0;

    .line 26
    .line 27
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Ljava/util/HashSet;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    iput-object v1, p0, Lq0/a;->g:Lh3/b;

    .line 35
    .line 36
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lq0/a;->onDetachedFromActivity()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lq0/a;->f:Lk3/o;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lk3/o;->b(Lk3/m;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lq0/a;->f:Lk3/o;

    .line 8
    .line 9
    return-void
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lq0/a;->onAttachedToActivity(Lh3/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
