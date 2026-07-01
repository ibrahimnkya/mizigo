.class public final LF1/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic d:[LK3/c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/ThreadLocal;

.field public final c:LI/i;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, LI3/l;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    sget-object v1, LI3/b;->e:LI3/b;

    .line 5
    .line 6
    const-class v2, LF1/h;

    .line 7
    .line 8
    const-string v3, "dataStore"

    .line 9
    .line 10
    const-string v4, "getDataStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"

    .line 11
    .line 12
    invoke-direct/range {v0 .. v5}, LI3/m;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    sget-object v1, LI3/q;->a:LI3/r;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    new-array v1, v1, [LK3/c;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    aput-object v0, v1, v2

    .line 25
    .line 26
    sput-object v1, LF1/h;->d:[LK3/c;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "name"

    .line 7
    .line 8
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, LF1/h;->a:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, LF1/h;->b:Ljava/lang/ThreadLocal;

    .line 22
    .line 23
    new-instance v0, LA0/c;

    .line 24
    .line 25
    new-instance v1, LF1/a;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v1, p0, v2}, LF1/a;-><init>(LF1/h;I)V

    .line 29
    .line 30
    .line 31
    const/4 v2, 0x6

    .line 32
    invoke-direct {v0, v2, v1}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, LF1/a;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-direct {v1, p0, v2}, LF1/a;-><init>(LF1/h;I)V

    .line 39
    .line 40
    .line 41
    const/16 v2, 0x8

    .line 42
    .line 43
    invoke-static {p2, v0, v1, v2}, Lc1/g;->E(Ljava/lang/String;LA0/c;LF1/a;I)LL/b;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    sget-object v0, LF1/h;->d:[LK3/c;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    aget-object v0, v0, v1

    .line 51
    .line 52
    invoke-virtual {p2, p1, v0}, LL/b;->a(Landroid/content/Context;LK3/c;)LE/i;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, LF1/h;->c:LI/i;

    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public final a(LH3/l;)V
    .locals 2

    .line 1
    new-instance v0, LF1/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, LF1/c;-><init>(LF1/h;LH3/l;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, LM/b;

    .line 12
    .line 13
    return-void
.end method
