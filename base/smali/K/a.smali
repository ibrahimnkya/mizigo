.class public final LK/a;
.super LI3/i;
.source "SourceFile"

# interfaces
.implements LH3/a;


# instance fields
.field public final synthetic f:I

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LK/a;->f:I

    iput-object p2, p0, LK/a;->g:Ljava/lang/Object;

    iput-object p3, p0, LK/a;->h:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, LI3/i;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, LK/a;->f:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LK/a;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lh0/b;

    .line 9
    .line 10
    iget-object v0, v0, Lh0/b;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Li0/a;

    .line 13
    .line 14
    iget-object v1, p0, LK/a;->h:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, LZ2/l;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Li0/a;->a(LZ2/l;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ly3/h;->a:Ly3/h;

    .line 22
    .line 23
    return-object v0

    .line 24
    :pswitch_0
    iget-object v0, p0, LK/a;->g:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Landroid/content/Context;

    .line 27
    .line 28
    const-string v1, "applicationContext"

    .line 29
    .line 30
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, LK/a;->h:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v1, LL/b;

    .line 36
    .line 37
    iget-object v1, v1, LL/b;->a:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "name"

    .line 40
    .line 41
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v2, ".preferences_pb"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "fileName"

    .line 51
    .line 52
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ljava/io/File;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v3, "datastore/"

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-object v2

    .line 75
    :pswitch_1
    iget-object v0, p0, LK/a;->g:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v0, Landroid/content/Context;

    .line 78
    .line 79
    iget-object v1, p0, LK/a;->h:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v1, Ljava/lang/String;

    .line 82
    .line 83
    const/4 v2, 0x0

    .line 84
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "context.getSharedPrefere\u2026me, Context.MODE_PRIVATE)"

    .line 89
    .line 90
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-object v0

    .line 94
    nop

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
