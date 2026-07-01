.class public abstract LW0/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LK0/c;

.field public static final b:[LK0/c;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, LK0/c;

    .line 2
    .line 3
    const/4 v2, -0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    const-string v1, "CLIENT_TELEMETRY"

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    invoke-direct/range {v0 .. v5}, LK0/c;-><init>(Ljava/lang/String;IJZ)V

    .line 10
    .line 11
    .line 12
    sput-object v0, LW0/c;->a:LK0/c;

    .line 13
    .line 14
    filled-new-array {v0}, [LK0/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, LW0/c;->b:[LK0/c;

    .line 19
    .line 20
    return-void
.end method
