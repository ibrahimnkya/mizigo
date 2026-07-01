.class public final Le1/d;
.super Le1/e;
.source "SourceFile"


# instance fields
.field public final synthetic h:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    iput p1, p0, Le1/d;->h:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, v0, v0}, Le1/e;-><init>(ILe1/c;Ljava/lang/Float;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_0
    const/4 p1, 0x1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0, v0}, Le1/e;-><init>(ILe1/c;Ljava/lang/Float;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_1
    const/4 p1, 0x2

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, v0, v0}, Le1/e;-><init>(ILe1/c;Ljava/lang/Float;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Le1/d;->h:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "[SquareCap]"

    .line 7
    .line 8
    return-object v0

    .line 9
    :pswitch_0
    const-string v0, "[RoundCap]"

    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_1
    const-string v0, "[ButtCap]"

    .line 13
    .line 14
    return-object v0

    .line 15
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
