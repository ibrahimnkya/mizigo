.class public final LI/h0;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:LV3/c;

.field public i:Z

.field public synthetic j:Ljava/lang/Object;

.field public final synthetic k:LI/j0;

.field public l:I


# direct methods
.method public constructor <init>(LI/j0;LC3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/h0;->k:LI/j0;

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
    iput-object p1, p0, LI/h0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI/h0;->l:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI/h0;->l:I

    .line 9
    .line 10
    iget-object p1, p0, LI/h0;->k:LI/j0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LI/j0;->c(LH3/p;LC3/c;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
