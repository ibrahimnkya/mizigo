.class public LW3/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lh3/a;


# instance fields
.field public e:Landroid/content/Context;

.field public f:Lk3/o;


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
    iget-object v0, p0, LW3/g;->e:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, LW3/g;->e:Landroid/content/Context;

    .line 7
    .line 8
    :cond_0
    check-cast p1, Lm/J0;

    .line 9
    .line 10
    iget-object p1, p1, Lm/J0;->e:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Landroid/app/Activity;

    .line 13
    .line 14
    iput-object p1, p0, LW3/g;->e:Landroid/content/Context;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, LW3/g;->f:Lk3/o;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v1, LA/c;

    .line 23
    .line 24
    const/16 v2, 0x1a

    .line 25
    .line 26
    invoke-direct {v1, v2, p1, v0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lk3/o;->b(Lk3/m;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lg3/a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object v0, p0, LW3/g;->e:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 6
    .line 7
    new-instance v0, Lk3/o;

    .line 8
    .line 9
    const-string v1, "net.nfet.printing"

    .line 10
    .line 11
    invoke-direct {v0, p1, v1}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, LW3/g;->f:Lk3/o;

    .line 15
    .line 16
    iget-object p1, p0, LW3/g;->e:Landroid/content/Context;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    new-instance v1, LA/c;

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    invoke-direct {v1, v2, p1, v0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lk3/o;->b(Lk3/m;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 2

    .line 1
    iget-object v0, p0, LW3/g;->f:Lk3/o;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lk3/o;->b(Lk3/m;)V

    .line 5
    .line 6
    .line 7
    iput-object v1, p0, LW3/g;->e:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 0

    .line 1
    invoke-virtual {p0}, LW3/g;->onDetachedFromActivity()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object p1, p0, LW3/g;->f:Lk3/o;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lk3/o;->b(Lk3/m;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, LW3/g;->f:Lk3/o;

    .line 8
    .line 9
    return-void
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, LW3/g;->e:Landroid/content/Context;

    .line 3
    .line 4
    check-cast p1, Lm/J0;

    .line 5
    .line 6
    iget-object p1, p1, Lm/J0;->e:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    iput-object p1, p0, LW3/g;->e:Landroid/content/Context;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, LW3/g;->f:Lk3/o;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v1, LA/c;

    .line 19
    .line 20
    const/16 v2, 0x1a

    .line 21
    .line 22
    invoke-direct {v1, v2, p1, v0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lk3/o;->b(Lk3/m;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
