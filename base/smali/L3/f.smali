.class public final LL3/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public final synthetic e:LM3/c;


# direct methods
.method public constructor <init>(LM3/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL3/f;->e:LM3/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 2

    .line 1
    new-instance v0, LM3/b;

    .line 2
    .line 3
    iget-object v1, p0, LL3/f;->e:LM3/c;

    .line 4
    .line 5
    invoke-direct {v0, v1}, LM3/b;-><init>(LM3/c;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
