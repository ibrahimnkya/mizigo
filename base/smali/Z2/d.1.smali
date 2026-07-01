.class public abstract LZ2/d;
.super Landroid/app/Activity;
.source "SourceFile"

# interfaces
.implements LZ2/g;
.implements Landroidx/lifecycle/q;


# static fields
.field public static final i:I


# instance fields
.field public e:Z

.field public f:LZ2/h;

.field public final g:Landroidx/lifecycle/s;

.field public final h:Landroid/window/OnBackInvokedCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, LZ2/d;->i:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LZ2/d;->e:Z

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x21

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/16 v1, 0x22

    .line 16
    .line 17
    if-lt v0, v1, :cond_1

    .line 18
    .line 19
    new-instance v0, LZ2/c;

    .line 20
    .line 21
    invoke-direct {v0, p0}, LZ2/c;-><init>(LZ2/d;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-instance v0, LZ2/b;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-direct {v0, v1, p0}, LZ2/b;-><init>(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iput-object v0, p0, LZ2/d;->h:Landroid/window/OnBackInvokedCallback;

    .line 32
    .line 33
    new-instance v0, Landroidx/lifecycle/s;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Landroidx/lifecycle/s;-><init>(Landroidx/lifecycle/q;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final b()Landroidx/lifecycle/s;
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 2
    .line 3
    return-object v0
.end method

.method public final c()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 6
    .line 7
    and-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "android.intent.action.RUN"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_0
    const/4 v0, 0x0

    .line 39
    return-object v0
.end method

.method public final d()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "background_mode"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    const-string v1, "opaque"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v1, "transparent"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    const/4 v0, 0x2

    .line 42
    :goto_0
    return v0

    .line 43
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 44
    .line 45
    const-string v2, "No enum constant io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode."

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw v1

    .line 55
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    .line 56
    .line 57
    const-string v1, "Name is null"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw v0

    .line 63
    :cond_3
    const/4 v0, 0x1

    .line 64
    return v0
.end method

.method public final e()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "cached_engine_id"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "dart_entrypoint"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    :try_start_0
    invoke-virtual {p0}, LZ2/d;->h()Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string v1, "io.flutter.Entrypoint"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, 0x0

    .line 36
    :goto_0
    if-eqz v0, :cond_2

    .line 37
    .line 38
    return-object v0

    .line 39
    :catch_0
    :cond_2
    const-string v0, "main"

    .line 40
    .line 41
    return-object v0
.end method

.method public final g()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "route"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_0
    :try_start_0
    invoke-virtual {p0}, LZ2/d;->h()Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string v1, "io.flutter.InitialRoute"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    return-object v0

    .line 35
    :catch_0
    :cond_1
    const/4 v0, 0x0

    .line 36
    return-object v0
.end method

.method public final h()Landroid/os/Bundle;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x80

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 16
    .line 17
    return-object v0
.end method

.method public final i(Z)V
    .locals 2

    .line 1
    const/16 v0, 0x21

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, LZ2/d;->e:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    if-lt p1, v0, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, LE/c;->k(LZ2/d;)Landroid/window/OnBackInvokedDispatcher;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, LZ2/d;->h:Landroid/window/OnBackInvokedCallback;

    .line 18
    .line 19
    invoke-static {p1, v0}, LE/c;->v(Landroid/window/OnBackInvokedDispatcher;Landroid/window/OnBackInvokedCallback;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, LZ2/d;->e:Z

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    iget-boolean p1, p0, LZ2/d;->e:Z

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 33
    .line 34
    if-lt p1, v0, :cond_1

    .line 35
    .line 36
    invoke-static {p0}, LE/c;->k(LZ2/d;)Landroid/window/OnBackInvokedDispatcher;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, LZ2/d;->h:Landroid/window/OnBackInvokedCallback;

    .line 41
    .line 42
    invoke-static {p1, v0}, LE/c;->y(Landroid/window/OnBackInvokedDispatcher;Landroid/window/OnBackInvokedCallback;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, LZ2/d;->e:Z

    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public final j()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "destroy_engine_with_activity"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, LZ2/d;->e()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, LZ2/d;->f:LZ2/h;

    .line 19
    .line 20
    iget-boolean v1, v1, LZ2/h;->g:Z

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    :cond_1
    :goto_0
    return v0
.end method

.method public final k()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "enable_state_restoration"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    return v0

    .line 23
    :cond_0
    invoke-virtual {p0}, LZ2/d;->e()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return v2

    .line 30
    :cond_1
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public final l(Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, " "

    .line 5
    .line 6
    const-string v3, "FlutterActivity "

    .line 7
    .line 8
    const-string v4, "FlutterActivity"

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, " called after release."

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {v4, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    iget-boolean v0, v0, LZ2/h;->j:Z

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p1, " called after detach."

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {v4, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return v1

    .line 78
    :cond_1
    const/4 p1, 0x1

    .line 79
    return p1
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1
    const-string v0, "onActivityResult"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 10
    .line 11
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 15
    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 22
    .line 23
    iget-object v0, v0, La3/c;->d:La3/d;

    .line 24
    .line 25
    invoke-virtual {v0}, La3/d;->f()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    const-string v1, "FlutterEngineConnectionRegistry#onActivityResult"

    .line 32
    .line 33
    invoke-static {v1}, Lw3/a;->b(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, v0, La3/d;->f:Lm/J0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/util/HashSet;

    .line 42
    .line 43
    iget-object v0, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Ljava/util/HashSet;

    .line 46
    .line 47
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    :cond_0
    move v2, v1

    .line 56
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lk3/q;

    .line 67
    .line 68
    invoke-interface {v3, p1, p2, p3}, Lk3/q;->onActivityResult(IILandroid/content/Intent;)Z

    .line 69
    .line 70
    .line 71
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    if-nez v3, :cond_1

    .line 73
    .line 74
    if-eqz v2, :cond_0

    .line 75
    .line 76
    :cond_1
    const/4 v2, 0x1

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :catchall_1
    move-exception p2

    .line 88
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    throw p1

    .line 92
    :cond_3
    const-string p1, "FlutterEngineCxnRegstry"

    .line 93
    .line 94
    const-string p2, "Attempted to notify ActivityAware plugins of onActivityResult, but no Activity was attached."

    .line 95
    .line 96
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    const-string p1, "FlutterActivityAndFragmentDelegate"

    .line 101
    .line 102
    const-string p2, "onActivityResult() invoked before FlutterFragment was attached to an Activity."

    .line 103
    .line 104
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    :cond_5
    return-void
.end method

.method public final onBackPressed()V
    .locals 3

    .line 1
    const-string v0, "onBackPressed"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 10
    .line 11
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, v0, La3/c;->i:Lj3/b;

    .line 19
    .line 20
    iget-object v0, v0, Lj3/b;->f:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Lk3/o;

    .line 23
    .line 24
    const-string v1, "popRoute"

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string v0, "FlutterActivityAndFragmentDelegate"

    .line 32
    .line 33
    const-string v1, "Invoked onBackPressed() before FlutterFragment was attached to an Activity."

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 14

    .line 1
    :try_start_0
    invoke-virtual {p0}, LZ2/d;->h()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "io.flutter.embedding.android.NormalTheme"

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/Context;->setTheme(I)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    const-string v0, "FlutterActivity"

    .line 21
    .line 22
    const-string v1, "Could not read meta-data for FlutterActivity. Using the launch theme as normal theme."

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const-string v0, "enableOnBackInvokedCallbackState"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0, v0}, LZ2/d;->i(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    new-instance v0, LZ2/h;

    .line 42
    .line 43
    invoke-direct {v0, p0}, LZ2/h;-><init>(LZ2/d;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 47
    .line 48
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 49
    .line 50
    .line 51
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    const/4 v3, 0x0

    .line 55
    const/4 v4, 0x1

    .line 56
    if-nez v1, :cond_9

    .line 57
    .line 58
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 59
    .line 60
    invoke-virtual {v1}, LZ2/d;->e()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    sget-object v5, La3/h;->c:La3/h;

    .line 67
    .line 68
    if-nez v5, :cond_2

    .line 69
    .line 70
    new-instance v5, La3/h;

    .line 71
    .line 72
    const/4 v6, 0x1

    .line 73
    invoke-direct {v5, v6}, La3/h;-><init>(I)V

    .line 74
    .line 75
    .line 76
    sput-object v5, La3/h;->c:La3/h;

    .line 77
    .line 78
    :cond_2
    sget-object v5, La3/h;->c:La3/h;

    .line 79
    .line 80
    iget-object v5, v5, La3/h;->a:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    check-cast v5, La3/c;

    .line 87
    .line 88
    iput-object v5, v0, LZ2/h;->b:La3/c;

    .line 89
    .line 90
    iput-boolean v4, v0, LZ2/h;->g:Z

    .line 91
    .line 92
    if-eqz v5, :cond_3

    .line 93
    .line 94
    goto/16 :goto_4

    .line 95
    .line 96
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 97
    .line 98
    const-string v0, "The requested cached FlutterEngine did not exist in the FlutterEngineCache: \'"

    .line 99
    .line 100
    const-string v2, "\'"

    .line 101
    .line 102
    invoke-static {v0, v1, v2}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    throw p1

    .line 110
    :cond_4
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    iput-object v2, v0, LZ2/h;->b:La3/c;

    .line 116
    .line 117
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 118
    .line 119
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-string v5, "cached_engine_group_id"

    .line 124
    .line 125
    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    sget-object v5, La3/h;->b:La3/h;

    .line 132
    .line 133
    if-nez v5, :cond_6

    .line 134
    .line 135
    const-class v5, La3/h;

    .line 136
    .line 137
    monitor-enter v5

    .line 138
    :try_start_1
    sget-object v6, La3/h;->b:La3/h;

    .line 139
    .line 140
    if-nez v6, :cond_5

    .line 141
    .line 142
    new-instance v6, La3/h;

    .line 143
    .line 144
    const/4 v7, 0x0

    .line 145
    invoke-direct {v6, v7}, La3/h;-><init>(I)V

    .line 146
    .line 147
    .line 148
    sput-object v6, La3/h;->b:La3/h;

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :catchall_0
    move-exception v0

    .line 152
    move-object p1, v0

    .line 153
    goto :goto_2

    .line 154
    :cond_5
    :goto_1
    monitor-exit v5

    .line 155
    goto :goto_3

    .line 156
    :goto_2
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    throw p1

    .line 158
    :cond_6
    :goto_3
    sget-object v5, La3/h;->b:La3/h;

    .line 159
    .line 160
    iget-object v5, v5, La3/h;->a:Ljava/util/HashMap;

    .line 161
    .line 162
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    check-cast v5, La3/g;

    .line 167
    .line 168
    if-eqz v5, :cond_7

    .line 169
    .line 170
    new-instance v1, La3/f;

    .line 171
    .line 172
    iget-object v6, v0, LZ2/h;->a:LZ2/d;

    .line 173
    .line 174
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    invoke-direct {v1, v6}, La3/f;-><init>(LZ2/d;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1}, LZ2/h;->a(La3/f;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v5, v1}, La3/g;->a(La3/f;)La3/c;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    iput-object v1, v0, LZ2/h;->b:La3/c;

    .line 188
    .line 189
    iput-boolean v3, v0, LZ2/h;->g:Z

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 193
    .line 194
    const-string v0, "The requested cached FlutterEngineGroup did not exist in the FlutterEngineGroupCache: \'"

    .line 195
    .line 196
    const-string v2, "\'"

    .line 197
    .line 198
    invoke-static {v0, v1, v2}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p1

    .line 206
    :cond_8
    new-instance v1, La3/g;

    .line 207
    .line 208
    iget-object v5, v0, LZ2/h;->a:LZ2/d;

    .line 209
    .line 210
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 211
    .line 212
    .line 213
    iget-object v6, v0, LZ2/h;->a:LZ2/d;

    .line 214
    .line 215
    invoke-virtual {v6}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-static {v6}, LX1/c;->a(Landroid/content/Intent;)LX1/c;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    invoke-virtual {v6}, LX1/c;->b()[Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    invoke-direct {v1, v5, v6}, La3/g;-><init>(LZ2/d;[Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance v5, La3/f;

    .line 231
    .line 232
    iget-object v6, v0, LZ2/h;->a:LZ2/d;

    .line 233
    .line 234
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 235
    .line 236
    .line 237
    invoke-direct {v5, v6}, La3/f;-><init>(LZ2/d;)V

    .line 238
    .line 239
    .line 240
    iput-boolean v3, v5, La3/f;->a:Z

    .line 241
    .line 242
    iget-object v6, v0, LZ2/h;->a:LZ2/d;

    .line 243
    .line 244
    invoke-virtual {v6}, LZ2/d;->k()Z

    .line 245
    .line 246
    .line 247
    move-result v6

    .line 248
    iput-boolean v6, v5, La3/f;->b:Z

    .line 249
    .line 250
    invoke-virtual {v0, v5}, LZ2/h;->a(La3/f;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1, v5}, La3/g;->a(La3/f;)La3/c;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iput-object v1, v0, LZ2/h;->b:La3/c;

    .line 258
    .line 259
    iput-boolean v3, v0, LZ2/h;->g:Z

    .line 260
    .line 261
    :cond_9
    :goto_4
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 262
    .line 263
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 264
    .line 265
    .line 266
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 267
    .line 268
    iget-object v1, v1, La3/c;->d:La3/d;

    .line 269
    .line 270
    iget-object v5, v0, LZ2/h;->a:LZ2/d;

    .line 271
    .line 272
    iget-object v5, v5, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 273
    .line 274
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    .line 276
    .line 277
    const-string v6, "FlutterEngineConnectionRegistry#attachToActivity"

    .line 278
    .line 279
    invoke-static {v6}, Lw3/a;->b(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :try_start_2
    iget-object v6, v1, La3/d;->e:LZ2/h;

    .line 283
    .line 284
    if-eqz v6, :cond_a

    .line 285
    .line 286
    invoke-virtual {v6}, LZ2/h;->b()V

    .line 287
    .line 288
    .line 289
    goto :goto_5

    .line 290
    :catchall_1
    move-exception v0

    .line 291
    move-object p1, v0

    .line 292
    goto/16 :goto_1a

    .line 293
    .line 294
    :cond_a
    :goto_5
    invoke-virtual {v1}, La3/d;->e()V

    .line 295
    .line 296
    .line 297
    iput-object v0, v1, La3/d;->e:LZ2/h;

    .line 298
    .line 299
    iget-object v6, v0, LZ2/h;->a:LZ2/d;

    .line 300
    .line 301
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v6, v5}, La3/d;->b(LZ2/d;Landroidx/lifecycle/s;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 305
    .line 306
    .line 307
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 308
    .line 309
    .line 310
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 313
    .line 314
    .line 315
    iget-object v5, v0, LZ2/h;->a:LZ2/d;

    .line 316
    .line 317
    iget-object v6, v0, LZ2/h;->b:La3/c;

    .line 318
    .line 319
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 320
    .line 321
    .line 322
    new-instance v7, LR/j;

    .line 323
    .line 324
    iget-object v6, v6, La3/c;->l:LZ2/s;

    .line 325
    .line 326
    invoke-direct {v7, v5, v6, v5}, LR/j;-><init>(LZ2/d;LZ2/s;LZ2/d;)V

    .line 327
    .line 328
    .line 329
    iput-object v7, v0, LZ2/h;->d:LR/j;

    .line 330
    .line 331
    iget-object v5, v0, LZ2/h;->a:LZ2/d;

    .line 332
    .line 333
    iget-object v6, v0, LZ2/h;->b:La3/c;

    .line 334
    .line 335
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 336
    .line 337
    .line 338
    new-instance v5, LM2/b;

    .line 339
    .line 340
    sget v7, LZ2/d;->i:I

    .line 341
    .line 342
    iget-object v6, v6, La3/c;->n:Lio/flutter/plugin/editing/j;

    .line 343
    .line 344
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 345
    .line 346
    .line 347
    iput-object v1, v5, LM2/b;->b:Ljava/lang/Object;

    .line 348
    .line 349
    iput v7, v5, LM2/b;->a:I

    .line 350
    .line 351
    iput-object v6, v5, LM2/b;->c:Ljava/lang/Object;

    .line 352
    .line 353
    iput-object v5, v6, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 354
    .line 355
    iput-object v5, v0, LZ2/h;->e:LM2/b;

    .line 356
    .line 357
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 358
    .line 359
    iget-object v5, v0, LZ2/h;->b:La3/c;

    .line 360
    .line 361
    iget-object v1, v1, LZ2/d;->f:LZ2/h;

    .line 362
    .line 363
    iget-boolean v1, v1, LZ2/h;->g:Z

    .line 364
    .line 365
    if-eqz v1, :cond_b

    .line 366
    .line 367
    goto :goto_6

    .line 368
    :cond_b
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->H(La3/c;)V

    .line 369
    .line 370
    .line 371
    :goto_6
    iput-boolean v4, v0, LZ2/h;->j:Z

    .line 372
    .line 373
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 374
    .line 375
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 376
    .line 377
    .line 378
    if-eqz p1, :cond_c

    .line 379
    .line 380
    const-string v1, "plugins"

    .line 381
    .line 382
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    const-string v5, "framework"

    .line 387
    .line 388
    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    goto :goto_7

    .line 393
    :cond_c
    move-object p1, v2

    .line 394
    move-object v1, p1

    .line 395
    :goto_7
    iget-object v5, v0, LZ2/h;->a:LZ2/d;

    .line 396
    .line 397
    invoke-virtual {v5}, LZ2/d;->k()Z

    .line 398
    .line 399
    .line 400
    move-result v5

    .line 401
    if-eqz v5, :cond_f

    .line 402
    .line 403
    iget-object v5, v0, LZ2/h;->b:La3/c;

    .line 404
    .line 405
    iget-object v5, v5, La3/c;->k:Lj3/j;

    .line 406
    .line 407
    iput-boolean v4, v5, Lj3/j;->e:Z

    .line 408
    .line 409
    iget-object v6, v5, Lj3/j;->d:LQ2/g;

    .line 410
    .line 411
    if-eqz v6, :cond_d

    .line 412
    .line 413
    invoke-static {p1}, Lj3/j;->a([B)Ljava/util/HashMap;

    .line 414
    .line 415
    .line 416
    move-result-object v7

    .line 417
    invoke-virtual {v6, v7}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 418
    .line 419
    .line 420
    iput-object v2, v5, Lj3/j;->d:LQ2/g;

    .line 421
    .line 422
    iput-object p1, v5, Lj3/j;->b:[B

    .line 423
    .line 424
    goto :goto_8

    .line 425
    :cond_d
    iget-boolean v2, v5, Lj3/j;->f:Z

    .line 426
    .line 427
    if-eqz v2, :cond_e

    .line 428
    .line 429
    iget-object v2, v5, Lj3/j;->c:Lk3/o;

    .line 430
    .line 431
    const-string v6, "push"

    .line 432
    .line 433
    invoke-static {p1}, Lj3/j;->a([B)Ljava/util/HashMap;

    .line 434
    .line 435
    .line 436
    move-result-object v7

    .line 437
    new-instance v8, LQ2/g;

    .line 438
    .line 439
    const/4 v9, 0x1

    .line 440
    invoke-direct {v8, v9, v5, p1}, LQ2/g;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v2, v6, v7, v8}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 444
    .line 445
    .line 446
    goto :goto_8

    .line 447
    :cond_e
    iput-object p1, v5, Lj3/j;->b:[B

    .line 448
    .line 449
    :cond_f
    :goto_8
    iget-object p1, v0, LZ2/h;->a:LZ2/d;

    .line 450
    .line 451
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 452
    .line 453
    .line 454
    iget-object p1, v0, LZ2/h;->b:La3/c;

    .line 455
    .line 456
    iget-object p1, p1, La3/c;->d:La3/d;

    .line 457
    .line 458
    invoke-virtual {p1}, La3/d;->f()Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    if-eqz v0, :cond_12

    .line 463
    .line 464
    const-string v0, "FlutterEngineConnectionRegistry#onRestoreInstanceState"

    .line 465
    .line 466
    invoke-static {v0}, Lw3/a;->b(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :try_start_3
    iget-object p1, p1, La3/d;->f:Lm/J0;

    .line 470
    .line 471
    iget-object p1, p1, Lm/J0;->k:Ljava/lang/Object;

    .line 472
    .line 473
    check-cast p1, Ljava/util/HashSet;

    .line 474
    .line 475
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 476
    .line 477
    .line 478
    move-result-object p1

    .line 479
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-eqz v0, :cond_11

    .line 484
    .line 485
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v0

    .line 489
    check-cast v0, Ls3/j;

    .line 490
    .line 491
    iget-boolean v2, v0, Ls3/j;->r:Z

    .line 492
    .line 493
    if-eqz v2, :cond_10

    .line 494
    .line 495
    goto :goto_9

    .line 496
    :cond_10
    iget-object v0, v0, Ls3/j;->i:Lc1/f;

    .line 497
    .line 498
    invoke-virtual {v0, v1}, Lc1/f;->a(Landroid/os/Bundle;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 499
    .line 500
    .line 501
    goto :goto_9

    .line 502
    :cond_11
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 503
    .line 504
    .line 505
    goto :goto_b

    .line 506
    :catchall_2
    move-exception v0

    .line 507
    move-object p1, v0

    .line 508
    :try_start_4
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 509
    .line 510
    .line 511
    goto :goto_a

    .line 512
    :catchall_3
    move-exception v0

    .line 513
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 514
    .line 515
    .line 516
    :goto_a
    throw p1

    .line 517
    :cond_12
    const-string p1, "FlutterEngineCxnRegstry"

    .line 518
    .line 519
    const-string v0, "Attempted to notify ActivityAware plugins of onRestoreInstanceState, but no Activity was attached."

    .line 520
    .line 521
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    .line 523
    .line 524
    :goto_b
    iget-object p1, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 525
    .line 526
    sget-object v0, Landroidx/lifecycle/j;->ON_CREATE:Landroidx/lifecycle/j;

    .line 527
    .line 528
    invoke-virtual {p1, v0}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {p0}, LZ2/d;->d()I

    .line 532
    .line 533
    .line 534
    move-result p1

    .line 535
    const/4 v0, 0x2

    .line 536
    if-ne p1, v0, :cond_13

    .line 537
    .line 538
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 539
    .line 540
    .line 541
    move-result-object p1

    .line 542
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 543
    .line 544
    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 548
    .line 549
    .line 550
    :cond_13
    iget-object p1, p0, LZ2/d;->f:LZ2/h;

    .line 551
    .line 552
    sget v1, LZ2/d;->i:I

    .line 553
    .line 554
    invoke-virtual {p0}, LZ2/d;->d()I

    .line 555
    .line 556
    .line 557
    move-result v2

    .line 558
    if-ne v2, v4, :cond_14

    .line 559
    .line 560
    move v0, v4

    .line 561
    :cond_14
    if-ne v0, v4, :cond_15

    .line 562
    .line 563
    move v0, v4

    .line 564
    goto :goto_c

    .line 565
    :cond_15
    move v0, v3

    .line 566
    :goto_c
    invoke-virtual {p1}, LZ2/h;->c()V

    .line 567
    .line 568
    .line 569
    iget-object v2, p1, LZ2/h;->a:LZ2/d;

    .line 570
    .line 571
    invoke-virtual {v2}, LZ2/d;->d()I

    .line 572
    .line 573
    .line 574
    move-result v2

    .line 575
    if-ne v2, v4, :cond_17

    .line 576
    .line 577
    new-instance v2, LZ2/j;

    .line 578
    .line 579
    iget-object v5, p1, LZ2/h;->a:LZ2/d;

    .line 580
    .line 581
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 582
    .line 583
    .line 584
    iget-object v6, p1, LZ2/h;->a:LZ2/d;

    .line 585
    .line 586
    invoke-virtual {v6}, LZ2/d;->d()I

    .line 587
    .line 588
    .line 589
    move-result v6

    .line 590
    if-ne v6, v4, :cond_16

    .line 591
    .line 592
    move v6, v3

    .line 593
    goto :goto_d

    .line 594
    :cond_16
    move v6, v4

    .line 595
    :goto_d
    invoke-direct {v2, v5, v6}, LZ2/j;-><init>(LZ2/d;Z)V

    .line 596
    .line 597
    .line 598
    iget-object v5, p1, LZ2/h;->a:LZ2/d;

    .line 599
    .line 600
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 601
    .line 602
    .line 603
    new-instance v5, LZ2/p;

    .line 604
    .line 605
    iget-object v6, p1, LZ2/h;->a:LZ2/d;

    .line 606
    .line 607
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 608
    .line 609
    .line 610
    invoke-direct {v5, v6, v2}, LZ2/p;-><init>(LZ2/d;LZ2/j;)V

    .line 611
    .line 612
    .line 613
    iput-object v5, p1, LZ2/h;->c:LZ2/p;

    .line 614
    .line 615
    goto :goto_f

    .line 616
    :cond_17
    new-instance v2, LZ2/k;

    .line 617
    .line 618
    iget-object v5, p1, LZ2/h;->a:LZ2/d;

    .line 619
    .line 620
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 621
    .line 622
    .line 623
    invoke-direct {v2, v5}, LZ2/k;-><init>(LZ2/d;)V

    .line 624
    .line 625
    .line 626
    iget-object v5, p1, LZ2/h;->a:LZ2/d;

    .line 627
    .line 628
    invoke-virtual {v5}, LZ2/d;->d()I

    .line 629
    .line 630
    .line 631
    move-result v5

    .line 632
    if-ne v5, v4, :cond_18

    .line 633
    .line 634
    move v5, v4

    .line 635
    goto :goto_e

    .line 636
    :cond_18
    move v5, v3

    .line 637
    :goto_e
    invoke-virtual {v2, v5}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 638
    .line 639
    .line 640
    iget-object v5, p1, LZ2/h;->a:LZ2/d;

    .line 641
    .line 642
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 643
    .line 644
    .line 645
    new-instance v5, LZ2/p;

    .line 646
    .line 647
    iget-object v6, p1, LZ2/h;->a:LZ2/d;

    .line 648
    .line 649
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 650
    .line 651
    .line 652
    invoke-direct {v5, v6, v2}, LZ2/p;-><init>(LZ2/d;LZ2/k;)V

    .line 653
    .line 654
    .line 655
    iput-object v5, p1, LZ2/h;->c:LZ2/p;

    .line 656
    .line 657
    :goto_f
    iget-object v2, p1, LZ2/h;->c:LZ2/p;

    .line 658
    .line 659
    iget-object v5, p1, LZ2/h;->l:LZ2/e;

    .line 660
    .line 661
    iget-object v2, v2, LZ2/p;->l:Ljava/util/HashSet;

    .line 662
    .line 663
    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 664
    .line 665
    .line 666
    iget-object v2, p1, LZ2/h;->a:LZ2/d;

    .line 667
    .line 668
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 669
    .line 670
    .line 671
    iget-object v6, p1, LZ2/h;->c:LZ2/p;

    .line 672
    .line 673
    iget-object v2, p1, LZ2/h;->b:La3/c;

    .line 674
    .line 675
    iget-object v11, v6, LZ2/p;->C:LZ2/e;

    .line 676
    .line 677
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    invoke-virtual {v6}, LZ2/p;->c()Z

    .line 681
    .line 682
    .line 683
    move-result v5

    .line 684
    if-eqz v5, :cond_1a

    .line 685
    .line 686
    iget-object v5, v6, LZ2/p;->n:La3/c;

    .line 687
    .line 688
    if-ne v2, v5, :cond_19

    .line 689
    .line 690
    goto/16 :goto_18

    .line 691
    .line 692
    :cond_19
    invoke-virtual {v6}, LZ2/p;->a()V

    .line 693
    .line 694
    .line 695
    :cond_1a
    iput-object v2, v6, LZ2/p;->n:La3/c;

    .line 696
    .line 697
    iget-object v5, v2, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 698
    .line 699
    iget-boolean v7, v5, Lio/flutter/embedding/engine/renderer/j;->d:Z

    .line 700
    .line 701
    iput-boolean v7, v6, LZ2/p;->m:Z

    .line 702
    .line 703
    iget-object v7, v6, LZ2/p;->j:Landroid/view/View;

    .line 704
    .line 705
    invoke-interface {v7, v5}, Lio/flutter/embedding/engine/renderer/m;->c(Lio/flutter/embedding/engine/renderer/j;)V

    .line 706
    .line 707
    .line 708
    invoke-virtual {v5, v11}, Lio/flutter/embedding/engine/renderer/j;->a(Lio/flutter/embedding/engine/renderer/k;)V

    .line 709
    .line 710
    .line 711
    iget-boolean v7, v6, LZ2/p;->f:Z

    .line 712
    .line 713
    if-eqz v7, :cond_1b

    .line 714
    .line 715
    iget-object v7, v6, LZ2/p;->B:LZ2/n;

    .line 716
    .line 717
    iget-object v5, v5, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 718
    .line 719
    invoke-virtual {v5, v7}, Lio/flutter/embedding/engine/FlutterJNI;->addResizingFlutterUiListener(Lio/flutter/embedding/engine/renderer/l;)V

    .line 720
    .line 721
    .line 722
    :cond_1b
    new-instance v5, LZ2/s;

    .line 723
    .line 724
    iget-object v7, v6, LZ2/p;->n:La3/c;

    .line 725
    .line 726
    iget-object v7, v7, La3/c;->h:Lio/flutter/plugin/editing/j;

    .line 727
    .line 728
    invoke-direct {v5, v6, v7}, LZ2/s;-><init>(Lm3/a;Lio/flutter/plugin/editing/j;)V

    .line 729
    .line 730
    .line 731
    iput-object v5, v6, LZ2/p;->p:LZ2/s;

    .line 732
    .line 733
    new-instance v5, Lio/flutter/plugin/editing/k;

    .line 734
    .line 735
    iget-object v7, v6, LZ2/p;->n:La3/c;

    .line 736
    .line 737
    move-object v8, v7

    .line 738
    iget-object v7, v8, La3/c;->r:LZ2/s;

    .line 739
    .line 740
    move-object v9, v8

    .line 741
    iget-object v8, v9, La3/c;->m:Lio/flutter/plugin/editing/j;

    .line 742
    .line 743
    move-object v10, v9

    .line 744
    iget-object v9, v10, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 745
    .line 746
    iget-object v10, v10, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 747
    .line 748
    invoke-direct/range {v5 .. v10}, Lio/flutter/plugin/editing/k;-><init>(Landroid/view/View;LZ2/s;Lio/flutter/plugin/editing/j;Lio/flutter/plugin/platform/p;Lio/flutter/plugin/platform/o;)V

    .line 749
    .line 750
    .line 751
    iput-object v5, v6, LZ2/p;->q:Lio/flutter/plugin/editing/k;

    .line 752
    .line 753
    :try_start_5
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 754
    .line 755
    .line 756
    move-result-object v5

    .line 757
    const-string v7, "textservices"

    .line 758
    .line 759
    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v5

    .line 763
    check-cast v5, Landroid/view/textservice/TextServicesManager;

    .line 764
    .line 765
    iput-object v5, v6, LZ2/p;->w:Landroid/view/textservice/TextServicesManager;

    .line 766
    .line 767
    new-instance v7, Lio/flutter/plugin/editing/g;

    .line 768
    .line 769
    iget-object v8, v6, LZ2/p;->n:La3/c;

    .line 770
    .line 771
    iget-object v8, v8, La3/c;->p:Lio/flutter/plugin/editing/j;

    .line 772
    .line 773
    invoke-direct {v7, v5, v8}, Lio/flutter/plugin/editing/g;-><init>(Landroid/view/textservice/TextServicesManager;Lio/flutter/plugin/editing/j;)V

    .line 774
    .line 775
    .line 776
    iput-object v7, v6, LZ2/p;->r:Lio/flutter/plugin/editing/g;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 777
    .line 778
    goto :goto_10

    .line 779
    :catch_1
    const-string v5, "FlutterView"

    .line 780
    .line 781
    const-string v7, "TextServicesManager not supported by device, spell check disabled."

    .line 782
    .line 783
    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    .line 785
    .line 786
    :goto_10
    new-instance v5, LZ2/s;

    .line 787
    .line 788
    iget-object v7, v6, LZ2/p;->q:Lio/flutter/plugin/editing/k;

    .line 789
    .line 790
    iget-object v7, v7, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 791
    .line 792
    iget-object v8, v6, LZ2/p;->n:La3/c;

    .line 793
    .line 794
    iget-object v8, v8, La3/c;->m:Lio/flutter/plugin/editing/j;

    .line 795
    .line 796
    invoke-direct {v5, v6, v7, v8}, LZ2/s;-><init>(Landroid/view/View;Landroid/view/inputmethod/InputMethodManager;Lio/flutter/plugin/editing/j;)V

    .line 797
    .line 798
    .line 799
    iget-object v5, v6, LZ2/p;->n:La3/c;

    .line 800
    .line 801
    iget-object v5, v5, La3/c;->e:Ll3/a;

    .line 802
    .line 803
    iput-object v5, v6, LZ2/p;->s:Ll3/a;

    .line 804
    .line 805
    new-instance v5, LB2/a;

    .line 806
    .line 807
    invoke-direct {v5, v6}, LB2/a;-><init>(LZ2/y;)V

    .line 808
    .line 809
    .line 810
    iput-object v5, v6, LZ2/p;->t:LB2/a;

    .line 811
    .line 812
    new-instance v5, LZ2/a;

    .line 813
    .line 814
    iget-object v7, v6, LZ2/p;->n:La3/c;

    .line 815
    .line 816
    iget-object v7, v7, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 817
    .line 818
    invoke-direct {v5, v7, v3}, LZ2/a;-><init>(Lio/flutter/embedding/engine/renderer/j;Z)V

    .line 819
    .line 820
    .line 821
    iput-object v5, v6, LZ2/p;->u:LZ2/a;

    .line 822
    .line 823
    new-instance v5, Lio/flutter/view/i;

    .line 824
    .line 825
    iget-object v7, v2, La3/c;->f:LB2/a;

    .line 826
    .line 827
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 828
    .line 829
    .line 830
    move-result-object v8

    .line 831
    const-string v9, "accessibility"

    .line 832
    .line 833
    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 834
    .line 835
    .line 836
    move-result-object v8

    .line 837
    check-cast v8, Landroid/view/accessibility/AccessibilityManager;

    .line 838
    .line 839
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 840
    .line 841
    .line 842
    move-result-object v9

    .line 843
    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 844
    .line 845
    .line 846
    move-result-object v9

    .line 847
    iget-object v10, v2, La3/c;->u:LZ2/s;

    .line 848
    .line 849
    invoke-direct/range {v5 .. v10}, Lio/flutter/view/i;-><init>(Landroid/view/View;LB2/a;Landroid/view/accessibility/AccessibilityManager;Landroid/content/ContentResolver;Lio/flutter/plugin/platform/i;)V

    .line 850
    .line 851
    .line 852
    iput-object v5, v6, LZ2/p;->v:Lio/flutter/view/i;

    .line 853
    .line 854
    iget-object v7, v6, LZ2/p;->z:LE/i;

    .line 855
    .line 856
    iput-object v7, v5, Lio/flutter/view/i;->s:LE/i;

    .line 857
    .line 858
    iget-object v5, v5, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 859
    .line 860
    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 861
    .line 862
    .line 863
    move-result v5

    .line 864
    iget-object v7, v6, LZ2/p;->v:Lio/flutter/view/i;

    .line 865
    .line 866
    iget-object v7, v7, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 867
    .line 868
    invoke-virtual {v7}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 869
    .line 870
    .line 871
    move-result v7

    .line 872
    iget-object v8, v6, LZ2/p;->n:La3/c;

    .line 873
    .line 874
    iget-object v8, v8, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 875
    .line 876
    iget-object v8, v8, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 877
    .line 878
    invoke-virtual {v8}, Lio/flutter/embedding/engine/FlutterJNI;->getIsSoftwareRenderingEnabled()Z

    .line 879
    .line 880
    .line 881
    move-result v8

    .line 882
    if-nez v8, :cond_1d

    .line 883
    .line 884
    if-nez v5, :cond_1c

    .line 885
    .line 886
    if-nez v7, :cond_1c

    .line 887
    .line 888
    move v5, v4

    .line 889
    goto :goto_11

    .line 890
    :cond_1c
    move v5, v3

    .line 891
    :goto_11
    invoke-virtual {v6, v5}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 892
    .line 893
    .line 894
    goto :goto_12

    .line 895
    :cond_1d
    invoke-virtual {v6, v3}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 896
    .line 897
    .line 898
    :goto_12
    iget-object v5, v6, LZ2/p;->n:La3/c;

    .line 899
    .line 900
    iget-object v7, v5, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 901
    .line 902
    iget-object v8, v6, LZ2/p;->v:Lio/flutter/view/i;

    .line 903
    .line 904
    iget-object v9, v7, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 905
    .line 906
    iput-object v8, v9, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 907
    .line 908
    iget-object v5, v5, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 909
    .line 910
    new-instance v8, LZ2/a;

    .line 911
    .line 912
    invoke-direct {v8, v5, v4}, LZ2/a;-><init>(Lio/flutter/embedding/engine/renderer/j;Z)V

    .line 913
    .line 914
    .line 915
    iput-object v8, v7, Lio/flutter/plugin/platform/p;->f:LZ2/a;

    .line 916
    .line 917
    iget-object v5, v6, LZ2/p;->n:La3/c;

    .line 918
    .line 919
    iget-object v7, v5, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 920
    .line 921
    iget-object v8, v6, LZ2/p;->v:Lio/flutter/view/i;

    .line 922
    .line 923
    iget-object v9, v7, Lio/flutter/plugin/platform/o;->l:Lio/flutter/plugin/platform/a;

    .line 924
    .line 925
    iput-object v8, v9, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 926
    .line 927
    iget-object v5, v5, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 928
    .line 929
    new-instance v8, LZ2/a;

    .line 930
    .line 931
    invoke-direct {v8, v5, v4}, LZ2/a;-><init>(Lio/flutter/embedding/engine/renderer/j;Z)V

    .line 932
    .line 933
    .line 934
    iput-object v8, v7, Lio/flutter/plugin/platform/o;->f:LZ2/a;

    .line 935
    .line 936
    iget-object v5, v6, LZ2/p;->q:Lio/flutter/plugin/editing/k;

    .line 937
    .line 938
    iget-object v5, v5, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 939
    .line 940
    invoke-virtual {v5, v6}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 941
    .line 942
    .line 943
    invoke-virtual {v6}, LZ2/p;->d()V

    .line 944
    .line 945
    .line 946
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 947
    .line 948
    .line 949
    move-result-object v5

    .line 950
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 951
    .line 952
    .line 953
    move-result-object v5

    .line 954
    const-string v7, "show_password"

    .line 955
    .line 956
    invoke-static {v7}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 957
    .line 958
    .line 959
    move-result-object v7

    .line 960
    iget-object v8, v6, LZ2/p;->A:LZ2/m;

    .line 961
    .line 962
    invoke-virtual {v5, v7, v3, v8}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 963
    .line 964
    .line 965
    invoke-virtual {v6}, LZ2/p;->e()V

    .line 966
    .line 967
    .line 968
    iget-object v5, v2, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 969
    .line 970
    iget-object v7, v5, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 971
    .line 972
    iget-object v8, v5, Lio/flutter/plugin/platform/p;->q:Landroid/util/SparseArray;

    .line 973
    .line 974
    iget-object v9, v5, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 975
    .line 976
    iput-object v6, v5, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 977
    .line 978
    move v10, v3

    .line 979
    :goto_13
    invoke-virtual {v9}, Landroid/util/SparseArray;->size()I

    .line 980
    .line 981
    .line 982
    move-result v12

    .line 983
    if-ge v10, v12, :cond_1e

    .line 984
    .line 985
    invoke-virtual {v9, v10}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 986
    .line 987
    .line 988
    move-result-object v12

    .line 989
    check-cast v12, Lio/flutter/plugin/platform/h;

    .line 990
    .line 991
    iget-object v13, v5, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 992
    .line 993
    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 994
    .line 995
    .line 996
    add-int/lit8 v10, v10, 0x1

    .line 997
    .line 998
    goto :goto_13

    .line 999
    :cond_1e
    move v9, v3

    .line 1000
    :goto_14
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    .line 1001
    .line 1002
    .line 1003
    move-result v10

    .line 1004
    if-ge v9, v10, :cond_1f

    .line 1005
    .line 1006
    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1007
    .line 1008
    .line 1009
    move-result-object v10

    .line 1010
    check-cast v10, Lf3/b;

    .line 1011
    .line 1012
    iget-object v12, v5, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 1013
    .line 1014
    invoke-virtual {v12, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1015
    .line 1016
    .line 1017
    add-int/lit8 v9, v9, 0x1

    .line 1018
    .line 1019
    goto :goto_14

    .line 1020
    :cond_1f
    move v5, v3

    .line 1021
    :goto_15
    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    .line 1022
    .line 1023
    .line 1024
    move-result v8

    .line 1025
    if-ge v5, v8, :cond_20

    .line 1026
    .line 1027
    invoke-virtual {v7, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v8

    .line 1031
    check-cast v8, Lio/flutter/plugin/platform/e;

    .line 1032
    .line 1033
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1034
    .line 1035
    .line 1036
    add-int/lit8 v5, v5, 0x1

    .line 1037
    .line 1038
    goto :goto_15

    .line 1039
    :cond_20
    iget-object v2, v2, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 1040
    .line 1041
    iget-object v5, v2, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 1042
    .line 1043
    iget-object v7, v2, Lio/flutter/plugin/platform/o;->n:Landroid/util/SparseArray;

    .line 1044
    .line 1045
    iput-object v6, v2, Lio/flutter/plugin/platform/o;->h:LZ2/p;

    .line 1046
    .line 1047
    move v8, v3

    .line 1048
    :goto_16
    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    .line 1049
    .line 1050
    .line 1051
    move-result v9

    .line 1052
    if-ge v8, v9, :cond_21

    .line 1053
    .line 1054
    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v9

    .line 1058
    check-cast v9, Lf3/b;

    .line 1059
    .line 1060
    iget-object v10, v2, Lio/flutter/plugin/platform/o;->h:LZ2/p;

    .line 1061
    .line 1062
    invoke-virtual {v10, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1063
    .line 1064
    .line 1065
    add-int/lit8 v8, v8, 0x1

    .line 1066
    .line 1067
    goto :goto_16

    .line 1068
    :cond_21
    :goto_17
    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    .line 1069
    .line 1070
    .line 1071
    move-result v2

    .line 1072
    if-ge v3, v2, :cond_22

    .line 1073
    .line 1074
    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v2

    .line 1078
    check-cast v2, Lio/flutter/plugin/platform/e;

    .line 1079
    .line 1080
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1081
    .line 1082
    .line 1083
    add-int/lit8 v3, v3, 0x1

    .line 1084
    .line 1085
    goto :goto_17

    .line 1086
    :cond_22
    iget-object v2, v6, LZ2/p;->o:Ljava/util/HashSet;

    .line 1087
    .line 1088
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v2

    .line 1092
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 1093
    .line 1094
    .line 1095
    move-result v3

    .line 1096
    if-nez v3, :cond_28

    .line 1097
    .line 1098
    iget-boolean v2, v6, LZ2/p;->m:Z

    .line 1099
    .line 1100
    if-eqz v2, :cond_23

    .line 1101
    .line 1102
    invoke-virtual {v11}, LZ2/e;->b()V

    .line 1103
    .line 1104
    .line 1105
    :cond_23
    :goto_18
    iget-object v2, p1, LZ2/h;->c:LZ2/p;

    .line 1106
    .line 1107
    invoke-virtual {v2, v1}, Landroid/view/View;->setId(I)V

    .line 1108
    .line 1109
    .line 1110
    if-eqz v0, :cond_26

    .line 1111
    .line 1112
    iget-object v0, p1, LZ2/h;->c:LZ2/p;

    .line 1113
    .line 1114
    iget-object v1, p1, LZ2/h;->a:LZ2/d;

    .line 1115
    .line 1116
    invoke-virtual {v1}, LZ2/d;->d()I

    .line 1117
    .line 1118
    .line 1119
    move-result v1

    .line 1120
    if-ne v1, v4, :cond_25

    .line 1121
    .line 1122
    iget-object v1, p1, LZ2/h;->f:LZ2/f;

    .line 1123
    .line 1124
    if-eqz v1, :cond_24

    .line 1125
    .line 1126
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v1

    .line 1130
    iget-object v2, p1, LZ2/h;->f:LZ2/f;

    .line 1131
    .line 1132
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1133
    .line 1134
    .line 1135
    :cond_24
    new-instance v1, LZ2/f;

    .line 1136
    .line 1137
    invoke-direct {v1, p1, v0}, LZ2/f;-><init>(LZ2/h;LZ2/p;)V

    .line 1138
    .line 1139
    .line 1140
    iput-object v1, p1, LZ2/h;->f:LZ2/f;

    .line 1141
    .line 1142
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v0

    .line 1146
    iget-object v1, p1, LZ2/h;->f:LZ2/f;

    .line 1147
    .line 1148
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1149
    .line 1150
    .line 1151
    goto :goto_19

    .line 1152
    :cond_25
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 1153
    .line 1154
    const-string v0, "Cannot delay the first Android view draw when the render mode is not set to `RenderMode.surface`."

    .line 1155
    .line 1156
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 1157
    .line 1158
    .line 1159
    throw p1

    .line 1160
    :cond_26
    :goto_19
    iget-object p1, p1, LZ2/h;->c:LZ2/p;

    .line 1161
    .line 1162
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 1163
    .line 1164
    .line 1165
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 1166
    .line 1167
    .line 1168
    move-result-object p1

    .line 1169
    const/high16 v0, -0x80000000

    .line 1170
    .line 1171
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 1172
    .line 1173
    .line 1174
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1175
    .line 1176
    const/16 v1, 0x23

    .line 1177
    .line 1178
    if-ge v0, v1, :cond_27

    .line 1179
    .line 1180
    const/high16 v0, 0x40000000    # 2.0f

    .line 1181
    .line 1182
    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 1183
    .line 1184
    .line 1185
    :cond_27
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 1186
    .line 1187
    .line 1188
    move-result-object p1

    .line 1189
    const/16 v0, 0x500

    .line 1190
    .line 1191
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1192
    .line 1193
    .line 1194
    return-void

    .line 1195
    :cond_28
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1196
    .line 1197
    .line 1198
    move-result-object p1

    .line 1199
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1200
    .line 1201
    .line 1202
    new-instance p1, Ljava/lang/ClassCastException;

    .line 1203
    .line 1204
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 1205
    .line 1206
    .line 1207
    throw p1

    .line 1208
    :goto_1a
    :try_start_6
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 1209
    .line 1210
    .line 1211
    goto :goto_1b

    .line 1212
    :catchall_4
    move-exception v0

    .line 1213
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 1214
    .line 1215
    .line 1216
    :goto_1b
    throw p1
.end method

.method public final onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onDestroy"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->e()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 18
    .line 19
    invoke-virtual {v0}, LZ2/h;->f()V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v1, 0x21

    .line 25
    .line 26
    if-lt v0, v1, :cond_1

    .line 27
    .line 28
    invoke-static {p0}, LE/c;->k(LZ2/d;)Landroid/window/OnBackInvokedDispatcher;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, LZ2/d;->h:Landroid/window/OnBackInvokedCallback;

    .line 33
    .line 34
    invoke-static {v0, v1}, LE/c;->y(Landroid/window/OnBackInvokedDispatcher;Landroid/window/OnBackInvokedCallback;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, LZ2/d;->e:Z

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 46
    .line 47
    iput-object v1, v0, LZ2/h;->b:La3/c;

    .line 48
    .line 49
    iput-object v1, v0, LZ2/h;->c:LZ2/p;

    .line 50
    .line 51
    iput-object v1, v0, LZ2/h;->d:LR/j;

    .line 52
    .line 53
    iput-object v1, v0, LZ2/h;->e:LM2/b;

    .line 54
    .line 55
    iput-object v1, p0, LZ2/d;->f:LZ2/h;

    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 58
    .line 59
    sget-object v1, Landroidx/lifecycle/j;->ON_DESTROY:Landroidx/lifecycle/j;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "onNewIntent"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v1, v1, La3/c;->d:La3/d;

    .line 22
    .line 23
    invoke-virtual {v1}, La3/d;->f()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    const-string v2, "FlutterEngineConnectionRegistry#onNewIntent"

    .line 30
    .line 31
    invoke-static {v2}, Lw3/a;->b(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :try_start_0
    iget-object v1, v1, La3/d;->f:Lm/J0;

    .line 35
    .line 36
    iget-object v1, v1, Lm/J0;->i:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lk3/r;

    .line 55
    .line 56
    invoke-interface {v2, p1}, Lk3/r;->onNewIntent(Landroid/content/Intent;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_1
    move-exception v0

    .line 70
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    throw p1

    .line 74
    :cond_1
    const-string v1, "FlutterEngineCxnRegstry"

    .line 75
    .line 76
    const-string v2, "Attempted to notify ActivityAware plugins of onNewIntent, but no Activity was attached."

    .line 77
    .line 78
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    :goto_2
    invoke-virtual {v0, p1}, LZ2/h;->d(Landroid/content/Intent;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_3

    .line 92
    .line 93
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 94
    .line 95
    iget-object v0, v0, La3/c;->i:Lj3/b;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    new-instance v1, Ljava/util/HashMap;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v2, "location"

    .line 106
    .line 107
    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    iget-object p1, v0, Lj3/b;->f:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast p1, Lk3/o;

    .line 113
    .line 114
    const-string v0, "pushRouteInformation"

    .line 115
    .line 116
    const/4 v2, 0x0

    .line 117
    invoke-virtual {p1, v0, v1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    const-string p1, "FlutterActivityAndFragmentDelegate"

    .line 122
    .line 123
    const-string v0, "onNewIntent() invoked before FlutterFragment was attached to an Activity."

    .line 124
    .line 125
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    :cond_3
    return-void
.end method

.method public final onPause()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onPause"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, v0, La3/c;->g:Lj3/a;

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    iget-boolean v2, v0, Lj3/a;->c:Z

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lj3/a;->a(IZ)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 35
    .line 36
    sget-object v1, Landroidx/lifecycle/j;->ON_PAUSE:Landroidx/lifecycle/j;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final onPostResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onPostResume"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, LZ2/h;->d:LR/j;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, LR/j;->j()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 29
    .line 30
    iget-object v0, v0, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 31
    .line 32
    invoke-virtual {v0}, Lio/flutter/plugin/platform/p;->m()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string v0, "FlutterActivityAndFragmentDelegate"

    .line 37
    .line 38
    const-string v1, "onPostResume() invoked before FlutterFragment was attached to an Activity."

    .line 39
    .line 40
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4

    .line 1
    const-string v0, "onRequestPermissionsResult"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 10
    .line 11
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 15
    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    invoke-static {p3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 25
    .line 26
    iget-object v0, v0, La3/c;->d:La3/d;

    .line 27
    .line 28
    invoke-virtual {v0}, La3/d;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    const-string v1, "FlutterEngineConnectionRegistry#onRequestPermissionsResult"

    .line 35
    .line 36
    invoke-static {v1}, Lw3/a;->b(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :try_start_0
    iget-object v0, v0, La3/d;->f:Lm/J0;

    .line 40
    .line 41
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Ljava/util/HashSet;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x0

    .line 50
    :cond_0
    move v2, v1

    .line 51
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lk3/s;

    .line 62
    .line 63
    invoke-interface {v3, p1, p2, p3}, Lk3/s;->onRequestPermissionsResult(I[Ljava/lang/String;[I)Z

    .line 64
    .line 65
    .line 66
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    :cond_1
    const/4 v2, 0x1

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception p1

    .line 78
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catchall_1
    move-exception p2

    .line 83
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    :goto_1
    throw p1

    .line 87
    :cond_3
    const-string p1, "FlutterEngineCxnRegstry"

    .line 88
    .line 89
    const-string p2, "Attempted to notify ActivityAware plugins of onRequestPermissionsResult, but no Activity was attached."

    .line 90
    .line 91
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    const-string p1, "FlutterActivityAndFragmentDelegate"

    .line 96
    .line 97
    const-string p2, "onRequestPermissionResult() invoked before FlutterFragment was attached to an Activity."

    .line 98
    .line 99
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    :cond_5
    return-void
.end method

.method public final onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 5
    .line 6
    sget-object v1, Landroidx/lifecycle/j;->ON_RESUME:Landroidx/lifecycle/j;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onResume"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 20
    .line 21
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 25
    .line 26
    iget-object v1, v1, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 27
    .line 28
    invoke-virtual {v1}, Lio/flutter/embedding/engine/renderer/j;->i()V

    .line 29
    .line 30
    .line 31
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, v0, La3/c;->g:Lj3/a;

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    iget-boolean v2, v0, Lj3/a;->c:Z

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lj3/a;->a(IZ)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "onSaveInstanceState"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 18
    .line 19
    invoke-virtual {v1}, LZ2/d;->k()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 26
    .line 27
    iget-object v1, v1, La3/c;->k:Lj3/j;

    .line 28
    .line 29
    iget-object v1, v1, Lj3/j;->b:[B

    .line 30
    .line 31
    const-string v2, "framework"

    .line 32
    .line 33
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/os/Bundle;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v2, v0, LZ2/h;->b:La3/c;

    .line 47
    .line 48
    iget-object v2, v2, La3/c;->d:La3/d;

    .line 49
    .line 50
    invoke-virtual {v2}, La3/d;->f()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    const-string v3, "FlutterEngineConnectionRegistry#onSaveInstanceState"

    .line 57
    .line 58
    invoke-static {v3}, Lw3/a;->b(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :try_start_0
    iget-object v2, v2, La3/d;->f:Lm/J0;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Lm/J0;->e(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :catchall_0
    move-exception p1

    .line 71
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_1
    move-exception v0

    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    throw p1

    .line 80
    :cond_1
    const-string v2, "FlutterEngineCxnRegstry"

    .line 81
    .line 82
    const-string v3, "Attempted to notify ActivityAware plugins of onSaveInstanceState, but no Activity was attached."

    .line 83
    .line 84
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    :goto_1
    const-string v2, "plugins"

    .line 88
    .line 89
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 93
    .line 94
    invoke-virtual {v1}, LZ2/d;->e()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 101
    .line 102
    invoke-virtual {v1}, LZ2/d;->j()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-nez v1, :cond_2

    .line 107
    .line 108
    iget-object v0, v0, LZ2/h;->a:LZ2/d;

    .line 109
    .line 110
    iget-boolean v0, v0, LZ2/d;->e:Z

    .line 111
    .line 112
    const-string v1, "enableOnBackInvokedCallbackState"

    .line 113
    .line 114
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 115
    .line 116
    .line 117
    :cond_2
    return-void
.end method

.method public final onStart()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 5
    .line 6
    sget-object v1, Landroidx/lifecycle/j;->ON_START:Landroidx/lifecycle/j;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onStart"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_7

    .line 18
    .line 19
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 20
    .line 21
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 25
    .line 26
    invoke-virtual {v1}, LZ2/d;->e()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :cond_0
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 35
    .line 36
    iget-object v1, v1, La3/c;->c:Lb3/b;

    .line 37
    .line 38
    iget-boolean v1, v1, Lb3/b;->j:Z

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_1
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 45
    .line 46
    invoke-virtual {v1}, LZ2/d;->g()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-nez v1, :cond_2

    .line 51
    .line 52
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, LZ2/h;->d(Landroid/content/Intent;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    const-string v1, "/"

    .line 68
    .line 69
    :cond_2
    iget-object v2, v0, LZ2/h;->a:LZ2/d;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    :try_start_0
    invoke-virtual {v2}, LZ2/d;->h()Landroid/os/Bundle;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    if-eqz v2, :cond_3

    .line 80
    .line 81
    const-string v4, "io.flutter.EntrypointUri"

    .line 82
    .line 83
    invoke-virtual {v2, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    goto :goto_0

    .line 88
    :catch_0
    :cond_3
    move-object v2, v3

    .line 89
    :goto_0
    iget-object v4, v0, LZ2/h;->a:LZ2/d;

    .line 90
    .line 91
    invoke-virtual {v4}, LZ2/d;->f()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    iget-object v4, v0, LZ2/h;->b:La3/c;

    .line 95
    .line 96
    iget-object v4, v4, La3/c;->i:Lj3/b;

    .line 97
    .line 98
    iget-object v4, v4, Lj3/b;->f:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v4, Lk3/o;

    .line 101
    .line 102
    const-string v5, "setInitialRoute"

    .line 103
    .line 104
    invoke-virtual {v4, v5, v1, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 108
    .line 109
    invoke-virtual {v1}, LZ2/d;->c()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_5

    .line 120
    .line 121
    :cond_4
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v1, v1, LB2/a;->f:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v1, Le3/e;

    .line 128
    .line 129
    iget-object v1, v1, Le3/e;->d:LV1/q;

    .line 130
    .line 131
    iget-object v1, v1, LV1/q;->c:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast v1, Ljava/lang/String;

    .line 134
    .line 135
    :cond_5
    if-nez v2, :cond_6

    .line 136
    .line 137
    new-instance v2, Lb3/a;

    .line 138
    .line 139
    iget-object v3, v0, LZ2/h;->a:LZ2/d;

    .line 140
    .line 141
    invoke-virtual {v3}, LZ2/d;->f()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-direct {v2, v1, v3}, Lb3/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_6
    new-instance v3, Lb3/a;

    .line 150
    .line 151
    iget-object v4, v0, LZ2/h;->a:LZ2/d;

    .line 152
    .line 153
    invoke-virtual {v4}, LZ2/d;->f()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-direct {v3, v1, v2, v4}, Lb3/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    move-object v2, v3

    .line 161
    :goto_1
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 162
    .line 163
    iget-object v1, v1, La3/c;->c:Lb3/b;

    .line 164
    .line 165
    iget-object v3, v0, LZ2/h;->a:LZ2/d;

    .line 166
    .line 167
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    const-string v4, "dart_entrypoint_args"

    .line 172
    .line 173
    invoke-virtual {v3, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Ljava/util/List;

    .line 178
    .line 179
    invoke-virtual {v1, v2, v3}, Lb3/b;->b(Lb3/a;Ljava/util/List;)V

    .line 180
    .line 181
    .line 182
    :goto_2
    iget-object v1, v0, LZ2/h;->k:Ljava/lang/Integer;

    .line 183
    .line 184
    if-eqz v1, :cond_7

    .line 185
    .line 186
    iget-object v0, v0, LZ2/h;->c:LZ2/p;

    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-virtual {v0, v1}, LZ2/p;->setVisibility(I)V

    .line 193
    .line 194
    .line 195
    :cond_7
    return-void
.end method

.method public final onStop()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onStop"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, v1, La3/c;->g:Lj3/a;

    .line 27
    .line 28
    const/4 v2, 0x5

    .line 29
    iget-boolean v3, v1, Lj3/a;->c:Z

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Lj3/a;->a(IZ)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v1, v0, LZ2/h;->c:LZ2/p;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, LZ2/h;->k:Ljava/lang/Integer;

    .line 45
    .line 46
    iget-object v1, v0, LZ2/h;->c:LZ2/p;

    .line 47
    .line 48
    const/16 v2, 0x8

    .line 49
    .line 50
    invoke-virtual {v1, v2}, LZ2/p;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, v0, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 58
    .line 59
    const/16 v1, 0x28

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/renderer/j;->f(I)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, LZ2/d;->g:Landroidx/lifecycle/s;

    .line 65
    .line 66
    sget-object v1, Landroidx/lifecycle/j;->ON_STOP:Landroidx/lifecycle/j;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final onTrimMemory(I)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 2
    .line 3
    .line 4
    const-string v0, "onTrimMemory"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 18
    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    iget-boolean v2, v0, LZ2/h;->i:Z

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    if-lt p1, v2, :cond_1

    .line 29
    .line 30
    iget-object v1, v1, La3/c;->c:Lb3/b;

    .line 31
    .line 32
    iget-object v1, v1, Lb3/b;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 33
    .line 34
    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterJNI;->notifyLowMemoryWarning()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 44
    .line 45
    iget-object v1, v1, La3/c;->q:Lj3/b;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    new-instance v2, Ljava/util/HashMap;

    .line 51
    .line 52
    const/4 v4, 0x1

    .line 53
    invoke-direct {v2, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 54
    .line 55
    .line 56
    const-string v4, "type"

    .line 57
    .line 58
    const-string v5, "memoryPressure"

    .line 59
    .line 60
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iget-object v1, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v1, LV1/y;

    .line 66
    .line 67
    invoke-virtual {v1, v2, v3}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v1, v0, LZ2/h;->b:La3/c;

    .line 71
    .line 72
    iget-object v1, v1, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 73
    .line 74
    invoke-virtual {v1, p1}, Lio/flutter/embedding/engine/renderer/j;->f(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 78
    .line 79
    iget-object v0, v0, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 80
    .line 81
    const/16 v1, 0x28

    .line 82
    .line 83
    if-ge p1, v1, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iget-object p1, v0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lio/flutter/plugin/platform/B;

    .line 110
    .line 111
    iget-object v0, v0, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    return-void
.end method

.method public final onUserLeaveHint()V
    .locals 2

    .line 1
    const-string v0, "onUserLeaveHint"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 10
    .line 11
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 15
    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    iget-object v0, v0, La3/c;->d:La3/d;

    .line 19
    .line 20
    invoke-virtual {v0}, La3/d;->f()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const-string v1, "FlutterEngineConnectionRegistry#onUserLeaveHint"

    .line 27
    .line 28
    invoke-static {v1}, Lw3/a;->b(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :try_start_0
    iget-object v0, v0, La3/d;->f:Lm/J0;

    .line 32
    .line 33
    iget-object v0, v0, Lm/J0;->j:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Ljava/util/HashSet;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    throw v0

    .line 59
    :cond_1
    new-instance v0, Ljava/lang/ClassCastException;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 62
    .line 63
    .line 64
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    :catchall_0
    move-exception v0

    .line 66
    :try_start_2
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_1
    move-exception v1

    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    throw v0

    .line 75
    :cond_2
    const-string v0, "FlutterEngineCxnRegstry"

    .line 76
    .line 77
    const-string v1, "Attempted to notify ActivityAware plugins of onUserLeaveHint, but no Activity was attached."

    .line 78
    .line 79
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    const-string v0, "FlutterActivityAndFragmentDelegate"

    .line 84
    .line 85
    const-string v1, "onUserLeaveHint() invoked before FlutterFragment was attached to an Activity."

    .line 86
    .line 87
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    :cond_4
    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    const-string v0, "onWindowFocusChanged"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, LZ2/d;->f:LZ2/h;

    .line 13
    .line 14
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, LZ2/h;->a:LZ2/d;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v0, La3/c;->g:Lj3/a;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget p1, v0, Lj3/a;->a:I

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, p1, v1}, Lj3/a;->a(IZ)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget p1, v0, Lj3/a;->a:I

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, p1, v1}, Lj3/a;->a(IZ)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method
