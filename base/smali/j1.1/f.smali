.class public final Lj1/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Lb2/f;


# instance fields
.field public final a:Landroid/support/v4/media/session/a;

.field public final b:Lx1/Z;

.field public final c:Lj1/c;

.field public final d:I

.field public final e:Z

.field public final f:Z

.field public final g:Lb2/f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lb2/f;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lj1/f;->h:Lb2/f;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/support/v4/media/session/a;Lx1/Z;IZZLb2/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/f;->a:Landroid/support/v4/media/session/a;

    .line 5
    .line 6
    iput-object p2, p0, Lj1/f;->b:Lx1/Z;

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 p2, 0x1

    .line 13
    if-eq p1, p2, :cond_1

    .line 14
    .line 15
    const/4 p2, 0x3

    .line 16
    if-eq p1, p2, :cond_0

    .line 17
    .line 18
    sget-object p1, Lj1/c;->d:Lj1/c;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object p1, Lj1/c;->e:Lj1/c;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object p1, Lj1/c;->c:Lj1/c;

    .line 25
    .line 26
    :goto_0
    iput-object p1, p0, Lj1/f;->c:Lj1/c;

    .line 27
    .line 28
    iput p3, p0, Lj1/f;->d:I

    .line 29
    .line 30
    iput-boolean p4, p0, Lj1/f;->e:Z

    .line 31
    .line 32
    iput-boolean p5, p0, Lj1/f;->f:Z

    .line 33
    .line 34
    iput-object p6, p0, Lj1/f;->g:Lb2/f;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final a()Landroid/support/v4/media/session/a;
    .locals 1

    .line 1
    iget-object v0, p0, Lj1/f;->g:Lb2/f;

    .line 2
    .line 3
    iget v0, v0, Lb2/f;->e:I

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :pswitch_0
    sget-object v0, Ls1/o;->b:Ls1/o;

    .line 10
    .line 11
    iget-object v0, v0, Ls1/o;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ls1/n;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ls1/o;->c:Ls1/n;

    .line 22
    .line 23
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lj1/f;->a:Landroid/support/v4/media/session/a;

    .line 27
    .line 28
    return-object v0

    .line 29
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
    .end packed-switch
.end method
