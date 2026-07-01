.class public final Ls1/H;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/J;


# instance fields
.field public final a:Lz1/a;

.field public final b:Lx1/b0;


# direct methods
.method public constructor <init>(Lx1/b0;Lz1/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/H;->b:Lx1/b0;

    .line 5
    .line 6
    iput-object p2, p0, Ls1/H;->a:Lz1/a;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lx1/b0;)Ls1/H;
    .locals 2

    .line 1
    new-instance v0, Ls1/H;

    .line 2
    .line 3
    invoke-virtual {p0}, Lx1/b0;->E()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ls1/N;->c(Ljava/lang/String;)Lz1/a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1}, Ls1/H;-><init>(Lx1/b0;Lz1/a;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
