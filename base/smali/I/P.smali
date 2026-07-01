.class public final LI/P;
.super LC3/c;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/Object;

.field public i:Ljava/io/FileInputStream;

.field public synthetic j:Ljava/lang/Object;

.field public final synthetic k:LI/Q;

.field public l:I


# direct methods
.method public constructor <init>(LI/Q;LC3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/P;->k:LI/Q;

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
    iput-object p1, p0, LI/P;->j:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LI/P;->l:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LI/P;->l:I

    .line 9
    .line 10
    iget-object p1, p0, LI/P;->k:LI/Q;

    .line 11
    .line 12
    invoke-static {p1, p0}, LI/Q;->a(LI/Q;LC3/c;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1
.end method
