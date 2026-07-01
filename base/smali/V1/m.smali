.class public final synthetic LV1/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li1/e;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lcom/google/firebase/messaging/FirebaseMessaging;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V
    .locals 0

    .line 1
    iput p2, p0, LV1/m;->e:I

    iput-object p1, p0, LV1/m;->f:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, LV1/m;->e:I

    .line 2
    .line 3
    iget-object v1, p0, LV1/m;->f:Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p1, LJ0/a;

    .line 9
    .line 10
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->l:LA0/c;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p1, LJ0/a;->e:Landroid/content/Intent;

    .line 18
    .line 19
    invoke-static {p1}, Landroid/support/v4/media/session/a;->F(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->g()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :pswitch_0
    check-cast p1, LV1/E;

    .line 27
    .line 28
    iget-object v0, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->e:LV1/q;

    .line 29
    .line 30
    invoke-virtual {v0}, LV1/q;->b()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, LV1/E;->f()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    nop

    .line 41
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
