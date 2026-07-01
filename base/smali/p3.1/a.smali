.class public final synthetic Lp3/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/Boolean;

.field public final synthetic h:Li1/i;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;Li1/i;I)V
    .locals 0

    .line 1
    iput p4, p0, Lp3/a;->e:I

    iput-object p1, p0, Lp3/a;->f:Ljava/lang/String;

    iput-object p2, p0, Lp3/a;->g:Ljava/lang/Boolean;

    iput-object p3, p0, Lp3/a;->h:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget v0, p0, Lp3/a;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, Lp3/a;->h:Li1/i;

    .line 5
    .line 6
    iget-object v3, p0, Lp3/a;->g:Ljava/lang/Boolean;

    .line 7
    .line 8
    iget-object v4, p0, Lp3/a;->f:Ljava/lang/String;

    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    sget-object v0, Lp3/d;->g:Ljava/util/HashMap;

    .line 14
    .line 15
    :try_start_0
    invoke-static {v4}, LA1/g;->e(Ljava/lang/String;)LA1/g;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, v3}, LA1/g;->k(Ljava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v1}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception v0

    .line 27
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :pswitch_0
    sget-object v0, Lp3/d;->g:Ljava/util/HashMap;

    .line 32
    .line 33
    :try_start_1
    invoke-static {v4}, LA1/g;->e(Ljava/lang/String;)LA1/g;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v0}, LA1/g;->a()V

    .line 42
    .line 43
    .line 44
    iget-object v4, v0, LA1/g;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    xor-int/lit8 v5, v3, 0x1

    .line 47
    .line 48
    invoke-virtual {v4, v5, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_1

    .line 53
    .line 54
    sget-object v4, LM0/c;->i:LM0/c;

    .line 55
    .line 56
    iget-object v4, v4, LM0/c;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 57
    .line 58
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    if-eqz v4, :cond_0

    .line 65
    .line 66
    const/4 v3, 0x1

    .line 67
    invoke-virtual {v0, v3}, LA1/g;->j(Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_0
    if-nez v3, :cond_1

    .line 72
    .line 73
    if-eqz v4, :cond_1

    .line 74
    .line 75
    const/4 v3, 0x0

    .line 76
    invoke-virtual {v0, v3}, LA1/g;->j(Z)V

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_1
    invoke-virtual {v2, v1}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :catch_1
    move-exception v0

    .line 84
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 85
    .line 86
    .line 87
    :goto_2
    return-void

    .line 88
    nop

    .line 89
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
