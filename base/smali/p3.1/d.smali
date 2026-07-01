.class public Lp3/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lp3/l;
.implements Lp3/j;


# static fields
.field public static final g:Ljava/util/HashMap;


# instance fields
.field public e:Landroid/content/Context;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp3/d;->g:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lp3/d;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public static c(LA1/i;)Lp3/f;
    .locals 8

    .line 1
    iget-object v0, p0, LA1/i;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, LA1/i;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, LA1/i;->e:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v3

    .line 12
    :goto_0
    iget-object v4, p0, LA1/i;->g:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move-object v4, v3

    .line 18
    :goto_1
    iget-object v5, p0, LA1/i;->c:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v6, p0, LA1/i;->f:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, LA1/i;->d:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v7, Lp3/f;

    .line 25
    .line 26
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    if-eqz v0, :cond_5

    .line 30
    .line 31
    iput-object v0, v7, Lp3/f;->a:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    iput-object v1, v7, Lp3/f;->b:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v2, :cond_3

    .line 38
    .line 39
    iput-object v2, v7, Lp3/f;->c:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v4, :cond_2

    .line 42
    .line 43
    iput-object v4, v7, Lp3/f;->d:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v3, v7, Lp3/f;->e:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v5, v7, Lp3/f;->f:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v6, v7, Lp3/f;->g:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v3, v7, Lp3/f;->h:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p0, v7, Lp3/f;->i:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v3, v7, Lp3/f;->j:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v3, v7, Lp3/f;->k:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v3, v7, Lp3/f;->l:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v3, v7, Lp3/f;->m:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v3, v7, Lp3/f;->n:Ljava/lang/String;

    .line 64
    .line 65
    return-object v7

    .line 66
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 67
    .line 68
    const-string v0, "Nonnull field \"projectId\" is null."

    .line 69
    .line 70
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0

    .line 74
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 75
    .line 76
    const-string v0, "Nonnull field \"messagingSenderId\" is null."

    .line 77
    .line 78
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p0

    .line 82
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 83
    .line 84
    const-string v0, "Nonnull field \"appId\" is null."

    .line 85
    .line 86
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw p0

    .line 90
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 91
    .line 92
    const-string v0, "Nonnull field \"apiKey\" is null."

    .line 93
    .line 94
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0
.end method


# virtual methods
.method public final onAttachedToEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lg3/a;->b:Lk3/f;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lp3/l;->b(Lk3/f;Lp3/d;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lg3/a;->b:Lk3/f;

    .line 7
    .line 8
    invoke-static {v0, p0}, Lp3/j;->a(Lk3/f;Lp3/d;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p1, p0, Lp3/d;->e:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lp3/d;->e:Landroid/content/Context;

    .line 3
    .line 4
    iget-object v1, p1, Lg3/a;->b:Lk3/f;

    .line 5
    .line 6
    invoke-static {v1, v0}, Lp3/l;->b(Lk3/f;Lp3/d;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 10
    .line 11
    invoke-static {p1, v0}, Lp3/j;->a(Lk3/f;Lp3/d;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
