.class public final LR3/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final e:LP3/t;


# direct methods
.method public constructor <init>(LP3/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR3/o;->e:LP3/t;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LR3/o;->e:LP3/t;

    .line 2
    .line 3
    invoke-interface {v0, p2, p1}, LP3/t;->p(LA3/d;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object p2, LB3/a;->e:LB3/a;

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 13
    .line 14
    return-object p1
.end method
