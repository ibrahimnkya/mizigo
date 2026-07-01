.class public final Ly1/i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ly1/i;

.field public static final c:Ly1/i;


# instance fields
.field public final a:Ly1/h;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ly1/i;

    .line 2
    .line 3
    new-instance v1, LN0/f;

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    invoke-direct {v1, v2}, LN0/f;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ly1/i;->b:Ly1/i;

    .line 14
    .line 15
    new-instance v0, Ly1/i;

    .line 16
    .line 17
    new-instance v1, LN1/e;

    .line 18
    .line 19
    const/16 v2, 0x15

    .line 20
    .line 21
    invoke-direct {v1, v2}, LN1/e;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ly1/i;->c:Ly1/i;

    .line 28
    .line 29
    new-instance v0, Ly1/i;

    .line 30
    .line 31
    new-instance v1, LN0/f;

    .line 32
    .line 33
    const/16 v2, 0x16

    .line 34
    .line 35
    invoke-direct {v1, v2}, LN0/f;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ly1/i;

    .line 42
    .line 43
    new-instance v1, LK0/h;

    .line 44
    .line 45
    invoke-direct {v1, v2}, LK0/h;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ly1/i;

    .line 52
    .line 53
    new-instance v1, LN1/e;

    .line 54
    .line 55
    const/16 v2, 0x14

    .line 56
    .line 57
    invoke-direct {v1, v2}, LN1/e;-><init>(I)V

    .line 58
    .line 59
    .line 60
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Ly1/i;

    .line 64
    .line 65
    new-instance v1, LN0/f;

    .line 66
    .line 67
    const/16 v2, 0x15

    .line 68
    .line 69
    invoke-direct {v1, v2}, LN0/f;-><init>(I)V

    .line 70
    .line 71
    .line 72
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ly1/i;

    .line 76
    .line 77
    new-instance v1, LK0/h;

    .line 78
    .line 79
    invoke-direct {v1, v2}, LK0/h;-><init>(I)V

    .line 80
    .line 81
    .line 82
    invoke-direct {v0, v1}, Ly1/i;-><init>(Ly1/j;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public constructor <init>(Ly1/j;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lo1/a;->a()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ly1/g;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {v0, p1, v1}, Ly1/g;-><init>(Ly1/j;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ly1/i;->a:Ly1/h;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "java.vendor"

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "The Android Project"

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Ly1/g;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-direct {v0, p1, v1}, Ly1/g;-><init>(Ly1/j;I)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ly1/i;->a:Ly1/h;

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    new-instance v0, Lj3/b;

    .line 43
    .line 44
    const/16 v1, 0x13

    .line 45
    .line 46
    invoke-direct {v0, v1, p1}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ly1/i;->a:Ly1/h;

    .line 50
    .line 51
    return-void
.end method
