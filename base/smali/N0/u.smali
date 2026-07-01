.class public final LN0/u;
.super LN0/l;
.source "SourceFile"


# instance fields
.field public final synthetic g:Lcom/google/android/gms/common/internal/a;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/a;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, LN0/u;->g:Lcom/google/android/gms/common/internal/a;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, LN0/l;-><init>(Lcom/google/android/gms/common/internal/a;ILandroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 2

    .line 1
    iget-object v0, p0, LN0/u;->g:Lcom/google/android/gms/common/internal/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/gms/common/internal/a;->i:LM0/l;

    .line 4
    .line 5
    sget-object v1, LK0/a;->j:LK0/a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, LM0/l;->a(LK0/a;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    return v0
.end method

.method public final b(LK0/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, LN0/u;->g:Lcom/google/android/gms/common/internal/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, v0, Lcom/google/android/gms/common/internal/a;->i:LM0/l;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, LM0/l;->a(LK0/a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    return-void
.end method
