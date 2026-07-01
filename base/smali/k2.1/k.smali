.class public final synthetic Lk2/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc1/d;
.implements Lc1/b;
.implements Lc1/c;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lk2/o;


# direct methods
.method public synthetic constructor <init>(Lk2/o;I)V
    .locals 0

    .line 1
    iput p2, p0, Lk2/k;->e:I

    iput-object p1, p0, Lk2/k;->f:Lk2/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Le1/o;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lk2/k;->f:Lk2/o;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public e(Le1/o;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lk2/k;->f:Lk2/o;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public v(Le1/o;)Z
    .locals 2

    .line 1
    iget v0, p0, Lk2/k;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lk2/k;->f:Lk2/o;

    .line 7
    .line 8
    iget-object v1, v0, Lk2/o;->p:Ls3/g;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, Lk2/o;->m:Lk2/e;

    .line 13
    .line 14
    iget-object v0, v0, Lk2/e;->c:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Li2/a;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ls3/g;->b(Li2/a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    return p1

    .line 27
    :pswitch_0
    iget-object v0, p0, Lk2/k;->f:Lk2/o;

    .line 28
    .line 29
    iget-object v1, v0, Lk2/o;->q:Ls3/j;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v0, v0, Lk2/o;->j:Lk2/e;

    .line 34
    .line 35
    iget-object v0, v0, Lk2/e;->c:Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Ls3/t;

    .line 42
    .line 43
    iget-object v0, v1, Ls3/j;->w:Ls3/w;

    .line 44
    .line 45
    iget-object p1, p1, Ls3/t;->d:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ls3/w;->b(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 p1, 0x0

    .line 56
    :goto_0
    return p1

    .line 57
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
