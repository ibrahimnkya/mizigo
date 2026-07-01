.class public final Lr2/c;
.super Lr2/l;
.source "SourceFile"


# static fields
.field public static final g:Lr2/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lr2/c;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lr2/c;->g:Lr2/c;

    .line 7
    .line 8
    sget-object v1, Lr2/l;->f:[Ljava/lang/StackTraceElement;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static a()Lr2/c;
    .locals 1

    .line 1
    sget-boolean v0, Lr2/l;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lr2/c;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget-object v0, Lr2/c;->g:Lr2/c;

    .line 12
    .line 13
    return-object v0
.end method
