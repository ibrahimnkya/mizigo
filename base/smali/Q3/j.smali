.class public final LQ3/j;
.super LC3/c;


# instance fields
.field public synthetic h:Ljava/lang/Object;

.field public i:I

.field public final synthetic j:LA/c;

.field public k:LA/c;

.field public l:LQ3/e;

.field public m:LR3/l;


# direct methods
.method public constructor <init>(LA/c;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LQ3/j;->j:LA/c;

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
    iput-object p1, p0, LQ3/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LQ3/j;->i:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LQ3/j;->i:I

    .line 9
    .line 10
    iget-object p1, p0, LQ3/j;->j:LA/c;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LA/c;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
