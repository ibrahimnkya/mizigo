.class public final Lc2/D;
.super Lc2/B;
.source "SourceFile"


# instance fields
.field public final a:LZ1/g;

.field public final b:LZ1/e;

.field public final c:Lg2/a;

.field public final d:LZ1/t;

.field public final e:Z

.field public volatile f:LZ1/s;


# direct methods
.method public constructor <init>(LZ1/g;LZ1/e;Lg2/a;LZ1/t;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lc2/B;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc2/D;->a:LZ1/g;

    .line 5
    .line 6
    iput-object p2, p0, Lc2/D;->b:LZ1/e;

    .line 7
    .line 8
    iput-object p3, p0, Lc2/D;->c:Lg2/a;

    .line 9
    .line 10
    iput-object p4, p0, Lc2/D;->d:LZ1/t;

    .line 11
    .line 12
    iput-boolean p5, p0, Lc2/D;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final b(Lh2/a;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lc2/D;->a:LZ1/g;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lc2/D;->b:LZ1/e;

    .line 11
    .line 12
    iget-object v1, p0, Lc2/D;->d:LZ1/t;

    .line 13
    .line 14
    iget-object v2, p0, Lc2/D;->c:Lg2/a;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, LZ1/e;->d(LZ1/t;Lg2/a;)LZ1/s;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 21
    .line 22
    :goto_0
    invoke-virtual {v0, p1}, LZ1/s;->b(Lh2/a;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    return-object p1

    .line 27
    :cond_1
    invoke-static {p1}, Lb2/d;->i(Lh2/a;)LZ1/h;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-boolean v0, p0, Lc2/D;->e:Z

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    instance-of v0, p1, LZ1/j;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    return-object p1

    .line 44
    :cond_2
    iget-object v0, p0, Lc2/D;->c:Lg2/a;

    .line 45
    .line 46
    iget-object v0, v0, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 47
    .line 48
    :try_start_0
    invoke-virtual {p1}, LZ1/h;->d()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;->valueOf(Ljava/lang/String;)Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;

    .line 53
    .line 54
    .line 55
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    return-object p1

    .line 57
    :catch_0
    invoke-virtual {p1}, LZ1/h;->b()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    sget-object p1, Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;->exactAllowWhileIdle:Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    sget-object p1, Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;->exact:Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode;

    .line 67
    .line 68
    :goto_1
    return-object p1
.end method

.method public final c(Lh2/b;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lc2/D;->b:LZ1/e;

    .line 7
    .line 8
    iget-object v1, p0, Lc2/D;->d:LZ1/t;

    .line 9
    .line 10
    iget-object v2, p0, Lc2/D;->c:Lg2/a;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LZ1/e;->d(LZ1/t;Lg2/a;)LZ1/s;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p1, p2}, LZ1/s;->c(Lh2/b;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final d()LZ1/s;
    .locals 3

    .line 1
    iget-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Lc2/D;->b:LZ1/e;

    .line 7
    .line 8
    iget-object v1, p0, Lc2/D;->d:LZ1/t;

    .line 9
    .line 10
    iget-object v2, p0, Lc2/D;->c:Lg2/a;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, LZ1/e;->d(LZ1/t;Lg2/a;)LZ1/s;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lc2/D;->f:LZ1/s;

    .line 17
    .line 18
    return-object v0
.end method
