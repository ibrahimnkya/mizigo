.class public final LU3/l;
.super LN3/r;
.source "SourceFile"


# static fields
.field public static final g:LU3/l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LU3/l;

    .line 2
    .line 3
    invoke-direct {v0}, LN3/r;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LU3/l;->g:LU3/l;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final d(LA3/i;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object p1, LU3/e;->h:LU3/e;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iget-object p1, p1, LU3/h;->g:LU3/c;

    .line 5
    .line 6
    invoke-virtual {p1, p2, v0}, LU3/c;->b(Ljava/lang/Runnable;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final f(I)LN3/r;
    .locals 1

    .line 1
    invoke-static {p1}, LS3/b;->a(I)V

    .line 2
    .line 3
    .line 4
    sget v0, LU3/k;->d:I

    .line 5
    .line 6
    if-lt p1, v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-super {p0, p1}, LN3/r;->f(I)LN3/r;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object v0
.end method
