.class public final LN/r;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:LK0/h;


# instance fields
.field public final a:LN/i;

.field public b:I

.field public final c:LN/d;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LK0/h;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN/r;->d:LK0/h;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(LN/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LN/r;->b:I

    .line 6
    .line 7
    new-instance v0, LN/d;

    .line 8
    .line 9
    invoke-direct {v0}, LN/d;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LN/r;->c:LN/d;

    .line 13
    .line 14
    iput-object p1, p0, LN/r;->a:LN/i;

    .line 15
    .line 16
    return-void
.end method
