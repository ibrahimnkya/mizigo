.class public final synthetic Lj0/b;
.super LI3/g;
.source "SourceFile"

# interfaces
.implements LH3/l;


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Landroidx/window/extensions/layout/WindowLayoutInfo;

    .line 2
    .line 3
    const-string v0, "p0"

    .line 4
    .line 5
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LI3/c;->f:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lj0/f;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lj0/f;->a(Landroidx/window/extensions/layout/WindowLayoutInfo;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 16
    .line 17
    return-object p1
.end method
