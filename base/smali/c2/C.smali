.class public final Lc2/C;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ1/t;


# instance fields
.field public final e:Lg2/a;

.field public final f:Z

.field public final g:LZ1/g;


# direct methods
.method public constructor <init>(Lcom/dexterous/flutterlocalnotifications/models/ScheduleMode$a;Lg2/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc2/C;->g:LZ1/g;

    .line 5
    .line 6
    iput-object p2, p0, Lc2/C;->e:Lg2/a;

    .line 7
    .line 8
    iput-boolean p3, p0, Lc2/C;->f:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final create(LZ1/e;Lg2/a;)LZ1/s;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lc2/C;->e:Lg2/a;

    .line 3
    .line 4
    if-eqz v1, :cond_2

    .line 5
    .line 6
    invoke-virtual {v1, p2}, Lg2/a;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    iget-boolean v2, p0, Lc2/C;->f:Z

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object v1, v1, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 17
    .line 18
    iget-object v2, p2, Lg2/a;->a:Ljava/lang/Class;

    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-object v0

    .line 24
    :cond_1
    :goto_0
    new-instance v3, Lc2/D;

    .line 25
    .line 26
    iget-object v4, p0, Lc2/C;->g:LZ1/g;

    .line 27
    .line 28
    const/4 v8, 0x1

    .line 29
    move-object v7, p0

    .line 30
    move-object v5, p1

    .line 31
    move-object v6, p2

    .line 32
    invoke-direct/range {v3 .. v8}, Lc2/D;-><init>(LZ1/g;LZ1/e;Lg2/a;LZ1/t;Z)V

    .line 33
    .line 34
    .line 35
    return-object v3

    .line 36
    :cond_2
    move-object v6, p2

    .line 37
    iget-object p1, v6, Lg2/a;->a:Ljava/lang/Class;

    .line 38
    .line 39
    throw v0
.end method
