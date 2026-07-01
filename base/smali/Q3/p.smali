.class public final LQ3/p;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:LQ3/q;

.field public i:LQ3/e;

.field public j:LQ3/s;

.field public k:LN3/P;

.field public l:Ljava/lang/Object;

.field public synthetic m:Ljava/lang/Object;

.field public final synthetic n:LQ3/q;

.field public o:I


# direct methods
.method public constructor <init>(LQ3/q;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LQ3/p;->n:LQ3/q;

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
    iput-object p1, p0, LQ3/p;->m:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LQ3/p;->o:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LQ3/p;->o:I

    .line 9
    .line 10
    iget-object p1, p0, LQ3/p;->n:LQ3/q;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LQ3/q;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    sget-object p1, LB3/a;->e:LB3/a;

    .line 17
    .line 18
    return-object p1
.end method
