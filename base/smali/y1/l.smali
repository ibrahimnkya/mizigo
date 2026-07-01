.class public final Ly1/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv1/c;


# instance fields
.field public final e:Ly1/k;

.field public final f:Ljava/lang/String;

.field public final g:Ljavax/crypto/spec/SecretKeySpec;

.field public final h:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ly1/k;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ly1/k;-><init>(Ly1/l;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ly1/l;->e:Ly1/k;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-static {v1}, LE1/j;->f(I)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_6

    .line 17
    .line 18
    iput-object p1, p0, Ly1/l;->f:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p2, p0, Ly1/l;->g:Ljavax/crypto/spec/SecretKeySpec;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    array-length p2, p2

    .line 27
    const/16 v2, 0x10

    .line 28
    .line 29
    if-lt p2, v2, :cond_5

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    const/4 v2, -0x1

    .line 39
    sparse-switch p2, :sswitch_data_0

    .line 40
    .line 41
    .line 42
    :goto_0
    move v1, v2

    .line 43
    goto :goto_1

    .line 44
    :sswitch_0
    const-string p2, "HMACSHA512"

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 v1, 0x4

    .line 54
    goto :goto_1

    .line 55
    :sswitch_1
    const-string p2, "HMACSHA384"

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/4 v1, 0x3

    .line 65
    goto :goto_1

    .line 66
    :sswitch_2
    const-string p2, "HMACSHA256"

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_3
    const-string p2, "HMACSHA224"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-nez p2, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    const/4 v1, 0x1

    .line 85
    goto :goto_1

    .line 86
    :sswitch_4
    const-string p2, "HMACSHA1"

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_3

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    const/4 v1, 0x0

    .line 96
    :cond_4
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 97
    .line 98
    .line 99
    new-instance p2, Ljava/security/NoSuchAlgorithmException;

    .line 100
    .line 101
    const-string v0, "unknown Hmac algorithm: "

    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-direct {p2, p1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p2

    .line 111
    :pswitch_0
    const/16 p1, 0x40

    .line 112
    .line 113
    iput p1, p0, Ly1/l;->h:I

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :pswitch_1
    const/16 p1, 0x30

    .line 117
    .line 118
    iput p1, p0, Ly1/l;->h:I

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :pswitch_2
    const/16 p1, 0x20

    .line 122
    .line 123
    iput p1, p0, Ly1/l;->h:I

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :pswitch_3
    const/16 p1, 0x1c

    .line 127
    .line 128
    iput p1, p0, Ly1/l;->h:I

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :pswitch_4
    const/16 p1, 0x14

    .line 132
    .line 133
    iput p1, p0, Ly1/l;->h:I

    .line 134
    .line 135
    :goto_2
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    new-instance p1, Ljava/security/InvalidAlgorithmParameterException;

    .line 140
    .line 141
    const-string p2, "key size too small, need at least 16 bytes"

    .line 142
    .line 143
    invoke-direct {p1, p2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    throw p1

    .line 147
    :cond_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 148
    .line 149
    const-string p2, "Can not use HMAC in FIPS-mode, as BoringCrypto module is not available."

    .line 150
    .line 151
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p1

    .line 155
    :sswitch_data_0
    .sparse-switch
        -0x6ca99674 -> :sswitch_4
        0x1762408f -> :sswitch_3
        0x176240ee -> :sswitch_2
        0x1762450a -> :sswitch_1
        0x17624bb1 -> :sswitch_0
    .end sparse-switch

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a(I[B)[B
    .locals 2

    .line 1
    iget v0, p0, Ly1/l;->h:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ly1/l;->e:Ly1/k;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljavax/crypto/Mac;

    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljavax/crypto/Mac;->update([B)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Ljavax/crypto/Mac;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljavax/crypto/Mac;->doFinal()[B

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    return-object p1

    .line 31
    :cond_0
    new-instance p1, Ljava/security/InvalidAlgorithmParameterException;

    .line 32
    .line 33
    const-string p2, "tag size too big"

    .line 34
    .line 35
    invoke-direct {p1, p2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p1
.end method
