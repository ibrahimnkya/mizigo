.class public final Ld3/b;
.super LA0/c;
.source "SourceFile"


# instance fields
.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(La3/i;I)V
    .locals 0

    .line 1
    iput p2, p0, Ld3/b;->g:I

    const/16 p2, 0x1b

    invoke-direct {p0, p2, p1}, LA0/c;-><init>(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final w(Ljava/nio/ByteBuffer;Ld3/d;)Landroid/graphics/Bitmap;
    .locals 10

    .line 1
    iget v0, p0, Ld3/b;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2}, LA0/c;->w(Ljava/nio/ByteBuffer;Ld3/d;)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p2, p2, Ld3/d;->d:I

    .line 11
    .line 12
    invoke-static {p1, p2}, Lc1/g;->b(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1

    .line 17
    :pswitch_0
    invoke-super {p0, p1, p2}, LA0/c;->w(Ljava/nio/ByteBuffer;Ld3/d;)Landroid/graphics/Bitmap;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    new-array v1, v0, [B

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    .line 37
    .line 38
    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 42
    .line 43
    iput-object v2, p1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {v1, v2, v0, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget p1, p2, Ld3/d;->c:I

    .line 51
    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    new-instance v8, Landroid/graphics/Matrix;

    .line 55
    .line 56
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 57
    .line 58
    .line 59
    iget p1, p2, Ld3/d;->c:I

    .line 60
    .line 61
    int-to-float p1, p1

    .line 62
    invoke-virtual {v8, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    const/4 v9, 0x1

    .line 74
    const/4 v4, 0x0

    .line 75
    const/4 v5, 0x0

    .line 76
    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 81
    .line 82
    .line 83
    iget p2, p2, Ld3/d;->d:I

    .line 84
    .line 85
    invoke-static {p1, p2}, Lc1/g;->b(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iget p1, p2, Ld3/d;->d:I

    .line 91
    .line 92
    invoke-static {v3, p1}, Lc1/g;->b(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    :goto_0
    return-object v0

    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
