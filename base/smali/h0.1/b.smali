.class public final Lh0/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh0/h;


# static fields
.field public static final g:Lh0/b;

.field public static final h:Lh0/b;

.field public static final i:Lh0/b;

.field public static final j:Lh0/b;

.field public static final k:Lh0/b;

.field public static final l:Lh0/b;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lh0/b;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lh0/b;->g:Lh0/b;

    .line 10
    .line 11
    new-instance v0, Lh0/b;

    .line 12
    .line 13
    const-string v1, "FULL"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lh0/b;->h:Lh0/b;

    .line 19
    .line 20
    new-instance v0, Lh0/b;

    .line 21
    .line 22
    const-string v1, "FLAT"

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lh0/b;->i:Lh0/b;

    .line 29
    .line 30
    new-instance v0, Lh0/b;

    .line 31
    .line 32
    const-string v1, "HALF_OPENED"

    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lh0/b;->j:Lh0/b;

    .line 38
    .line 39
    new-instance v0, Lh0/b;

    .line 40
    .line 41
    const-string v1, "FOLD"

    .line 42
    .line 43
    const/4 v2, 0x2

    .line 44
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lh0/b;->k:Lh0/b;

    .line 48
    .line 49
    new-instance v0, Lh0/b;

    .line 50
    .line 51
    const-string v1, "HINGE"

    .line 52
    .line 53
    invoke-direct {v0, v1, v2}, Lh0/b;-><init>(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lh0/b;->l:Lh0/b;

    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>(Li0/a;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lh0/b;->e:I

    sget v0, Lh0/m;->b:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lh0/b;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p2, p0, Lh0/b;->e:I

    iput-object p1, p0, Lh0/b;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lh0/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :pswitch_0
    iget-object v0, p0, Lh0/b;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    return-object v0

    .line 16
    :pswitch_1
    iget-object v0, p0, Lh0/b;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    return-object v0

    .line 21
    :pswitch_2
    iget-object v0, p0, Lh0/b;->f:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    return-object v0

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
