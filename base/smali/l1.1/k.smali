.class public final Ll1/k;
.super Landroidx/datastore/preferences/protobuf/j;
.source "SourceFile"


# instance fields
.field public final synthetic c:I


# direct methods
.method public constructor <init>([BII)V
    .locals 1

    .line 1
    iput p3, p0, Ll1/k;->c:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length p3, p1

    .line 7
    const/16 v0, 0x20

    .line 8
    .line 9
    if-ne p3, v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll1/j;->e([B)[I

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Landroidx/datastore/preferences/protobuf/j;->b:Ljava/lang/Object;

    .line 16
    .line 17
    iput p2, p0, Landroidx/datastore/preferences/protobuf/j;->a:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p1, Ljava/security/InvalidKeyException;

    .line 21
    .line 22
    const-string p2, "The key length in bytes must be 32."

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p1
.end method


# virtual methods
.method public final c([II)[I
    .locals 5

    .line 1
    iget v0, p0, Ll1/k;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x6

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/j;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, [I

    .line 17
    .line 18
    invoke-static {v1, p1}, Ll1/j;->b([I[I)[I

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget-object v2, Ll1/j;->a:[I

    .line 23
    .line 24
    array-length v3, v2

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    array-length v2, v2

    .line 30
    const/16 v3, 0x8

    .line 31
    .line 32
    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    const/16 v1, 0xc

    .line 36
    .line 37
    aput p2, v0, v1

    .line 38
    .line 39
    const/16 p2, 0xd

    .line 40
    .line 41
    aput v4, v0, p2

    .line 42
    .line 43
    const/4 p2, 0x4

    .line 44
    aget p2, p1, p2

    .line 45
    .line 46
    const/16 v1, 0xe

    .line 47
    .line 48
    aput p2, v0, v1

    .line 49
    .line 50
    const/4 p2, 0x5

    .line 51
    aget p1, p1, p2

    .line 52
    .line 53
    const/16 p2, 0xf

    .line 54
    .line 55
    aput p1, v0, p2

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 59
    .line 60
    array-length p1, p1

    .line 61
    mul-int/lit8 p1, p1, 0x20

    .line 62
    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v0, "XChaCha20 uses 192-bit nonces, but got a %d-bit nonce"

    .line 72
    .line 73
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p2

    .line 81
    :pswitch_0
    array-length v0, p1

    .line 82
    const/4 v1, 0x3

    .line 83
    if-ne v0, v1, :cond_1

    .line 84
    .line 85
    const/16 v0, 0x10

    .line 86
    .line 87
    new-array v0, v0, [I

    .line 88
    .line 89
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/j;->b:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v1, [I

    .line 92
    .line 93
    sget-object v2, Ll1/j;->a:[I

    .line 94
    .line 95
    array-length v3, v2

    .line 96
    const/4 v4, 0x0

    .line 97
    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    .line 99
    .line 100
    array-length v2, v2

    .line 101
    const/16 v3, 0x8

    .line 102
    .line 103
    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    .line 105
    .line 106
    const/16 v1, 0xc

    .line 107
    .line 108
    aput p2, v0, v1

    .line 109
    .line 110
    const/16 p2, 0xd

    .line 111
    .line 112
    array-length v1, p1

    .line 113
    invoke-static {p1, v4, v0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    .line 115
    .line 116
    return-object v0

    .line 117
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 118
    .line 119
    array-length p1, p1

    .line 120
    mul-int/lit8 p1, p1, 0x20

    .line 121
    .line 122
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string v0, "ChaCha20 uses 96-bit nonces, but got a %d-bit nonce"

    .line 131
    .line 132
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw p2

    .line 140
    nop

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final i()I
    .locals 1

    .line 1
    iget v0, p0, Ll1/k;->c:I

    packed-switch v0, :pswitch_data_0

    const/16 v0, 0x18

    return v0

    :pswitch_0
    const/16 v0, 0xc

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
