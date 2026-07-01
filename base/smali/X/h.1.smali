.class public final LX/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LX/h;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5

    .line 1
    iget v0, p0, LX/h;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/lang/Comparable;

    .line 7
    .line 8
    check-cast p2, Ljava/lang/Comparable;

    .line 9
    .line 10
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    return p1

    .line 15
    :pswitch_0
    check-cast p1, LX/i;

    .line 16
    .line 17
    check-cast p2, LX/i;

    .line 18
    .line 19
    iget-object v0, p1, LX/i;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    move v3, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v1

    .line 28
    :goto_0
    iget-object v4, p2, LX/i;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    if-nez v4, :cond_1

    .line 31
    .line 32
    move v4, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v4, v1

    .line 35
    :goto_1
    if-eq v3, v4, :cond_2

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    iget-boolean v0, p1, LX/i;->a:Z

    .line 41
    .line 42
    iget-boolean v3, p2, LX/i;->a:Z

    .line 43
    .line 44
    if-eq v0, v3, :cond_5

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    :cond_3
    const/4 v1, -0x1

    .line 49
    goto :goto_3

    .line 50
    :cond_4
    :goto_2
    move v1, v2

    .line 51
    goto :goto_3

    .line 52
    :cond_5
    iget v0, p2, LX/i;->b:I

    .line 53
    .line 54
    iget v2, p1, LX/i;->b:I

    .line 55
    .line 56
    sub-int/2addr v0, v2

    .line 57
    if-eqz v0, :cond_6

    .line 58
    .line 59
    move v1, v0

    .line 60
    goto :goto_3

    .line 61
    :cond_6
    iget p1, p1, LX/i;->c:I

    .line 62
    .line 63
    iget p2, p2, LX/i;->c:I

    .line 64
    .line 65
    sub-int/2addr p1, p2

    .line 66
    if-eqz p1, :cond_7

    .line 67
    .line 68
    move v1, p1

    .line 69
    :cond_7
    :goto_3
    return v1

    .line 70
    nop

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
