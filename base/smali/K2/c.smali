.class public final LK2/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx2/b;

.field public final b:Lr2/o;

.field public final c:Lr2/o;

.field public final d:Lr2/o;

.field public final e:Lr2/o;

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I


# direct methods
.method public constructor <init>(LK2/c;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iget-object v0, p1, LK2/c;->a:Lx2/b;

    iput-object v0, p0, LK2/c;->a:Lx2/b;

    .line 31
    iget-object v0, p1, LK2/c;->b:Lr2/o;

    iput-object v0, p0, LK2/c;->b:Lr2/o;

    .line 32
    iget-object v0, p1, LK2/c;->c:Lr2/o;

    iput-object v0, p0, LK2/c;->c:Lr2/o;

    .line 33
    iget-object v0, p1, LK2/c;->d:Lr2/o;

    iput-object v0, p0, LK2/c;->d:Lr2/o;

    .line 34
    iget-object v0, p1, LK2/c;->e:Lr2/o;

    iput-object v0, p0, LK2/c;->e:Lr2/o;

    .line 35
    iget v0, p1, LK2/c;->f:I

    iput v0, p0, LK2/c;->f:I

    .line 36
    iget v0, p1, LK2/c;->g:I

    iput v0, p0, LK2/c;->g:I

    .line 37
    iget v0, p1, LK2/c;->h:I

    iput v0, p0, LK2/c;->h:I

    .line 38
    iget p1, p1, LK2/c;->i:I

    iput p1, p0, LK2/c;->i:I

    return-void
.end method

.method public constructor <init>(Lx2/b;Lr2/o;Lr2/o;Lr2/o;Lr2/o;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_1

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    move v2, v0

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v1

    :goto_1
    if-eqz p4, :cond_2

    if-nez p5, :cond_3

    :cond_2
    move v0, v1

    :cond_3
    if-eqz v2, :cond_5

    if-nez v0, :cond_4

    goto :goto_2

    .line 2
    :cond_4
    invoke-static {}, Lr2/i;->a()Lr2/i;

    move-result-object p1

    throw p1

    :cond_5
    :goto_2
    if-eqz v2, :cond_6

    .line 3
    new-instance p2, Lr2/o;

    .line 4
    iget p3, p4, Lr2/o;->b:F

    const/4 v0, 0x0

    .line 5
    invoke-direct {p2, v0, p3}, Lr2/o;-><init>(FF)V

    .line 6
    new-instance p3, Lr2/o;

    .line 7
    iget v1, p5, Lr2/o;->b:F

    .line 8
    invoke-direct {p3, v0, v1}, Lr2/o;-><init>(FF)V

    goto :goto_3

    :cond_6
    if-eqz v0, :cond_7

    .line 9
    new-instance p4, Lr2/o;

    .line 10
    iget p5, p1, Lx2/b;->e:I

    add-int/lit8 v0, p5, -0x1

    int-to-float v0, v0

    .line 11
    iget v2, p2, Lr2/o;->b:F

    .line 12
    invoke-direct {p4, v0, v2}, Lr2/o;-><init>(FF)V

    .line 13
    new-instance v0, Lr2/o;

    sub-int/2addr p5, v1

    int-to-float p5, p5

    .line 14
    iget v1, p3, Lr2/o;->b:F

    .line 15
    invoke-direct {v0, p5, v1}, Lr2/o;-><init>(FF)V

    move-object p5, v0

    .line 16
    :cond_7
    :goto_3
    iput-object p1, p0, LK2/c;->a:Lx2/b;

    .line 17
    iput-object p2, p0, LK2/c;->b:Lr2/o;

    .line 18
    iput-object p3, p0, LK2/c;->c:Lr2/o;

    .line 19
    iput-object p4, p0, LK2/c;->d:Lr2/o;

    .line 20
    iput-object p5, p0, LK2/c;->e:Lr2/o;

    .line 21
    iget p1, p2, Lr2/o;->a:F

    iget v0, p3, Lr2/o;->a:F

    .line 22
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, LK2/c;->f:I

    .line 23
    iget p1, p4, Lr2/o;->a:F

    iget v0, p5, Lr2/o;->a:F

    .line 24
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, LK2/c;->g:I

    .line 25
    iget p1, p2, Lr2/o;->b:F

    iget p2, p4, Lr2/o;->b:F

    .line 26
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, LK2/c;->h:I

    .line 27
    iget p1, p3, Lr2/o;->b:F

    iget p2, p5, Lr2/o;->b:F

    .line 28
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, LK2/c;->i:I

    return-void
.end method
