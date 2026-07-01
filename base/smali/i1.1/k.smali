.class public final Li1/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li1/m;
.implements Li1/e;
.implements Li1/d;
.implements Li1/b;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/util/concurrent/Executor;

.field public final g:Li1/a;

.field public final h:Li1/p;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Li1/a;Li1/p;I)V
    .locals 0

    .line 1
    iput p4, p0, Li1/k;->e:I

    iput-object p1, p0, Li1/k;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/k;->g:Li1/a;

    iput-object p3, p0, Li1/k;->h:Li1/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/k;->h:Li1/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Li1/p;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/k;->h:Li1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Li1/p;->l(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Li1/h;)V
    .locals 3

    .line 1
    iget v0, p0, Li1/k;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, LA/a;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v0, p0, p1, v1, v2}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Li1/k;->f:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_0
    new-instance v0, LA/a;

    .line 21
    .line 22
    const/4 v1, 0x7

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v0, p0, p1, v1, v2}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Li1/k;->f:Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/k;->h:Li1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
