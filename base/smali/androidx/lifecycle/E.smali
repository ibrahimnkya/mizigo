.class public final Landroidx/lifecycle/E;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LY/d;

.field public b:Z

.field public c:Landroid/os/Bundle;

.field public final d:Ly3/f;


# direct methods
.method public constructor <init>(LY/d;LR/e;)V
    .locals 1

    .line 1
    const-string v0, "savedStateRegistry"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/lifecycle/E;->a:LY/d;

    .line 10
    .line 11
    new-instance p1, LI/T;

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-direct {p1, v0, p2}, LI/T;-><init>(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ly3/f;

    .line 18
    .line 19
    invoke-direct {p2, p1}, Ly3/f;-><init>(LH3/a;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Landroidx/lifecycle/E;->d:Ly3/f;

    .line 23
    .line 24
    return-void
.end method
