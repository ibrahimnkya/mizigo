.class public final LL/a;
.super LI3/i;
.source "SourceFile"

# interfaces
.implements LH3/l;


# static fields
.field public static final f:LL/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LL/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, LI3/i;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LL/a;->f:LL/a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "it"

    .line 4
    .line 5
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lz3/l;->e:Lz3/l;

    .line 9
    .line 10
    return-object p1
.end method
