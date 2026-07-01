.class public final synthetic LE1/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Runnable;

.field public final synthetic g:LA0/c;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;LA0/c;I)V
    .locals 0

    .line 1
    iput p3, p0, LE1/b;->e:I

    iput-object p1, p0, LE1/b;->f:Ljava/lang/Runnable;

    iput-object p2, p0, LE1/b;->g:LA0/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, LE1/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LE1/b;->f:Ljava/lang/Runnable;

    .line 7
    .line 8
    iget-object v1, p0, LE1/b;->g:LA0/c;

    .line 9
    .line 10
    :try_start_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    iget-object v0, v1, LA0/c;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, LE1/h;

    .line 16
    .line 17
    sget-object v2, Lr/i;->k:Ljava/lang/Object;

    .line 18
    .line 19
    sget-object v3, Lr/i;->j:LV0/g;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-virtual {v3, v0, v4, v2}, LV0/g;->f(Lr/i;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-static {v0}, Lr/i;->c(Lr/i;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-virtual {v1, v0}, LA0/c;->A(Ljava/lang/Exception;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    :goto_0
    return-void

    .line 37
    :pswitch_0
    iget-object v0, p0, LE1/b;->f:Ljava/lang/Runnable;

    .line 38
    .line 39
    :try_start_1
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catch_1
    move-exception v0

    .line 44
    iget-object v1, p0, LE1/b;->g:LA0/c;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, LA0/c;->A(Ljava/lang/Exception;)V

    .line 47
    .line 48
    .line 49
    :goto_1
    return-void

    .line 50
    :pswitch_1
    iget-object v0, p0, LE1/b;->f:Ljava/lang/Runnable;

    .line 51
    .line 52
    :try_start_2
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catch_2
    move-exception v0

    .line 57
    iget-object v1, p0, LE1/b;->g:LA0/c;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, LA0/c;->A(Ljava/lang/Exception;)V

    .line 60
    .line 61
    .line 62
    throw v0

    .line 63
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
