.class public abstract LD/J;
.super LD/S;
.source "SourceFile"


# static fields
.field public static i:Z = false

.field public static j:Ljava/lang/reflect/Method;

.field public static k:Ljava/lang/Class;

.field public static l:Ljava/lang/reflect/Field;

.field public static m:Ljava/lang/reflect/Field;


# instance fields
.field public final c:Landroid/view/WindowInsets;

.field public d:[Lw/b;

.field public e:Lw/b;

.field public f:LD/W;

.field public g:Lw/b;

.field public h:I


# direct methods
.method public constructor <init>(LD/W;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LD/S;-><init>(LD/W;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, LD/J;->e:Lw/b;

    .line 6
    .line 7
    iput-object p2, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 8
    .line 9
    return-void
.end method

.method private t()Lw/b;
    .locals 1

    .line 1
    iget-object v0, p0, LD/J;->f:LD/W;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, LD/W;->a:LD/S;

    .line 6
    .line 7
    invoke-virtual {v0}, LD/S;->g()Lw/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object v0, Lw/b;->e:Lw/b;

    .line 13
    .line 14
    return-object v0
.end method

.method private u(Landroid/view/View;)Lw/b;
    .locals 5

    .line 1
    const-string v0, "WindowInsetsCompat"

    .line 2
    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v2, 0x1e

    .line 6
    .line 7
    if-ge v1, v2, :cond_4

    .line 8
    .line 9
    sget-boolean v1, LD/J;->i:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, LD/J;->w()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v1, LD/J;->j:Ljava/lang/reflect/Method;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    sget-object v3, LD/J;->k:Ljava/lang/Class;

    .line 22
    .line 23
    if-eqz v3, :cond_3

    .line 24
    .line 25
    sget-object v3, LD/J;->l:Ljava/lang/reflect/Field;

    .line 26
    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :try_start_0
    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    const-string p1, "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden"

    .line 37
    .line 38
    new-instance v1, Ljava/lang/NullPointerException;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    .line 45
    .line 46
    return-object v2

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    sget-object v1, LD/J;->m:Ljava/lang/reflect/Field;

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v1, LD/J;->l:Ljava/lang/reflect/Field;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Landroid/graphics/Rect;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 66
    .line 67
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    iget v4, p1, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 72
    .line 73
    invoke-static {v1, v3, v4, p1}, Lw/b;->a(IIII)Lw/b;

    .line 74
    .line 75
    .line 76
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-object p1

    .line 78
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v3, "Failed to get visible insets. (Reflection error). "

    .line 81
    .line 82
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_1
    return-object v2

    .line 100
    :cond_4
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 101
    .line 102
    const-string v0, "getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead."

    .line 103
    .line 104
    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p1
.end method

.method private static w()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    const-class v1, Landroid/view/View;

    .line 3
    .line 4
    const-string v2, "getViewRootImpl"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sput-object v1, LD/J;->j:Ljava/lang/reflect/Method;

    .line 12
    .line 13
    const-string v1, "android.view.View$AttachInfo"

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sput-object v1, LD/J;->k:Ljava/lang/Class;

    .line 20
    .line 21
    const-string v2, "mVisibleInsets"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, LD/J;->l:Ljava/lang/reflect/Field;

    .line 28
    .line 29
    const-string v1, "android.view.ViewRootImpl"

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "mAttachInfo"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sput-object v1, LD/J;->m:Ljava/lang/reflect/Field;

    .line 42
    .line 43
    sget-object v1, LD/J;->l:Ljava/lang/reflect/Field;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 46
    .line 47
    .line 48
    sget-object v1, LD/J;->m:Ljava/lang/reflect/Field;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "Failed to get visible insets. (Reflection error). "

    .line 58
    .line 59
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v3, "WindowInsetsCompat"

    .line 74
    .line 75
    invoke-static {v3, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    .line 77
    .line 78
    :goto_0
    sput-boolean v0, LD/J;->i:Z

    .line 79
    .line 80
    return-void
.end method

.method public static y(II)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x6

    .line 2
    .line 3
    and-int/lit8 p1, p1, 0x6

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LD/J;->u(Landroid/view/View;)Lw/b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lw/b;->e:Lw/b;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1}, LD/J;->x(Lw/b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    invoke-super {p0, p1}, LD/S;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    check-cast p1, LD/J;

    .line 10
    .line 11
    iget-object v0, p0, LD/J;->g:Lw/b;

    .line 12
    .line 13
    iget-object v2, p1, LD/J;->g:Lw/b;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget v0, p0, LD/J;->h:I

    .line 22
    .line 23
    iget p1, p1, LD/J;->h:I

    .line 24
    .line 25
    invoke-static {v0, p1}, LD/J;->y(II)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    return p1

    .line 33
    :cond_1
    return v1
.end method

.method public final i()Lw/b;
    .locals 4

    .line 1
    iget-object v0, p0, LD/J;->e:Lw/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v1, v2, v3, v0}, Lw/b;->a(IIII)Lw/b;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, LD/J;->e:Lw/b;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, LD/J;->e:Lw/b;

    .line 30
    .line 31
    return-object v0
.end method

.method public k(IIII)LD/W;
    .locals 3

    .line 1
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1, v0}, LD/W;->c(Landroid/view/View;Landroid/view/WindowInsets;)LD/W;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v2, 0x22

    .line 11
    .line 12
    if-lt v1, v2, :cond_0

    .line 13
    .line 14
    new-instance v1, LD/H;

    .line 15
    .line 16
    invoke-direct {v1, v0}, LD/H;-><init>(LD/W;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v2, 0x1f

    .line 21
    .line 22
    if-lt v1, v2, :cond_1

    .line 23
    .line 24
    new-instance v1, LD/G;

    .line 25
    .line 26
    invoke-direct {v1, v0}, LD/G;-><init>(LD/W;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/16 v2, 0x1e

    .line 31
    .line 32
    if-lt v1, v2, :cond_2

    .line 33
    .line 34
    new-instance v1, LD/F;

    .line 35
    .line 36
    invoke-direct {v1, v0}, LD/F;-><init>(LD/W;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/16 v2, 0x1d

    .line 41
    .line 42
    if-lt v1, v2, :cond_3

    .line 43
    .line 44
    new-instance v1, LD/E;

    .line 45
    .line 46
    invoke-direct {v1, v0}, LD/E;-><init>(LD/W;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    new-instance v1, LD/C;

    .line 51
    .line 52
    invoke-direct {v1, v0}, LD/C;-><init>(LD/W;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0}, LD/J;->i()Lw/b;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0, p1, p2, p3, p4}, LD/W;->a(Lw/b;IIII)Lw/b;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v1, v0}, LD/I;->d(Lw/b;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, LD/S;->g()Lw/b;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0, p1, p2, p3, p4}, LD/W;->a(Lw/b;IIII)Lw/b;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {v1, p1}, LD/I;->c(Lw/b;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, LD/I;->b()LD/W;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    return-object p1
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/WindowInsets;->isRound()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public n(I)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x200

    .line 4
    .line 5
    if-gt v1, v2, :cond_2

    .line 6
    .line 7
    and-int v2, p1, v1

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0, v1}, LD/J;->v(I)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    return p1

    .line 20
    :cond_1
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v0
.end method

.method public o([Lw/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LD/J;->d:[Lw/b;

    .line 2
    .line 3
    return-void
.end method

.method public p(LD/W;)V
    .locals 0

    .line 1
    iput-object p1, p0, LD/J;->f:LD/W;

    .line 2
    .line 3
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iput p1, p0, LD/J;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public s(IZ)Lw/b;
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    sget-object v1, Lw/b;->e:Lw/b;

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-eq p1, v0, :cond_12

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq p1, v3, :cond_d

    .line 10
    .line 11
    const/16 p2, 0x8

    .line 12
    .line 13
    if-eq p1, p2, :cond_9

    .line 14
    .line 15
    const/16 p2, 0x10

    .line 16
    .line 17
    if-eq p1, p2, :cond_8

    .line 18
    .line 19
    const/16 p2, 0x20

    .line 20
    .line 21
    if-eq p1, p2, :cond_7

    .line 22
    .line 23
    const/16 p2, 0x40

    .line 24
    .line 25
    if-eq p1, p2, :cond_6

    .line 26
    .line 27
    const/16 p2, 0x80

    .line 28
    .line 29
    if-eq p1, p2, :cond_0

    .line 30
    .line 31
    goto/16 :goto_4

    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, LD/J;->f:LD/W;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p1, LD/W;->a:LD/S;

    .line 38
    .line 39
    invoke-virtual {p1}, LD/S;->e()LD/e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, LD/S;->e()LD/e;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    if-eqz p1, :cond_14

    .line 49
    .line 50
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 51
    .line 52
    const/16 v0, 0x1c

    .line 53
    .line 54
    if-lt p2, v0, :cond_2

    .line 55
    .line 56
    iget-object v1, p1, LD/e;->a:Landroid/view/DisplayCutout;

    .line 57
    .line 58
    invoke-static {v1}, LD/d;->h(Landroid/view/DisplayCutout;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v1, v2

    .line 64
    :goto_1
    if-lt p2, v0, :cond_3

    .line 65
    .line 66
    iget-object v3, p1, LD/e;->a:Landroid/view/DisplayCutout;

    .line 67
    .line 68
    invoke-static {v3}, LD/d;->j(Landroid/view/DisplayCutout;)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    goto :goto_2

    .line 73
    :cond_3
    move v3, v2

    .line 74
    :goto_2
    if-lt p2, v0, :cond_4

    .line 75
    .line 76
    iget-object v4, p1, LD/e;->a:Landroid/view/DisplayCutout;

    .line 77
    .line 78
    invoke-static {v4}, LD/d;->i(Landroid/view/DisplayCutout;)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    goto :goto_3

    .line 83
    :cond_4
    move v4, v2

    .line 84
    :goto_3
    if-lt p2, v0, :cond_5

    .line 85
    .line 86
    iget-object p1, p1, LD/e;->a:Landroid/view/DisplayCutout;

    .line 87
    .line 88
    invoke-static {p1}, LD/d;->g(Landroid/view/DisplayCutout;)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    :cond_5
    invoke-static {v1, v3, v4, v2}, Lw/b;->a(IIII)Lw/b;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    return-object p1

    .line 97
    :cond_6
    invoke-virtual {p0}, LD/S;->j()Lw/b;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    return-object p1

    .line 102
    :cond_7
    invoke-virtual {p0}, LD/S;->f()Lw/b;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    return-object p1

    .line 107
    :cond_8
    invoke-virtual {p0}, LD/S;->h()Lw/b;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    return-object p1

    .line 112
    :cond_9
    iget-object p1, p0, LD/J;->d:[Lw/b;

    .line 113
    .line 114
    if-eqz p1, :cond_a

    .line 115
    .line 116
    const/4 p2, 0x3

    .line 117
    aget-object v0, p1, p2

    .line 118
    .line 119
    :cond_a
    if-eqz v0, :cond_b

    .line 120
    .line 121
    return-object v0

    .line 122
    :cond_b
    invoke-virtual {p0}, LD/J;->i()Lw/b;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0}, LD/J;->t()Lw/b;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    iget p1, p1, Lw/b;->d:I

    .line 131
    .line 132
    iget v0, p2, Lw/b;->d:I

    .line 133
    .line 134
    if-le p1, v0, :cond_c

    .line 135
    .line 136
    invoke-static {v2, v2, v2, p1}, Lw/b;->a(IIII)Lw/b;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    return-object p1

    .line 141
    :cond_c
    iget-object p1, p0, LD/J;->g:Lw/b;

    .line 142
    .line 143
    if-eqz p1, :cond_14

    .line 144
    .line 145
    invoke-virtual {p1, v1}, Lw/b;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-nez p1, :cond_14

    .line 150
    .line 151
    iget-object p1, p0, LD/J;->g:Lw/b;

    .line 152
    .line 153
    iget p1, p1, Lw/b;->d:I

    .line 154
    .line 155
    iget p2, p2, Lw/b;->d:I

    .line 156
    .line 157
    if-le p1, p2, :cond_14

    .line 158
    .line 159
    invoke-static {v2, v2, v2, p1}, Lw/b;->a(IIII)Lw/b;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    return-object p1

    .line 164
    :cond_d
    if-eqz p2, :cond_e

    .line 165
    .line 166
    invoke-direct {p0}, LD/J;->t()Lw/b;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p0}, LD/S;->g()Lw/b;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    iget v0, p1, Lw/b;->a:I

    .line 175
    .line 176
    iget v1, p2, Lw/b;->a:I

    .line 177
    .line 178
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    iget v1, p1, Lw/b;->c:I

    .line 183
    .line 184
    iget v3, p2, Lw/b;->c:I

    .line 185
    .line 186
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    iget p1, p1, Lw/b;->d:I

    .line 191
    .line 192
    iget p2, p2, Lw/b;->d:I

    .line 193
    .line 194
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    invoke-static {v0, v2, v1, p1}, Lw/b;->a(IIII)Lw/b;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    return-object p1

    .line 203
    :cond_e
    iget p1, p0, LD/J;->h:I

    .line 204
    .line 205
    and-int/2addr p1, v3

    .line 206
    if-eqz p1, :cond_f

    .line 207
    .line 208
    goto :goto_4

    .line 209
    :cond_f
    invoke-virtual {p0}, LD/J;->i()Lw/b;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iget-object p2, p0, LD/J;->f:LD/W;

    .line 214
    .line 215
    if-eqz p2, :cond_10

    .line 216
    .line 217
    iget-object p2, p2, LD/W;->a:LD/S;

    .line 218
    .line 219
    invoke-virtual {p2}, LD/S;->g()Lw/b;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    :cond_10
    iget p2, p1, Lw/b;->d:I

    .line 224
    .line 225
    if-eqz v0, :cond_11

    .line 226
    .line 227
    iget v0, v0, Lw/b;->d:I

    .line 228
    .line 229
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    :cond_11
    iget v0, p1, Lw/b;->a:I

    .line 234
    .line 235
    iget p1, p1, Lw/b;->c:I

    .line 236
    .line 237
    invoke-static {v0, v2, p1, p2}, Lw/b;->a(IIII)Lw/b;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    return-object p1

    .line 242
    :cond_12
    if-eqz p2, :cond_13

    .line 243
    .line 244
    invoke-direct {p0}, LD/J;->t()Lw/b;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    iget p1, p1, Lw/b;->b:I

    .line 249
    .line 250
    invoke-virtual {p0}, LD/J;->i()Lw/b;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    iget p2, p2, Lw/b;->b:I

    .line 255
    .line 256
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    invoke-static {v2, p1, v2, v2}, Lw/b;->a(IIII)Lw/b;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    return-object p1

    .line 265
    :cond_13
    iget p1, p0, LD/J;->h:I

    .line 266
    .line 267
    and-int/lit8 p1, p1, 0x4

    .line 268
    .line 269
    if-eqz p1, :cond_15

    .line 270
    .line 271
    :cond_14
    :goto_4
    return-object v1

    .line 272
    :cond_15
    invoke-virtual {p0}, LD/J;->i()Lw/b;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    iget p1, p1, Lw/b;->b:I

    .line 277
    .line 278
    invoke-static {v2, p1, v2, v2}, Lw/b;->a(IIII)Lw/b;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    return-object p1
.end method

.method public v(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq p1, v2, :cond_1

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    if-eq p1, v2, :cond_0

    .line 10
    .line 11
    const/16 v2, 0x8

    .line 12
    .line 13
    if-eq p1, v2, :cond_1

    .line 14
    .line 15
    const/16 v2, 0x80

    .line 16
    .line 17
    if-eq p1, v2, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    invoke-virtual {p0, p1, v0}, LD/J;->s(IZ)Lw/b;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v0, Lw/b;->e:Lw/b;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lw/b;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    xor-int/2addr p1, v1

    .line 32
    return p1
.end method

.method public x(Lw/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LD/J;->g:Lw/b;

    .line 2
    .line 3
    return-void
.end method
