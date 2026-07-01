.class public final LX3/a;
.super Lcom/journeyapps/barcodescanner/BarcodeView;
.source "SourceFile"


# instance fields
.field public K:I


# virtual methods
.method public final b(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 3

    .line 1
    const-string v0, "surface"

    .line 2
    .line 3
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    invoke-super {p0, p1, p2}, LT2/g;->b(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget p2, p0, LX3/a;->K:I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    if-eq p2, v1, :cond_0

    .line 22
    .line 23
    new-instance p2, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    iget v1, p2, Landroid/graphics/Rect;->bottom:I

    .line 29
    .line 30
    iget v2, p0, LX3/a;->K:I

    .line 31
    .line 32
    sub-int/2addr v1, v2

    .line 33
    iput v1, p2, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    sub-int/2addr v1, v2

    .line 38
    iput v1, p2, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    return-object p2

    .line 47
    :cond_0
    return-object p1
.end method
