.class public abstract Ll1/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LV0/i;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LV0/i;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, LV0/i;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll1/d;->a:LV0/i;

    .line 8
    .line 9
    return-void
.end method

.method public static a([BII)Ljava/security/spec/AlgorithmParameterSpec;
    .locals 2

    .line 1
    sget v0, Ls1/N;->a:I

    .line 2
    .line 3
    const-string v0, "java.vendor"

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "The Android Project"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/16 v1, 0x13

    .line 32
    .line 33
    if-gt v0, v1, :cond_1

    .line 34
    .line 35
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1, p2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([BII)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    new-instance v0, Ljavax/crypto/spec/GCMParameterSpec;

    .line 42
    .line 43
    const/16 v1, 0x80

    .line 44
    .line 45
    invoke-direct {v0, v1, p0, p1, p2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method
