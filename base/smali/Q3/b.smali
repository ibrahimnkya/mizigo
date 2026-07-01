.class public final LQ3/b;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:LP3/r;

.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:LQ3/c;

.field public k:I


# direct methods
.method public constructor <init>(LQ3/c;LC3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LQ3/b;->j:LQ3/c;

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
    iput-object p1, p0, LQ3/b;->i:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LQ3/b;->k:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LQ3/b;->k:I

    .line 9
    .line 10
    iget-object p1, p0, LQ3/b;->j:LQ3/c;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, LQ3/c;->a(LP3/r;LA3/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
