.class public final synthetic LX3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LH3/a;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LX3/d;


# direct methods
.method public synthetic constructor <init>(LX3/d;I)V
    .locals 0

    .line 1
    iput p2, p0, LX3/c;->e:I

    iput-object p1, p0, LX3/c;->f:LX3/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, LX3/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LX3/c;->f:LX3/d;

    .line 7
    .line 8
    invoke-virtual {v0}, LX3/d;->d()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, LX3/d;->c()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v1, v0, LX3/d;->k:Z

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, LX3/d;->d()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v0, v0, LX3/d;->l:LX3/a;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, LT2/g;->e()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    sget-object v0, Ly3/h;->a:Ly3/h;

    .line 36
    .line 37
    return-object v0

    .line 38
    :pswitch_0
    iget-object v0, p0, LX3/c;->f:LX3/d;

    .line 39
    .line 40
    iget-boolean v1, v0, LX3/d;->k:Z

    .line 41
    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, LX3/d;->d()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    iget-object v0, v0, LX3/d;->l:LX3/a;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 55
    .line 56
    .line 57
    :cond_2
    sget-object v0, Ly3/h;->a:Ly3/h;

    .line 58
    .line 59
    return-object v0

    .line 60
    nop

    .line 61
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
