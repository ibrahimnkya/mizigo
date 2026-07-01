.class public final Lk3/o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk3/f;

.field public final b:Ljava/lang/String;

.field public final c:Lk3/p;

.field public final d:LN1/e;


# direct methods
.method public constructor <init>(Lk3/f;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lk3/v;->a:Lk3/v;

    const/4 v1, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0, v1}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    return-void
.end method

.method public constructor <init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lk3/o;->a:Lk3/f;

    .line 5
    iput-object p2, p0, Lk3/o;->b:Ljava/lang/String;

    .line 6
    iput-object p3, p0, Lk3/o;->c:Lk3/p;

    .line 7
    iput-object p4, p0, Lk3/o;->d:LN1/e;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V
    .locals 1

    .line 1
    new-instance v0, Lk3/l;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lk3/l;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lk3/o;->c:Lk3/p;

    .line 7
    .line 8
    invoke-interface {p1, v0}, Lk3/p;->f(Lk3/l;)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p3, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance p2, Lk3/a;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-direct {p2, v0, p0, p3}, Lk3/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p3, p0, Lk3/o;->a:Lk3/f;

    .line 23
    .line 24
    iget-object v0, p0, Lk3/o;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p3, v0, p1, p2}, Lk3/f;->h(Ljava/lang/String;Ljava/nio/ByteBuffer;Lk3/e;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final b(Lk3/m;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lk3/o;->b:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v2, p0, Lk3/o;->a:Lk3/f;

    .line 5
    .line 6
    iget-object v3, p0, Lk3/o;->d:LN1/e;

    .line 7
    .line 8
    if-eqz v3, :cond_1

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, LZ2/s;

    .line 14
    .line 15
    const/16 v4, 0x14

    .line 16
    .line 17
    invoke-direct {v0, v4, p0, p1}, LZ2/s;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-interface {v2, v1, v0, v3}, Lk3/f;->r(Ljava/lang/String;Lk3/d;LN1/e;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    if-nez p1, :cond_2

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_2
    new-instance v0, LZ2/s;

    .line 28
    .line 29
    const/16 v3, 0x14

    .line 30
    .line 31
    invoke-direct {v0, v3, p0, p1}, LZ2/s;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    invoke-interface {v2, v1, v0}, Lk3/f;->m(Ljava/lang/String;Lk3/d;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
