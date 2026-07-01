.class public final LQ3/f;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:LQ3/e;

.field public i:LP3/s;

.field public j:LP3/b;

.field public k:Z

.field public synthetic l:Ljava/lang/Object;

.field public m:I


# virtual methods
.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, LQ3/f;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LQ3/f;->m:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LQ3/f;->m:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, p1, v0, p0}, LQ3/r;->b(LQ3/e;LP3/q;ZLC3/c;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1
.end method
