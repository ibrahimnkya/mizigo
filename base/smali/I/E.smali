.class public final LI/E;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/io/Serializable;

.field public k:LI3/p;

.field public l:Z

.field public m:I

.field public synthetic n:Ljava/lang/Object;

.field public final synthetic o:LI/O;

.field public p:I


# direct methods
.method public constructor <init>(LI/O;LC3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/E;->o:LI/O;

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
    iput-object p1, p0, LI/E;->n:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI/E;->p:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI/E;->p:I

    .line 9
    .line 10
    iget-object p1, p0, LI/E;->o:LI/O;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0, p0}, LI/O;->g(LI/O;ZLC3/c;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
