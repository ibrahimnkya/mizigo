.class public final Lx2/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;

.field public final d:Ljava/lang/String;

.field public e:Ljava/lang/Integer;

.field public f:Ljava/lang/Integer;

.field public g:Ljava/lang/Object;

.field public final h:I

.field public final i:I

.field public final j:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 8

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v5, -0x1

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    move-object v1, p3

    .line 1
    invoke-direct/range {v0 .. v7}, Lx2/d;-><init>([BLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;III)V

    return-void
.end method

.method public constructor <init>([BLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;III)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lx2/d;->a:[B

    .line 4
    iput-object p2, p0, Lx2/d;->b:Ljava/lang/String;

    .line 5
    iput-object p3, p0, Lx2/d;->c:Ljava/util/List;

    .line 6
    iput-object p4, p0, Lx2/d;->d:Ljava/lang/String;

    .line 7
    iput p6, p0, Lx2/d;->h:I

    .line 8
    iput p5, p0, Lx2/d;->i:I

    .line 9
    iput p7, p0, Lx2/d;->j:I

    return-void
.end method
