.class public abstract LD/I;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, LD/W;

    invoke-direct {v0}, LD/W;-><init>()V

    invoke-direct {p0, v0}, LD/I;-><init>(LD/W;)V

    return-void
.end method

.method public constructor <init>(LD/W;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract b()LD/W;
.end method

.method public abstract c(Lw/b;)V
.end method

.method public abstract d(Lw/b;)V
.end method
