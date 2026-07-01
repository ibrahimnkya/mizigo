.class public final LN3/L;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LN3/M;


# instance fields
.field public final a:LN3/Z;


# direct methods
.method public constructor <init>(LN3/Z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN3/L;->a:LN3/Z;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final d()LN3/Z;
    .locals 1

    .line 1
    iget-object v0, p0, LN3/L;->a:LN3/Z;

    .line 2
    .line 3
    return-object v0
.end method
