.class public final synthetic Lk2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc1/c;
.implements Lc1/d;
.implements Lc1/b;


# instance fields
.field public final synthetic e:Lk2/j;


# direct methods
.method public synthetic constructor <init>(Lk2/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk2/b;->e:Lk2/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Le1/o;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lk2/b;->e:Lk2/j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public e(Le1/o;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lk2/b;->e:Lk2/j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public v(Le1/o;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lk2/b;->e:Lk2/j;

    .line 2
    .line 3
    iget-object v1, v0, Lk2/j;->p:Ls3/g;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lk2/j;->m:Lk2/e;

    .line 8
    .line 9
    iget-object v0, v0, Lk2/e;->c:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Li2/a;

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ls3/g;->b(Li2/a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    return p1
.end method
