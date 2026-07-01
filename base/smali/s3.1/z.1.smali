.class public final synthetic Ls3/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/b;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ls3/l;


# direct methods
.method public synthetic constructor <init>(Ls3/l;I)V
    .locals 0

    .line 1
    iput p2, p0, Ls3/z;->e:I

    iput-object p1, p0, Ls3/z;->f:Ls3/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 4

    .line 1
    iget v0, p0, Ls3/z;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ls3/z;->f:Ls3/l;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p1}, Ls3/l;->c()V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    check-cast p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ls3/x0;

    .line 44
    .line 45
    new-instance v2, Lp3/i;

    .line 46
    .line 47
    const/16 v3, 0x8

    .line 48
    .line 49
    invoke-direct {v2, v0, p2, v3}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ls3/z;->f:Ls3/l;

    .line 53
    .line 54
    iget-boolean v0, p2, Ls3/l;->b:Z

    .line 55
    .line 56
    if-nez v0, :cond_4

    .line 57
    .line 58
    sget-object v0, Ls3/l;->c:Lp3/i;

    .line 59
    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_0
    sput-object v2, Ls3/l;->c:Lp3/i;

    .line 64
    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/4 v0, 0x1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    if-eq p1, v0, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    const/4 v1, 0x2

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    move v1, v0

    .line 81
    :goto_1
    iget-object p1, p2, Ls3/l;->a:Landroid/content/Context;

    .line 82
    .line 83
    invoke-static {p1, v1, p2}, Lc1/g;->z(Landroid/content/Context;ILs3/l;)I

    .line 84
    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_4
    :goto_2
    new-instance p1, Ls3/x;

    .line 88
    .line 89
    const-string p2, "Renderer already initialized"

    .line 90
    .line 91
    const-string v0, "Renderer initialization called multiple times"

    .line 92
    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-direct {p1, p2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, p1}, Lp3/i;->b(Ls3/x;)V

    .line 98
    .line 99
    .line 100
    :goto_3
    return-void

    .line 101
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
