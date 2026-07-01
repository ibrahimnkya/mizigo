.class public final synthetic Lq3/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/w;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lq3/e;


# direct methods
.method public synthetic constructor <init>(Lq3/e;I)V
    .locals 0

    .line 1
    iput p2, p0, Lq3/d;->e:I

    iput-object p1, p0, Lq3/d;->f:Lq3/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget v0, p0, Lq3/d;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p0, Lq3/d;->f:Lq3/e;

    .line 9
    .line 10
    iget-object v0, v0, Lq3/e;->f:Lk3/o;

    .line 11
    .line 12
    const-string v1, "Messaging#onTokenRefresh"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, p1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    check-cast p1, LV1/x;

    .line 20
    .line 21
    invoke-static {p1}, LT0/a;->F(LV1/x;)Ljava/util/HashMap;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Lq3/d;->f:Lq3/e;

    .line 26
    .line 27
    iget-object v0, v0, Lq3/e;->f:Lk3/o;

    .line 28
    .line 29
    const-string v1, "Messaging#onMessage"

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v0, v1, p1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
