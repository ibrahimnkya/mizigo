.class public final Ls3/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/s;


# instance fields
.field public final e:Ln2/d;

.field public final f:Le1/C;


# direct methods
.method public constructor <init>(Ln2/d;Le1/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls3/r;->e:Ln2/d;

    .line 5
    .line 6
    iput-object p2, p0, Ls3/r;->f:Le1/C;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ls3/r;->e:Ln2/d;

    .line 2
    .line 3
    iput p1, v0, Ln2/d;->f:I

    .line 4
    .line 5
    sget-object v1, Ln2/d;->o:LM2/b;

    .line 6
    .line 7
    int-to-double v1, p1

    .line 8
    const-wide/high16 v3, 0x4008000000000000L    # 3.0

    .line 9
    .line 10
    div-double/2addr v1, v3

    .line 11
    invoke-static {p1, v1, v2}, LV0/g;->p(ID)[D

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, v0, Ln2/d;->m:[D

    .line 16
    .line 17
    iget p1, v0, Ln2/d;->f:I

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ln2/d;->a(I)[D

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, v0, Ln2/d;->n:[D

    .line 24
    .line 25
    return-void
.end method

.method public final f(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/r;->e:Ln2/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ln2/d;->c(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(LM2/b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/r;->e:Ln2/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ln2/d;->b(LM2/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(D)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/r;->e:Ln2/d;

    .line 2
    .line 3
    iput-wide p1, v0, Ln2/d;->i:D

    .line 4
    .line 5
    iget-object p1, v0, Ln2/d;->e:Ljava/util/Collection;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ln2/d;->c(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final k(D)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/r;->e:Ln2/d;

    .line 2
    .line 3
    iput-wide p1, v0, Ln2/d;->h:D

    .line 4
    .line 5
    iget-object p1, v0, Ln2/d;->g:LM2/b;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ln2/d;->b(LM2/b;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
