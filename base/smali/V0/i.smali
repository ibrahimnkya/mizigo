.class public final LV0/i;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LV0/i;->a:I

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method public final initialValue()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, LV0/i;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "AES/CTR/NoPadding"

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    :try_start_0
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 10
    .line 11
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-object v0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    throw v1

    .line 27
    :pswitch_0
    :try_start_1
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 28
    .line 29
    const-string v1, "AES/CTR/NOPADDING"

    .line 30
    .line 31
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljavax/crypto/Cipher;
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    .line 39
    return-object v0

    .line 40
    :catch_1
    move-exception v0

    .line 41
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 42
    .line 43
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    throw v1

    .line 47
    :pswitch_1
    :try_start_2
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 48
    .line 49
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 50
    .line 51
    invoke-interface {v0, v2}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ljavax/crypto/Cipher;
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 56
    .line 57
    return-object v0

    .line 58
    :catch_2
    move-exception v0

    .line 59
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 60
    .line 61
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    throw v1

    .line 65
    :pswitch_2
    :try_start_3
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 66
    .line 67
    const-string v1, "AES/ECB/NoPadding"

    .line 68
    .line 69
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 70
    .line 71
    invoke-interface {v0, v1}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ljavax/crypto/Cipher;
    :try_end_3
    .catch Ljava/security/GeneralSecurityException; {:try_start_3 .. :try_end_3} :catch_3

    .line 76
    .line 77
    return-object v0

    .line 78
    :catch_3
    move-exception v0

    .line 79
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 80
    .line 81
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    throw v1

    .line 85
    :pswitch_3
    invoke-static {}, Ls1/a;->a()Ljava/security/Provider;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v2, "SHA1PRNG"

    .line 90
    .line 91
    if-eqz v0, :cond_0

    .line 92
    .line 93
    :try_start_4
    invoke-static {v2, v0}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/SecureRandom;

    .line 94
    .line 95
    .line 96
    move-result-object v0
    :try_end_4
    .catch Ljava/security/GeneralSecurityException; {:try_start_4 .. :try_end_4} :catch_4

    .line 97
    goto :goto_0

    .line 98
    :catch_4
    :cond_0
    :try_start_5
    const-string v0, "org.conscrypt.Conscrypt"

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v3, "newProvider"

    .line 105
    .line 106
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Ljava/security/Provider;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 115
    .line 116
    move-object v1, v0

    .line 117
    :catchall_0
    if-eqz v1, :cond_1

    .line 118
    .line 119
    :try_start_6
    invoke-static {v2, v1}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/SecureRandom;

    .line 120
    .line 121
    .line 122
    move-result-object v0
    :try_end_6
    .catch Ljava/security/GeneralSecurityException; {:try_start_6 .. :try_end_6} :catch_5

    .line 123
    goto :goto_0

    .line 124
    :catch_5
    :cond_1
    new-instance v0, Ljava/security/SecureRandom;

    .line 125
    .line 126
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 127
    .line 128
    .line 129
    :goto_0
    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    .line 130
    .line 131
    .line 132
    return-object v0

    .line 133
    :pswitch_4
    :try_start_7
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 134
    .line 135
    const-string v2, "AES/GCM-SIV/NoPadding"

    .line 136
    .line 137
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 138
    .line 139
    invoke-interface {v0, v2}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Ljavax/crypto/Cipher;

    .line 144
    .line 145
    invoke-static {v0}, Ll1/f;->c(Ljavax/crypto/Cipher;)Z

    .line 146
    .line 147
    .line 148
    move-result v2
    :try_end_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_7 .. :try_end_7} :catch_6

    .line 149
    if-nez v2, :cond_2

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_2
    move-object v1, v0

    .line 153
    :goto_1
    return-object v1

    .line 154
    :catch_6
    move-exception v0

    .line 155
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 156
    .line 157
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    throw v1

    .line 161
    :pswitch_5
    :try_start_8
    sget-object v0, Ly1/i;->b:Ly1/i;

    .line 162
    .line 163
    const-string v1, "AES/GCM/NoPadding"

    .line 164
    .line 165
    iget-object v0, v0, Ly1/i;->a:Ly1/h;

    .line 166
    .line 167
    invoke-interface {v0, v1}, Ly1/h;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Ljavax/crypto/Cipher;
    :try_end_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_8 .. :try_end_8} :catch_7

    .line 172
    .line 173
    return-object v0

    .line 174
    :catch_7
    move-exception v0

    .line 175
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 176
    .line 177
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    throw v1

    .line 181
    :pswitch_6
    const-wide/16 v0, 0x0

    .line 182
    .line 183
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    return-object v0

    .line 188
    nop

    .line 189
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
