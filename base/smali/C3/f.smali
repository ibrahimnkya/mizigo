.class public abstract LC3/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LB2/a;

.field public static b:LB2/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LB2/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, v1, v1, v2}, LB2/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LC3/f;->a:LB2/a;

    .line 9
    .line 10
    return-void
.end method
