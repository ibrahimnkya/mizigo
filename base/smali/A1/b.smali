.class public final LA1/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LD1/f;


# static fields
.field public static final f:LA1/b;

.field public static final g:LA1/b;

.field public static final h:LA1/b;

.field public static final i:LA1/b;


# instance fields
.field public final synthetic e:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LA1/b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, LA1/b;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LA1/b;->f:LA1/b;

    .line 8
    .line 9
    new-instance v0, LA1/b;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-direct {v0, v1}, LA1/b;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, LA1/b;->g:LA1/b;

    .line 16
    .line 17
    new-instance v0, LA1/b;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    invoke-direct {v0, v1}, LA1/b;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, LA1/b;->h:LA1/b;

    .line 24
    .line 25
    new-instance v0, LA1/b;

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    invoke-direct {v0, v1}, LA1/b;-><init>(I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, LA1/b;->i:LA1/b;

    .line 32
    .line 33
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LA1/b;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public c(LD1/x;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LA1/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, LD1/v;

    .line 7
    .line 8
    const-class v1, LC1/d;

    .line 9
    .line 10
    const-class v2, Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, LD1/x;->d(LD1/v;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "get(...)"

    .line 20
    .line 21
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 25
    .line 26
    new-instance v0, LN3/K;

    .line 27
    .line 28
    invoke-direct {v0, p1}, LN3/K;-><init>(Ljava/util/concurrent/Executor;)V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :pswitch_0
    new-instance v0, LD1/v;

    .line 33
    .line 34
    const-class v1, LC1/b;

    .line 35
    .line 36
    const-class v2, Ljava/util/concurrent/Executor;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, LD1/x;->d(LD1/v;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v0, "get(...)"

    .line 46
    .line 47
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 51
    .line 52
    new-instance v0, LN3/K;

    .line 53
    .line 54
    invoke-direct {v0, p1}, LN3/K;-><init>(Ljava/util/concurrent/Executor;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :pswitch_1
    new-instance v0, LD1/v;

    .line 59
    .line 60
    const-class v1, LC1/c;

    .line 61
    .line 62
    const-class v2, Ljava/util/concurrent/Executor;

    .line 63
    .line 64
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, LD1/x;->d(LD1/v;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v0, "get(...)"

    .line 72
    .line 73
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 77
    .line 78
    new-instance v0, LN3/K;

    .line 79
    .line 80
    invoke-direct {v0, p1}, LN3/K;-><init>(Ljava/util/concurrent/Executor;)V

    .line 81
    .line 82
    .line 83
    return-object v0

    .line 84
    :pswitch_2
    new-instance v0, LD1/v;

    .line 85
    .line 86
    const-class v1, LC1/a;

    .line 87
    .line 88
    const-class v2, Ljava/util/concurrent/Executor;

    .line 89
    .line 90
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, LD1/x;->d(LD1/v;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string v0, "get(...)"

    .line 98
    .line 99
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 103
    .line 104
    new-instance v0, LN3/K;

    .line 105
    .line 106
    invoke-direct {v0, p1}, LN3/K;-><init>(Ljava/util/concurrent/Executor;)V

    .line 107
    .line 108
    .line 109
    return-object v0

    .line 110
    nop

    .line 111
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
