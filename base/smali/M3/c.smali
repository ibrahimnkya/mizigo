.class public final LM3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LL3/b;


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:LM3/k;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;LM3/k;)V
    .locals 1

    .line 1
    const-string v0, "input"

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
    iput-object p1, p0, LM3/c;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iput-object p2, p0, LM3/c;->b:LM3/k;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    new-instance v0, LM3/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LM3/b;-><init>(LM3/c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
