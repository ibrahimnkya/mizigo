.class public abstract LV3/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LE/i;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LE/i;

    .line 2
    .line 3
    const-string v1, "NO_OWNER"

    .line 4
    .line 5
    const/16 v2, 0xb

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, LV3/d;->a:LE/i;

    .line 11
    .line 12
    return-void
.end method
