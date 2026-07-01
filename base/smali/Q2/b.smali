.class public final LQ2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ2/i;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljavax/crypto/Cipher;

.field public final synthetic g:Landroid/content/SharedPreferences;

.field public final synthetic h:Landroid/content/SharedPreferences;

.field public final synthetic i:LV1/y;

.field public final synthetic j:LQ2/d;


# direct methods
.method public synthetic constructor <init>(LQ2/d;Ljavax/crypto/Cipher;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;I)V
    .locals 0

    .line 1
    iput p6, p0, LQ2/b;->e:I

    iput-object p1, p0, LQ2/b;->j:LQ2/d;

    iput-object p2, p0, LQ2/b;->f:Ljavax/crypto/Cipher;

    iput-object p3, p0, LQ2/b;->g:Landroid/content/SharedPreferences;

    iput-object p4, p0, LQ2/b;->h:Landroid/content/SharedPreferences;

    iput-object p5, p0, LQ2/b;->i:LV1/y;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget v0, p0, LQ2/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, LQ2/a;->v(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "FlutterSecureStorage"

    .line 10
    .line 11
    iget-object v0, p0, LQ2/b;->j:LQ2/d;

    .line 12
    .line 13
    iget-object v1, v0, LQ2/d;->b:Landroid/content/Context;

    .line 14
    .line 15
    :try_start_0
    const-string v2, "Step 2/7: Decrypting all data with saved biometric cipher..."

    .line 16
    .line 17
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v2, v0, LQ2/d;->e:LD0/d;

    .line 21
    .line 22
    iget-object v3, p0, LQ2/b;->f:Ljavax/crypto/Cipher;

    .line 23
    .line 24
    invoke-virtual {v2, v1, v3}, LD0/d;->f(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, LQ2/b;->g:Landroid/content/SharedPreferences;

    .line 29
    .line 30
    invoke-virtual {v0, v3, v2}, LQ2/d;->c(Landroid/content/SharedPreferences;LR2/e;)Ljava/util/HashMap;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "Step 3/7: Deleting old biometric AES key from Android KeyStore..."

    .line 35
    .line 36
    invoke-static {p1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object v4, v0, LQ2/d;->e:LD0/d;

    .line 40
    .line 41
    iget-object v5, v4, LD0/d;->f:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v5, LR2/b;

    .line 44
    .line 45
    iget-object v6, v4, LD0/d;->h:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v6, LR2/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    .line 49
    if-eq v5, v6, :cond_0

    .line 50
    .line 51
    const/4 v5, 0x1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 v5, 0x0

    .line 54
    :goto_0
    if-eqz v5, :cond_1

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {v4, v1}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v4}, LR2/a;->l()V

    .line 61
    .line 62
    .line 63
    invoke-interface {v2, v1}, LR2/e;->c(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "Old key deleted from KeyStore"

    .line 67
    .line 68
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catch_0
    move-exception v2

    .line 73
    :try_start_2
    const-string v4, "Failed to delete old key from KeyStore (may not exist)"

    .line 74
    .line 75
    invoke-static {p1, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catch_1
    move-exception v0

    .line 80
    goto :goto_2

    .line 81
    :cond_1
    :goto_1
    const-string v2, "Step 4/7: Updating algorithm markers to current..."

    .line 82
    .line 83
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, LQ2/b;->h:Landroid/content/SharedPreferences;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, LQ2/d;->q(Landroid/content/SharedPreferences;)V

    .line 89
    .line 90
    .line 91
    const-string v2, "Step 5/7: Getting current biometric cipher..."

    .line 92
    .line 93
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    iget-object v2, v0, LQ2/d;->e:LD0/d;

    .line 97
    .line 98
    iget-object v4, v2, LD0/d;->h:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v4, LR2/b;

    .line 101
    .line 102
    iget-object v4, v4, LR2/b;->e:LA1/h;

    .line 103
    .line 104
    iget-object v2, v2, LD0/d;->j:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v2, LQ2/e;

    .line 107
    .line 108
    invoke-virtual {v4, v1, v2}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v2, v1}, LR2/a;->g(Landroid/content/Context;)Ljavax/crypto/Cipher;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    if-eqz v1, :cond_2

    .line 117
    .line 118
    const-string v2, "Authenticating with NEW biometric cipher to encrypt data..."

    .line 119
    .line 120
    invoke-static {p1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    new-instance v2, LB2/a;

    .line 124
    .line 125
    invoke-direct {v2, p0, v1, v3}, LB2/a;-><init>(LQ2/b;Ljavax/crypto/Cipher;Ljava/util/HashMap;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1, v2}, LQ2/d;->b(Ljavax/crypto/Cipher;LQ2/i;)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_2
    new-instance v0, Ljava/lang/Exception;

    .line 133
    .line 134
    const-string v1, "Failed to get current biometric cipher"

    .line 135
    .line 136
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 140
    :goto_2
    const-string v1, "Failed after first authentication"

    .line 141
    .line 142
    invoke-static {p1, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, LQ2/b;->i:LV1/y;

    .line 146
    .line 147
    invoke-virtual {p1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 148
    .line 149
    .line 150
    :goto_3
    return-void

    .line 151
    :pswitch_0
    invoke-static {p1}, LQ2/a;->v(Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, LQ2/b;->i:LV1/y;

    .line 155
    .line 156
    iget-object v0, p0, LQ2/b;->g:Landroid/content/SharedPreferences;

    .line 157
    .line 158
    iget-object v1, p0, LQ2/b;->j:LQ2/d;

    .line 159
    .line 160
    iget-object v2, v1, LQ2/d;->b:Landroid/content/Context;

    .line 161
    .line 162
    const-string v3, "FlutterSecureStorage"

    .line 163
    .line 164
    :try_start_3
    const-string v4, "Step 2/6: Decrypting all data with saved biometric cipher..."

    .line 165
    .line 166
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    iget-object v4, v1, LQ2/d;->e:LD0/d;

    .line 170
    .line 171
    iget-object v5, p0, LQ2/b;->f:Ljavax/crypto/Cipher;

    .line 172
    .line 173
    invoke-virtual {v4, v2, v5}, LD0/d;->f(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-virtual {v1, v0, v4}, LQ2/d;->c(Landroid/content/SharedPreferences;LR2/e;)Ljava/util/HashMap;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    const-string v6, "Step 3/6: Deleting old biometric AES key from Android KeyStore..."

    .line 182
    .line 183
    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    iget-object v6, v1, LQ2/d;->e:LD0/d;

    .line 187
    .line 188
    iget-object v7, v6, LD0/d;->f:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v7, LR2/b;

    .line 191
    .line 192
    iget-object v8, v6, LD0/d;->h:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast v8, LR2/b;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 195
    .line 196
    if-eq v7, v8, :cond_3

    .line 197
    .line 198
    const/4 v7, 0x1

    .line 199
    goto :goto_4

    .line 200
    :cond_3
    const/4 v7, 0x0

    .line 201
    :goto_4
    if-eqz v7, :cond_4

    .line 202
    .line 203
    :try_start_4
    invoke-virtual {v6, v2}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    invoke-interface {v6}, LR2/a;->l()V

    .line 208
    .line 209
    .line 210
    invoke-interface {v4, v2}, LR2/e;->c(Landroid/content/Context;)V

    .line 211
    .line 212
    .line 213
    const-string v4, "Old key deleted from KeyStore"

    .line 214
    .line 215
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 216
    .line 217
    .line 218
    goto :goto_5

    .line 219
    :catch_2
    move-exception v4

    .line 220
    :try_start_5
    const-string v6, "Failed to delete old key from KeyStore (may not exist)"

    .line 221
    .line 222
    invoke-static {v3, v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 223
    .line 224
    .line 225
    goto :goto_5

    .line 226
    :catch_3
    move-exception v0

    .line 227
    goto :goto_6

    .line 228
    :cond_4
    :goto_5
    const-string v4, "Step 4/6: Updating algorithm markers to current..."

    .line 229
    .line 230
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    iget-object v4, p0, LQ2/b;->h:Landroid/content/SharedPreferences;

    .line 234
    .line 235
    invoke-virtual {v1, v4}, LQ2/d;->q(Landroid/content/SharedPreferences;)V

    .line 236
    .line 237
    .line 238
    const-string v4, "Step 5/6: Initializing current non-biometric cipher..."

    .line 239
    .line 240
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    iget-object v4, v1, LQ2/d;->e:LD0/d;

    .line 244
    .line 245
    const/4 v6, 0x0

    .line 246
    invoke-virtual {v4, v2, v6}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    const-string v4, "Step 6/6: Encrypting all data with current cipher..."

    .line 251
    .line 252
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    invoke-static {v5, v0, v2}, LQ2/d;->e(Ljava/util/HashMap;Landroid/content/SharedPreferences;LR2/e;)V

    .line 256
    .line 257
    .line 258
    iput-object v2, v1, LQ2/d;->d:LR2/e;

    .line 259
    .line 260
    const-string v0, "Biometric\u2192Non-biometric migration completed! Data no longer requires biometric authentication."

    .line 261
    .line 262
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1, v6}, LV1/y;->b(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 266
    .line 267
    .line 268
    goto :goto_7

    .line 269
    :goto_6
    const-string v1, "Failed to complete migration after authentication"

    .line 270
    .line 271
    invoke-static {v3, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 275
    .line 276
    .line 277
    :goto_7
    return-void

    .line 278
    nop

    .line 279
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final h(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget v0, p0, LQ2/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "FlutterSecureStorage"

    .line 7
    .line 8
    const-string v1, "First biometric authentication failed for migration"

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/lang/Exception;

    .line 14
    .line 15
    const-string v1, "Migration cancelled: First biometric authentication failed"

    .line 16
    .line 17
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, LQ2/b;->i:LV1/y;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_0
    const-string v0, "FlutterSecureStorage"

    .line 27
    .line 28
    const-string v1, "Biometric authentication failed for migration"

    .line 29
    .line 30
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/lang/Exception;

    .line 34
    .line 35
    const-string v1, "Migration cancelled: Biometric authentication failed"

    .line 36
    .line 37
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, LQ2/b;->i:LV1/y;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
