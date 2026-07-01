.class public final LW2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LW2/d;
.implements Lcom/dexterous/flutterlocalnotifications/h;


# instance fields
.field public final synthetic e:I

.field public final f:Lk3/n;


# direct methods
.method public synthetic constructor <init>(Lk3/n;I)V
    .locals 0

    .line 1
    iput p2, p0, LW2/b;->e:I

    iput-object p1, p0, LW2/b;->f:Lk3/n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LW2/b;->f:Lk3/n;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lk3/n;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget v0, p0, LW2/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LW2/b;->f:Lk3/n;

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {v0, p1}, Lk3/n;->a(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    iget-object v0, p0, LW2/b;->f:Lk3/n;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {v0, p1}, Lk3/n;->a(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "sqlite_error"

    .line 2
    .line 3
    iget-object v1, p0, LW2/b;->f:Lk3/n;

    .line 4
    .line 5
    invoke-interface {v1, v0, p2, p1}, Lk3/n;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    iget v0, p0, LW2/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "permissionRequestInProgress"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iget-object v2, p0, LW2/b;->f:Lk3/n;

    .line 10
    .line 11
    const-string v3, "Another permission request is already in progress"

    .line 12
    .line 13
    invoke-interface {v2, v0, v3, v1}, Lk3/n;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_0
    const-string v0, "permissionRequestInProgress"

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iget-object v2, p0, LW2/b;->f:Lk3/n;

    .line 21
    .line 22
    const-string v3, "Another permission request is already in progress"

    .line 23
    .line 24
    invoke-interface {v2, v0, v3, v1}, Lk3/n;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
