.class public final Lv1/a;
.super Landroid/support/v4/media/session/a;
.source "SourceFile"


# instance fields
.field public final d:Lv1/b;

.field public final e:Lio/flutter/plugin/editing/j;


# direct methods
.method public constructor <init>(Lv1/b;Lio/flutter/plugin/editing/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv1/a;->d:Lv1/b;

    .line 5
    .line 6
    iput-object p2, p0, Lv1/a;->e:Lio/flutter/plugin/editing/j;

    .line 7
    .line 8
    return-void
.end method

.method public static c0(Lv1/b;Lio/flutter/plugin/editing/j;)Lv1/a;
    .locals 2

    .line 1
    iget v0, p0, Lv1/b;->a:I

    .line 2
    .line 3
    iget-object v1, p1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lz1/a;

    .line 6
    .line 7
    iget-object v1, v1, Lz1/a;->a:[B

    .line 8
    .line 9
    array-length v1, v1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    new-instance v0, Lv1/a;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Lv1/a;-><init>(Lv1/b;Lio/flutter/plugin/editing/j;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 19
    .line 20
    const-string p1, "Key size mismatch"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method


# virtual methods
.method public final n()Ljava/lang/Integer;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public final p()Lj1/i;
    .locals 1

    .line 1
    iget-object v0, p0, Lv1/a;->d:Lv1/b;

    .line 2
    .line 3
    return-object v0
.end method
