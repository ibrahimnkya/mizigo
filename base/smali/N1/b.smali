.class public final synthetic LN1/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LD1/f;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LD1/v;


# direct methods
.method public synthetic constructor <init>(LD1/v;I)V
    .locals 0

    .line 1
    iput p2, p0, LN1/b;->e:I

    iput-object p1, p0, LN1/b;->f:LD1/v;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(LD1/x;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, LN1/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LN1/b;->f:LD1/v;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;->a(LD1/v;LD1/x;)Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    return-object p1

    .line 13
    :pswitch_0
    new-instance v0, LN1/d;

    .line 14
    .line 15
    const-class v1, Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p1, v1}, LD1/x;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/content/Context;

    .line 22
    .line 23
    const-class v2, LA1/g;

    .line 24
    .line 25
    invoke-virtual {p1, v2}, LD1/x;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, LA1/g;

    .line 30
    .line 31
    invoke-virtual {v2}, LA1/g;->f()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-class v3, LN1/e;

    .line 36
    .line 37
    invoke-static {v3}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {p1, v3}, LD1/x;->c(LD1/v;)Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-class v4, LX1/b;

    .line 46
    .line 47
    invoke-virtual {p1, v4}, LD1/x;->f(Ljava/lang/Class;)LP1/a;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-object v5, p0, LN1/b;->f:LD1/v;

    .line 52
    .line 53
    invoke-virtual {p1, v5}, LD1/x;->d(LD1/v;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    move-object v5, p1

    .line 58
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 59
    .line 60
    invoke-direct/range {v0 .. v5}, LN1/d;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;LP1/a;Ljava/util/concurrent/Executor;)V

    .line 61
    .line 62
    .line 63
    return-object v0

    .line 64
    nop

    .line 65
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
