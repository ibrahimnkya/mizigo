.class public abstract Lk1/J;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lk1/i;

.field public static final b:Ls1/B;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lk1/i;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lk1/J;->a:Lk1/i;

    .line 8
    .line 9
    new-instance v0, Lb2/f;

    .line 10
    .line 11
    const/16 v1, 0x17

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ls1/B;

    .line 17
    .line 18
    const-class v2, Lk1/I;

    .line 19
    .line 20
    const-class v3, Lj1/a;

    .line 21
    .line 22
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 23
    .line 24
    .line 25
    sput-object v1, Lk1/J;->b:Ls1/B;

    .line 26
    .line 27
    return-void
.end method
