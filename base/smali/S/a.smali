.class public final LS/a;
.super LS/b;
.source "SourceFile"


# static fields
.field public static final b:LS/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LS/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LS/b;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LS/a;->b:LS/a;

    .line 8
    .line 9
    return-void
.end method
