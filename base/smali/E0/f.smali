.class public final synthetic LE0/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:LE0/l;

.field public final synthetic f:Ly0/i;

.field public final synthetic g:I

.field public final synthetic h:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(LE0/l;Ly0/i;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LE0/f;->e:LE0/l;

    iput-object p2, p0, LE0/f;->f:Ly0/i;

    iput p3, p0, LE0/f;->g:I

    iput-object p4, p0, LE0/f;->h:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, LE0/f;->f:Ly0/i;

    .line 2
    .line 3
    iget v1, p0, LE0/f;->g:I

    .line 4
    .line 5
    iget-object v2, p0, LE0/f;->h:Ljava/lang/Runnable;

    .line 6
    .line 7
    iget-object v3, p0, LE0/f;->e:LE0/l;

    .line 8
    .line 9
    iget-object v4, v3, LE0/l;->f:LG0/c;

    .line 10
    .line 11
    :try_start_0
    iget-object v5, v3, LE0/l;->c:LF0/d;

    .line 12
    .line 13
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v6, LD1/a;

    .line 17
    .line 18
    const/4 v7, 0x2

    .line 19
    invoke-direct {v6, v7, v5}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    move-object v5, v4

    .line 23
    check-cast v5, LF0/h;

    .line 24
    .line 25
    invoke-virtual {v5, v6}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object v5, v3, LE0/l;->a:Landroid/content/Context;

    .line 29
    .line 30
    const-string v6, "connectivity"

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Landroid/net/ConnectivityManager;

    .line 37
    .line 38
    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    if-eqz v5, :cond_0

    .line 43
    .line 44
    invoke-virtual {v5}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-eqz v5, :cond_0

    .line 49
    .line 50
    invoke-virtual {v3, v0, v1}, LE0/l;->a(Ly0/i;I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    new-instance v5, LE0/g;

    .line 57
    .line 58
    invoke-direct {v5, v3, v0, v1}, LE0/g;-><init>(LE0/l;Ly0/i;I)V

    .line 59
    .line 60
    .line 61
    check-cast v4, LF0/h;

    .line 62
    .line 63
    invoke-virtual {v4, v5}, LF0/h;->f(LG0/b;)Ljava/lang/Object;
    :try_end_0
    .catch LG0/a; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    :try_start_1
    iget-object v3, v3, LE0/l;->d:LE0/d;

    .line 71
    .line 72
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    const/4 v4, 0x0

    .line 75
    invoke-virtual {v3, v0, v1, v4}, LE0/d;->a(Ly0/i;IZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    .line 77
    .line 78
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :goto_1
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 83
    .line 84
    .line 85
    throw v0
.end method
