.class public final LI/W;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:LI/X;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:LI/Z;

.field public synthetic l:Ljava/lang/Object;

.field public final synthetic m:LI/X;

.field public n:I


# direct methods
.method public constructor <init>(LI/X;LC3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/W;->m:LI/X;

    .line 2
    .line 3
    invoke-direct {p0, p2}, LC3/c;-><init>(LA3/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, LI/W;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI/W;->n:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI/W;->n:I

    .line 9
    .line 10
    iget-object p1, p0, LI/W;->m:LI/X;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LI/X;->b(LI/N;LC3/c;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
