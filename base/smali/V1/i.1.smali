.class public final synthetic LV1/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li1/a;


# instance fields
.field public final synthetic e:Landroid/content/Context;

.field public final synthetic f:Landroid/content/Intent;

.field public final synthetic g:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/Intent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LV1/i;->e:Landroid/content/Context;

    iput-object p2, p0, LV1/i;->f:Landroid/content/Intent;

    iput-boolean p3, p0, LV1/i;->g:Z

    return-void
.end method


# virtual methods
.method public final e(Li1/h;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {}, LR0/b;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Li1/h;->c()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x192

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, LV1/i;->e:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v0, p0, LV1/i;->f:Landroid/content/Intent;

    .line 25
    .line 26
    iget-boolean v1, p0, LV1/i;->g:Z

    .line 27
    .line 28
    invoke-static {p1, v0, v1}, LV1/j;->a(Landroid/content/Context;Landroid/content/Intent;Z)Li1/p;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, LV/c;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v1, LA1/h;

    .line 38
    .line 39
    const/16 v2, 0x14

    .line 40
    .line 41
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Li1/p;->h(Ljava/util/concurrent/Executor;Li1/a;)Li1/p;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :cond_1
    :goto_0
    return-object p1
.end method
