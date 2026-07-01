.class public final LQ2/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Ljava/nio/charset/Charset;


# instance fields
.field public a:LQ2/e;

.field public final b:Landroid/content/Context;

.field public c:Landroid/content/SharedPreferences;

.field public d:LR2/e;

.field public e:LD0/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    sput-object v0, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, LQ2/d;->b:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method

.method public static a(LQ2/d;LS2/b;Landroid/content/SharedPreferences;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, LS2/b;->getAll()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const-string v4, "FlutterSecureStorage"

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Ljava/lang/String;

    .line 43
    .line 44
    instance-of v6, v5, Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v6, :cond_0

    .line 47
    .line 48
    check-cast v5, Ljava/lang/String;

    .line 49
    .line 50
    iget-object v6, p0, LQ2/d;->a:LQ2/e;

    .line 51
    .line 52
    iget-object v6, v6, LQ2/e;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_0

    .line 59
    .line 60
    iget-object v6, p0, LQ2/d;->d:LR2/e;

    .line 61
    .line 62
    sget-object v7, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 63
    .line 64
    invoke-virtual {v5, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-interface {v6, v5}, LR2/e;->a([B)[B

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-static {v5, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-interface {v6, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, LS2/b;->edit()Landroid/content/SharedPreferences$Editor;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, LS2/a;

    .line 92
    .line 93
    invoke-virtual {v5, v3}, LS2/a;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 94
    .line 95
    .line 96
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 97
    .line 98
    .line 99
    add-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    new-instance v5, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v6, "Migrated key: "

    .line 104
    .line 105
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    new-instance v6, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    iget-object v7, p0, LQ2/d;->a:LQ2/e;

    .line 114
    .line 115
    iget-object v7, v7, LQ2/e;->b:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const/16 v7, 0x5f

    .line 121
    .line 122
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    const-string v7, ""

    .line 130
    .line 131
    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string p1, "Migration complete: "

    .line 149
    .line 150
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string p1, " items migrated from EncryptedSharedPreferences to custom cipher storage"

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {v4, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public static e(Ljava/util/HashMap;Landroid/content/SharedPreferences;LR2/e;)V
    .locals 6

    .line 1
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    move v1, v0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "FlutterSecureStorage"

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/util/Map$Entry;

    .line 28
    .line 29
    :try_start_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Ljava/lang/String;

    .line 34
    .line 35
    sget-object v5, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {p2, v4}, LR2/e;->a([B)[B

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v4, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    check-cast v5, Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {p1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catch_0
    move-exception p0

    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p2, "Failed to encrypt key: "

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    check-cast p2, Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {v3, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    .line 84
    .line 85
    new-instance p1, Ljava/lang/Exception;

    .line 86
    .line 87
    new-instance p2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v0, "Failed to encrypt data with current cipher for key: "

    .line 90
    .line 91
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-direct {p1, p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    throw p1

    .line 111
    :cond_0
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 112
    .line 113
    .line 114
    new-instance p0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string p1, "Successfully encrypted and saved "

    .line 117
    .line 118
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p1, " items with current cipher"

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return-void
.end method


# virtual methods
.method public final b(Ljavax/crypto/Cipher;LQ2/i;)V
    .locals 10

    .line 1
    iget-object v0, p0, LQ2/d;->a:LQ2/e;

    .line 2
    .line 3
    iget-boolean v0, v0, LQ2/e;->f:Z

    .line 4
    .line 5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    iget-object v2, p0, LQ2/d;->b:Landroid/content/Context;

    .line 8
    .line 9
    const/16 v3, 0x1e

    .line 10
    .line 11
    const-string v4, "BIOMETRIC_UNAVAILABLE: Biometric authentication requires Android 9 (API 28) or higher"

    .line 12
    .line 13
    const/16 v5, 0x1c

    .line 14
    .line 15
    if-ge v1, v5, :cond_1

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    .line 22
    .line 23
    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p1

    .line 27
    :cond_1
    invoke-virtual {p0}, LQ2/d;->j()Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    const-string v7, "FlutterSecureStorage"

    .line 32
    .line 33
    if-nez v6, :cond_3

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const-string v6, "Device has no security. Biometric authentication will be skipped (enforceBiometrics=false)."

    .line 38
    .line 39
    invoke-static {v7, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    .line 45
    .line 46
    const-string p2, "BIOMETRIC_UNAVAILABLE: Device has no PIN, pattern, password, or biometric enrolled. Please secure your device in Settings."

    .line 47
    .line 48
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p1

    .line 52
    :cond_3
    if-lt v1, v3, :cond_f

    .line 53
    .line 54
    invoke-static {}, LD/D;->k()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-virtual {v2, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-static {v6}, LD/D;->d(Ljava/lang/Object;)Landroid/hardware/biometrics/BiometricManager;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    if-nez v6, :cond_5

    .line 67
    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    .line 73
    .line 74
    const-string p2, "BIOMETRIC_UNAVAILABLE: BiometricManager not available on this device"

    .line 75
    .line 76
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p1

    .line 80
    :cond_5
    invoke-static {v6}, LD/N;->b(Landroid/hardware/biometrics/BiometricManager;)I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eqz v6, :cond_f

    .line 85
    .line 86
    const/4 v8, 0x1

    .line 87
    if-eq v6, v8, :cond_d

    .line 88
    .line 89
    const/16 v8, 0xb

    .line 90
    .line 91
    if-eq v6, v8, :cond_b

    .line 92
    .line 93
    const/16 v8, 0xc

    .line 94
    .line 95
    if-eq v6, v8, :cond_9

    .line 96
    .line 97
    const/16 v8, 0xf

    .line 98
    .line 99
    if-eq v6, v8, :cond_7

    .line 100
    .line 101
    if-nez v0, :cond_6

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_6
    new-instance p1, Ljava/lang/Exception;

    .line 105
    .line 106
    const-string p2, "BIOMETRIC_UNAVAILABLE: Unknown biometric status (code: "

    .line 107
    .line 108
    const-string v0, ")"

    .line 109
    .line 110
    invoke-static {v6, p2, v0}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p1

    .line 118
    :cond_7
    if-nez v0, :cond_8

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    new-instance p1, Ljava/lang/Exception;

    .line 122
    .line 123
    const-string p2, "BIOMETRIC_UNAVAILABLE: Security update required for biometric authentication"

    .line 124
    .line 125
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw p1

    .line 129
    :cond_9
    if-nez v0, :cond_a

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_a
    new-instance p1, Ljava/lang/Exception;

    .line 133
    .line 134
    const-string p2, "BIOMETRIC_UNAVAILABLE: No biometric hardware detected on this device"

    .line 135
    .line 136
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw p1

    .line 140
    :cond_b
    if-nez v0, :cond_c

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_c
    new-instance p1, Ljava/lang/Exception;

    .line 144
    .line 145
    const-string p2, "BIOMETRIC_UNAVAILABLE: No fingerprint or face enrolled. Please enroll in Settings."

    .line 146
    .line 147
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p1

    .line 151
    :cond_d
    if-nez v0, :cond_e

    .line 152
    .line 153
    :goto_0
    new-instance v8, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v9, "Biometric check failed with code "

    .line 156
    .line 157
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v6, ", but continuing (enforceBiometrics=false)"

    .line 164
    .line 165
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-static {v7, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_e
    new-instance p1, Ljava/lang/Exception;

    .line 177
    .line 178
    const-string p2, "BIOMETRIC_UNAVAILABLE: Biometric hardware temporarily unavailable"

    .line 179
    .line 180
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    throw p1

    .line 184
    :cond_f
    :goto_1
    if-ge v1, v5, :cond_11

    .line 185
    .line 186
    if-nez v0, :cond_10

    .line 187
    .line 188
    return-void

    .line 189
    :cond_10
    new-instance p1, Ljava/lang/Exception;

    .line 190
    .line 191
    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    throw p1

    .line 195
    :cond_11
    invoke-static {p1}, LB/b;->f(Ljavax/crypto/Cipher;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {}, LB/b;->r()V

    .line 200
    .line 201
    .line 202
    invoke-static {v2}, LB/b;->d(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v2, p0, LQ2/d;->a:LQ2/e;

    .line 207
    .line 208
    iget-object v2, v2, LQ2/e;->g:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {v0, v2}, LB/b;->e(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iget-object v2, p0, LQ2/d;->a:LQ2/e;

    .line 215
    .line 216
    iget-object v2, v2, LQ2/e;->h:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v0, v2}, LB/b;->A(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    if-lt v1, v3, :cond_12

    .line 223
    .line 224
    invoke-static {v0}, LD/N;->k(Landroid/hardware/biometrics/BiometricPrompt$Builder;)V

    .line 225
    .line 226
    .line 227
    :cond_12
    invoke-static {v0}, LB/b;->g(Landroid/hardware/biometrics/BiometricPrompt$Builder;)Landroid/hardware/biometrics/BiometricPrompt;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    new-instance v1, Landroid/os/CancellationSignal;

    .line 232
    .line 233
    invoke-direct {v1}, Landroid/os/CancellationSignal;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    new-instance v3, LQ2/c;

    .line 241
    .line 242
    invoke-direct {v3, p2}, LQ2/c;-><init>(LQ2/i;)V

    .line 243
    .line 244
    .line 245
    invoke-static {v0, p1, v1, v2, v3}, LB/b;->s(Landroid/hardware/biometrics/BiometricPrompt;Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;Landroid/os/CancellationSignal;Ljava/util/concurrent/ExecutorService;LQ2/c;)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public final c(Landroid/content/SharedPreferences;LR2/e;)Ljava/util/HashMap;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const-string v4, "FlutterSecureStorage"

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    instance-of v6, v3, Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v6, :cond_0

    .line 47
    .line 48
    iget-object v6, p0, LQ2/d;->a:LQ2/e;

    .line 49
    .line 50
    iget-object v6, v6, LQ2/e;->b:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_0

    .line 57
    .line 58
    :try_start_0
    check-cast v3, Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v3, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-interface {p2, v3}, LR2/e;->d([B)[B

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    new-instance v6, Ljava/lang/String;

    .line 69
    .line 70
    sget-object v7, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 71
    .line 72
    invoke-direct {v6, v3, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catch_0
    move-exception p1

    .line 82
    const-string p2, "Failed to decrypt key: "

    .line 83
    .line 84
    invoke-virtual {p2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {v4, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .line 90
    .line 91
    new-instance p2, Ljava/lang/Exception;

    .line 92
    .line 93
    const-string v0, "Failed to decrypt existing data with saved cipher for key: "

    .line 94
    .line 95
    invoke-virtual {v0, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {p2, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    throw p2

    .line 103
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string p2, "Successfully decrypted "

    .line 106
    .line 107
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string p2, " items with saved cipher"

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    return-object v0
.end method

.method public final d(Landroid/content/SharedPreferences;LQ2/i;)V
    .locals 4

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "FlutterSecureStorage"

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 6
    .line 7
    iget-object v3, v2, LD0/d;->h:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, LR2/b;

    .line 10
    .line 11
    iget-object v3, v3, LR2/b;->e:LA1/h;

    .line 12
    .line 13
    iget-object v2, v2, LD0/d;->j:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, LQ2/e;

    .line 16
    .line 17
    invoke-virtual {v3, v0, v2}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2}, LR2/a;->l()V

    .line 22
    .line 23
    .line 24
    const-string v2, "Deleted key from AndroidKeyStore"

    .line 25
    .line 26
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v2

    .line 31
    :try_start_1
    const-string v3, "Failed to delete key from AndroidKeyStore (may not exist)"

    .line 32
    .line 33
    invoke-static {v1, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v2, p0, LQ2/d;->a:LQ2/e;

    .line 37
    .line 38
    iget-object v2, v2, LQ2/e;->a:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 54
    .line 55
    .line 56
    const-string v2, "Deleted all encrypted data"

    .line 57
    .line 58
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    const-string v2, "FlutterSecureKeyStorage"

    .line 62
    .line 63
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 76
    .line 77
    .line 78
    const-string v0, "Deleted wrapped keys from SharedPreferences"

    .line 79
    .line 80
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 88
    .line 89
    invoke-virtual {v2, v0}, LD0/d;->i(Landroid/content/SharedPreferences$Editor;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 93
    .line 94
    .line 95
    const-string v0, "Updated algorithm markers to current"

    .line 96
    .line 97
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    const-string v0, "All data deleted. Reinitializing with new algorithm..."

    .line 101
    .line 102
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1, p2}, LQ2/d;->i(Landroid/content/SharedPreferences;LQ2/i;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :catch_1
    move-exception p1

    .line 110
    const-string v0, "Failed to clean up after key mismatch"

    .line 111
    .line 112
    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    .line 114
    .line 115
    invoke-interface {p2, p1}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 116
    .line 117
    .line 118
    :goto_1
    return-void
.end method

.method public final f(Landroid/content/SharedPreferences;LQ2/i;Ljava/security/GeneralSecurityException;Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "Key mismatch detected during cipher initialization: "

    .line 2
    .line 3
    invoke-virtual {v0, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "FlutterSecureStorage"

    .line 8
    .line 9
    invoke-static {v1, v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 10
    .line 11
    .line 12
    const-string v0, "This typically occurs after an algorithm change."

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    const-string v0, "Stored key cannot be decrypted with current algorithm."

    .line 18
    .line 19
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LQ2/d;->a:LQ2/e;

    .line 23
    .line 24
    iget-boolean v0, v0, LQ2/e;->d:Z

    .line 25
    .line 26
    if-eqz v0, :cond_4

    .line 27
    .line 28
    const-string p3, "migrateOnAlgorithmChange is enabled. Attempting data migration..."

    .line 29
    .line 30
    invoke-static {v1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p3, p0, LQ2/d;->a:LQ2/e;

    .line 34
    .line 35
    iget-object p3, p3, LQ2/e;->a:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, p3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    new-instance v8, LV1/y;

    .line 45
    .line 46
    invoke-direct {v8, p0, p1, p2, p4}, LV1/y;-><init>(LQ2/d;Landroid/content/SharedPreferences;LQ2/i;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string p2, "Detected biometric migration: FROM="

    .line 50
    .line 51
    const-string p3, "Detected non-biometric migration: FROM="

    .line 52
    .line 53
    const-string p4, "Starting data migration from saved to current cipher algorithms..."

    .line 54
    .line 55
    invoke-static {v1, p4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    :try_start_0
    iget-object p4, p0, LQ2/d;->e:LD0/d;

    .line 59
    .line 60
    invoke-virtual {p4, v0}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    iget-object v0, p0, LQ2/d;->a:LQ2/e;

    .line 69
    .line 70
    iget-object v0, v0, LQ2/e;->j:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 71
    .line 72
    const/4 v3, 0x1

    .line 73
    const-string v4, "BIOMETRIC"

    .line 74
    .line 75
    if-eqz p4, :cond_0

    .line 76
    .line 77
    :try_start_1
    invoke-virtual {p4, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-eqz v6, :cond_0

    .line 82
    .line 83
    move v6, v3

    .line 84
    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    move-object p1, v0

    .line 87
    move-object v3, p0

    .line 88
    goto :goto_4

    .line 89
    :cond_0
    move v6, v2

    .line 90
    :goto_0
    if-eqz v0, :cond_1

    .line 91
    .line 92
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 96
    if-eqz v4, :cond_1

    .line 97
    .line 98
    move v7, v3

    .line 99
    goto :goto_1

    .line 100
    :cond_1
    move v7, v2

    .line 101
    :goto_1
    const-string v2, ", TO="

    .line 102
    .line 103
    if-nez v6, :cond_3

    .line 104
    .line 105
    if-eqz v7, :cond_2

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    :try_start_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1, v5, v8}, LQ2/d;->o(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    :goto_2
    :try_start_3
    new-instance p3, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 152
    .line 153
    .line 154
    move-object v3, p0

    .line 155
    move-object v4, p1

    .line 156
    :try_start_4
    invoke-virtual/range {v3 .. v8}, LQ2/d;->k(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;ZZLV1/y;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :catch_1
    move-exception v0

    .line 161
    :goto_3
    move-object p1, v0

    .line 162
    goto :goto_4

    .line 163
    :catch_2
    move-exception v0

    .line 164
    move-object v3, p0

    .line 165
    goto :goto_3

    .line 166
    :goto_4
    const-string p2, "Failed to start migration"

    .line 167
    .line 168
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 169
    .line 170
    .line 171
    new-instance p2, Ljava/lang/Exception;

    .line 172
    .line 173
    const-string p3, "Migration initialization failed"

    .line 174
    .line 175
    invoke-direct {p2, p3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v8, p2}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_4
    move-object v3, p0

    .line 183
    move-object v4, p1

    .line 184
    const-string p1, "migrateOnAlgorithmChange is disabled. Skipping data migration."

    .line 185
    .line 186
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    iget-object p1, v3, LQ2/d;->a:LQ2/e;

    .line 190
    .line 191
    iget-boolean p1, p1, LQ2/e;->c:Z

    .line 192
    .line 193
    if-eqz p1, :cond_5

    .line 194
    .line 195
    const-string p1, "resetOnError is enabled. Deleting all data and keys to recover."

    .line 196
    .line 197
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, v4, p2}, LQ2/d;->d(Landroid/content/SharedPreferences;LQ2/i;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_5
    const-string p1, "Set resetOnError=true to automatically delete data and recover."

    .line 205
    .line 206
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    const-string p1, "Or set migrateOnAlgorithmChange=true to preserve data during algorithm changes."

    .line 210
    .line 211
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    .line 213
    .line 214
    new-instance p1, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    const-string v0, "Key mismatch after algorithm change ("

    .line 217
    .line 218
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    const-string v0, "). Enable migrateOnAlgorithmChange=true to preserve data, or resetOnError=true to delete."

    .line 222
    .line 223
    invoke-static {p1, p4, v0}, Lr/a;->c(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    new-instance p4, Ljava/lang/Exception;

    .line 228
    .line 229
    invoke-direct {p4, p1, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    invoke-interface {p2, p4}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)Z
    .locals 6

    .line 1
    const-string v0, " completed. Retrying operation..."

    .line 2
    .line 3
    iget-object v1, p0, LQ2/d;->a:LQ2/e;

    .line 4
    .line 5
    iget-boolean v1, v1, LQ2/e;->c:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string v2, "key \'"

    .line 10
    .line 11
    const-string v3, "\'"

    .line 12
    .line 13
    invoke-static {v2, p2, v3}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v2, "all data"

    .line 19
    .line 20
    :goto_0
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const-string v3, "Attempting to delete corrupted data and retry..."

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const-string v3, "Set resetOnError=true to automatically delete corrupted data."

    .line 26
    .line 27
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v5, "Storage operation \'"

    .line 30
    .line 31
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "\' failed for "

    .line 38
    .line 39
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, ". "

    .line 46
    .line 47
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v2, "FlutterSecureStorage"

    .line 58
    .line 59
    invoke-static {v2, p1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    return p1

    .line 66
    :cond_2
    if-eqz p2, :cond_3

    .line 67
    .line 68
    :try_start_0
    iget-object p3, p0, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 69
    .line 70
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-interface {p3, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 75
    .line 76
    .line 77
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    iget-object p3, p0, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 82
    .line 83
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 88
    .line 89
    .line 90
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 91
    .line 92
    .line 93
    :goto_2
    if-eqz p2, :cond_4

    .line 94
    .line 95
    const-string p3, "Data for key has been deleted"

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :catch_0
    move-exception p3

    .line 99
    goto :goto_4

    .line 100
    :cond_4
    const-string p3, "All data has been deleted"

    .line 101
    .line 102
    :goto_3
    invoke-virtual {p3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-static {v2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    const/4 p1, 0x1

    .line 110
    return p1

    .line 111
    :goto_4
    if-eqz p2, :cond_5

    .line 112
    .line 113
    const-string p2, "delete data for key"

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_5
    const-string p2, "delete all data"

    .line 117
    .line 118
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string v1, "Failed to "

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string p2, " during error handling."

    .line 129
    .line 130
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-static {v2, p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 138
    .line 139
    .line 140
    return p1
.end method

.method public final h(Landroid/content/Context;)LS2/b;
    .locals 6

    .line 1
    const-string v0, "_androidx_security_master_key_"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 7
    .line 8
    const-string v2, "_androidx_security_master_key_"

    .line 9
    .line 10
    const/4 v3, 0x3

    .line 11
    invoke-direct {v1, v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    const-string v2, "NoPadding"

    .line 15
    .line 16
    filled-new-array {v2}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "GCM"

    .line 25
    .line 26
    filled-new-array {v2}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setBlockModes([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/16 v2, 0x100

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setKeySize(I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, LS2/c;->a(Landroid/security/keystore/KeyGenParameterSpec;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_b

    .line 53
    .line 54
    if-eqz v1, :cond_a

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getKeySize()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-ne v0, v2, :cond_9

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getBlockModes()[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v2, "GCM"

    .line 67
    .line 68
    filled-new-array {v2}, [Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_8

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getPurposes()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-ne v0, v3, :cond_7

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getEncryptionPaddings()[Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v2, "NoPadding"

    .line 89
    .line 90
    filled-new-array {v2}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_6

    .line 99
    .line 100
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->isUserAuthenticationRequired()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_1

    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getUserAuthenticationValidityDurationSeconds()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v2, 0x1

    .line 111
    if-lt v0, v2, :cond_0

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 115
    .line 116
    const-string v0, "per-operation authentication is not supported (UserAuthenticationValidityDurationSeconds must be >0)"

    .line 117
    .line 118
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    throw p1

    .line 122
    :cond_1
    :goto_0
    sget-object v0, LS2/d;->a:Ljava/lang/Object;

    .line 123
    .line 124
    monitor-enter v0

    .line 125
    :try_start_0
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getKeystoreAlias()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    const-string v3, "AndroidKeyStore"

    .line 130
    .line 131
    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    const/4 v4, 0x0

    .line 136
    invoke-virtual {v3, v4}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v2}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    if-nez v2, :cond_2

    .line 144
    .line 145
    :try_start_1
    const-string v2, "AES"

    .line 146
    .line 147
    const-string v3, "AndroidKeyStore"

    .line 148
    .line 149
    invoke-static {v2, v3}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v2, v1}, Ljavax/crypto/KeyGenerator;->init(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;
    :try_end_1
    .catch Ljava/security/ProviderException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :catch_0
    move-exception p1

    .line 161
    :try_start_2
    new-instance v1, Ljava/security/GeneralSecurityException;

    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-direct {v1, v2, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    throw v1

    .line 171
    :cond_2
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 172
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getKeystoreAlias()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iget-object v1, p0, LQ2/d;->a:LQ2/e;

    .line 177
    .line 178
    iget-object v1, v1, LQ2/e;->a:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {}, Lp1/e;->a()V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lk1/a;->a()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    new-instance v2, Lm/J0;

    .line 191
    .line 192
    invoke-direct {v2}, Lm/J0;-><init>()V

    .line 193
    .line 194
    .line 195
    const-string v3, "AES256_SIV"

    .line 196
    .line 197
    invoke-static {v3}, Lc1/g;->u(Ljava/lang/String;)Lj1/c;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    iput-object v3, v2, Lm/J0;->j:Ljava/lang/Object;

    .line 202
    .line 203
    const-string v3, "__androidx_security_crypto_encrypted_prefs_key_keyset__"

    .line 204
    .line 205
    if-eqz p1, :cond_5

    .line 206
    .line 207
    iput-object p1, v2, Lm/J0;->e:Ljava/lang/Object;

    .line 208
    .line 209
    iput-object v3, v2, Lm/J0;->f:Ljava/lang/Object;

    .line 210
    .line 211
    iput-object v1, v2, Lm/J0;->g:Ljava/lang/Object;

    .line 212
    .line 213
    const-string v3, "android-keystore://"

    .line 214
    .line 215
    invoke-static {v3, v0}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    const-string v5, "android-keystore://"

    .line 220
    .line 221
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    if-eqz v5, :cond_4

    .line 226
    .line 227
    iput-object v4, v2, Lm/J0;->h:Ljava/lang/Object;

    .line 228
    .line 229
    invoke-virtual {v2}, Lm/J0;->c()Lr1/a;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v2}, Lr1/a;->a()LB2/a;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    new-instance v4, Lm/J0;

    .line 238
    .line 239
    invoke-direct {v4}, Lm/J0;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v5, "AES256_GCM"

    .line 243
    .line 244
    invoke-static {v5}, Lc1/g;->u(Ljava/lang/String;)Lj1/c;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    iput-object v5, v4, Lm/J0;->j:Ljava/lang/Object;

    .line 249
    .line 250
    const-string v5, "__androidx_security_crypto_encrypted_prefs_value_keyset__"

    .line 251
    .line 252
    iput-object p1, v4, Lm/J0;->e:Ljava/lang/Object;

    .line 253
    .line 254
    iput-object v5, v4, Lm/J0;->f:Ljava/lang/Object;

    .line 255
    .line 256
    iput-object v1, v4, Lm/J0;->g:Ljava/lang/Object;

    .line 257
    .line 258
    invoke-static {v3, v0}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    const-string v3, "android-keystore://"

    .line 263
    .line 264
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 265
    .line 266
    .line 267
    move-result v3

    .line 268
    if-eqz v3, :cond_3

    .line 269
    .line 270
    iput-object v0, v4, Lm/J0;->h:Ljava/lang/Object;

    .line 271
    .line 272
    invoke-virtual {v4}, Lm/J0;->c()Lr1/a;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v0}, Lr1/a;->a()LB2/a;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const-class v3, Lj1/b;

    .line 281
    .line 282
    invoke-virtual {v2, v3}, LB2/a;->B(Ljava/lang/Class;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    check-cast v2, Lj1/b;

    .line 287
    .line 288
    const-class v3, Lj1/a;

    .line 289
    .line 290
    invoke-virtual {v0, v3}, LB2/a;->B(Ljava/lang/Class;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    check-cast v0, Lj1/a;

    .line 295
    .line 296
    new-instance v3, LS2/b;

    .line 297
    .line 298
    const/4 v4, 0x0

    .line 299
    invoke-virtual {p1, v1, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-direct {v3, v1, p1, v0, v2}, LS2/b;-><init>(Ljava/lang/String;Landroid/content/SharedPreferences;Lj1/a;Lj1/b;)V

    .line 304
    .line 305
    .line 306
    return-object v3

    .line 307
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 308
    .line 309
    const-string v0, "key URI must start with android-keystore://"

    .line 310
    .line 311
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    throw p1

    .line 315
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 316
    .line 317
    const-string v0, "key URI must start with android-keystore://"

    .line 318
    .line 319
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    throw p1

    .line 323
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 324
    .line 325
    const-string v0, "need an Android context"

    .line 326
    .line 327
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    throw p1

    .line 331
    :catchall_0
    move-exception p1

    .line 332
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 333
    throw p1

    .line 334
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 335
    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    const-string v2, "invalid padding mode, want NoPadding got "

    .line 339
    .line 340
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getEncryptionPaddings()[Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    throw p1

    .line 362
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 363
    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    const-string v2, "invalid purposes mode, want PURPOSE_ENCRYPT | PURPOSE_DECRYPT got "

    .line 367
    .line 368
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getPurposes()I

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    throw p1

    .line 386
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 387
    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    const-string v2, "invalid block mode, want GCM got "

    .line 391
    .line 392
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getBlockModes()[Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    throw p1

    .line 414
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 415
    .line 416
    new-instance v0, Ljava/lang/StringBuilder;

    .line 417
    .line 418
    const-string v2, "invalid key size, want 256 bits got "

    .line 419
    .line 420
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec;->getKeySize()I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    const-string v1, " bits"

    .line 431
    .line 432
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    throw p1

    .line 443
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 444
    .line 445
    const-string v0, "build() called before setKeyGenParameterSpec or setKeyScheme."

    .line 446
    .line 447
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    throw p1

    .line 451
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 452
    .line 453
    new-instance v0, Ljava/lang/StringBuilder;

    .line 454
    .line 455
    const-string v2, "KeyGenParamSpec\'s key alias does not match provided alias (_androidx_security_master_key_ vs "

    .line 456
    .line 457
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 458
    .line 459
    .line 460
    invoke-static {v1}, LS2/c;->a(Landroid/security/keystore/KeyGenParameterSpec;)Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    throw p1
.end method

.method public final i(Landroid/content/SharedPreferences;LQ2/i;)V
    .locals 8

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "FlutterSecureStorage"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, LD0/d;

    .line 6
    .line 7
    iget-object v3, p0, LQ2/d;->a:LQ2/e;

    .line 8
    .line 9
    iget-object v4, v3, LQ2/e;->i:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, v3, LQ2/e;->j:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v2, p1, v4, v5, v3}, LD0/d;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;LQ2/e;)V

    .line 14
    .line 15
    .line 16
    iput-object v2, p0, LQ2/d;->e:LD0/d;

    .line 17
    .line 18
    invoke-virtual {v2}, LD0/d;->g()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    const-string v0, "Algorithm changed detected."

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    const-string v0, "Algorithm changed detected"

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, v3, v0}, LQ2/d;->f(Landroid/content/SharedPreferences;LQ2/i;Ljava/security/GeneralSecurityException;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :catch_1
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :catch_2
    move-exception v0

    .line 41
    goto :goto_3

    .line 42
    :catch_3
    move-exception v0

    .line 43
    goto :goto_4

    .line 44
    :catch_4
    move-exception v0

    .line 45
    goto :goto_5

    .line 46
    :cond_0
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 47
    .line 48
    iget-object v4, v2, LD0/d;->h:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v4, LR2/b;

    .line 51
    .line 52
    iget-object v4, v4, LR2/b;->e:LA1/h;

    .line 53
    .line 54
    iget-object v2, v2, LD0/d;->j:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v2, LQ2/e;

    .line 57
    .line 58
    invoke-virtual {v4, v0, v2}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {v2, v0}, LR2/a;->g(Landroid/content/Context;)Ljavax/crypto/Cipher;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v4, p0, LQ2/d;->a:LQ2/e;

    .line 67
    .line 68
    iget-boolean v4, v4, LQ2/e;->f:Z

    .line 69
    .line 70
    invoke-virtual {p0}, LQ2/d;->j()Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 77
    .line 78
    const/16 v7, 0x1c

    .line 79
    .line 80
    if-lt v6, v7, :cond_2

    .line 81
    .line 82
    if-nez v4, :cond_1

    .line 83
    .line 84
    if-nez v5, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    new-instance v0, LA/c;

    .line 88
    .line 89
    const/16 v3, 0x11

    .line 90
    .line 91
    const/4 v4, 0x0

    .line 92
    invoke-direct {v0, p0, p2, v3, v4}, LA/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v2, v0}, LQ2/d;->b(Ljavax/crypto/Cipher;LQ2/i;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    :goto_0
    iget-object v4, p0, LQ2/d;->e:LD0/d;

    .line 100
    .line 101
    invoke-virtual {v4, v0, v2}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, LQ2/d;->d:LR2/e;

    .line 106
    .line 107
    invoke-interface {p2, v3}, LQ2/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :goto_1
    const-string v0, "Failed to initialize storage cipher"

    .line 112
    .line 113
    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    .line 115
    .line 116
    invoke-interface {p2, p1}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 117
    .line 118
    .line 119
    goto :goto_6

    .line 120
    :goto_2
    const-string v0, "Cryptographic algorithm not available on this device"

    .line 121
    .line 122
    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    .line 124
    .line 125
    new-instance v0, Ljava/lang/Exception;

    .line 126
    .line 127
    const-string v1, "Required cryptographic algorithm not supported by device."

    .line 128
    .line 129
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    invoke-interface {p2, v0}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 133
    .line 134
    .line 135
    goto :goto_6

    .line 136
    :goto_3
    const-string v1, "Illegal block size, wrong cipher configuration"

    .line 137
    .line 138
    invoke-virtual {p0, p1, p2, v0, v1}, LQ2/d;->f(Landroid/content/SharedPreferences;LQ2/i;Ljava/security/GeneralSecurityException;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_6

    .line 142
    :goto_4
    const-string v1, "Invalid key, key type incompatible with cipher"

    .line 143
    .line 144
    invoke-virtual {p0, p1, p2, v0, v1}, LQ2/d;->f(Landroid/content/SharedPreferences;LQ2/i;Ljava/security/GeneralSecurityException;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_6

    .line 148
    :goto_5
    const-string v1, "Bad padding, wrong key for cipher algorithm"

    .line 149
    .line 150
    invoke-virtual {p0, p1, p2, v0, v1}, LQ2/d;->f(Landroid/content/SharedPreferences;LQ2/i;Ljava/security/GeneralSecurityException;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :goto_6
    return-void
.end method

.method public final j()Z
    .locals 2

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "keyguard"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/KeyguardManager;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    return v0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method

.method public final k(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;ZZLV1/y;)V
    .locals 3

    .line 1
    const-string v0, "Starting biometric migration (authentication required)..."

    .line 2
    .line 3
    const-string v1, "FlutterSecureStorage"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "Migration direction: FROM biometric="

    .line 11
    .line 12
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, ", TO biometric="

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    if-eqz p3, :cond_0

    .line 34
    .line 35
    if-nez p4, :cond_0

    .line 36
    .line 37
    :try_start_0
    const-string p3, "You will be prompted to authenticate with your OLD biometric settings to decrypt existing data."

    .line 38
    .line 39
    invoke-static {v1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p5}, LQ2/d;->m(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :catch_0
    move-exception p1

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    if-nez p3, :cond_1

    .line 49
    .line 50
    if-eqz p4, :cond_1

    .line 51
    .line 52
    const-string p3, "You will be prompted to authenticate with your NEW biometric settings to encrypt data."

    .line 53
    .line 54
    invoke-static {v1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1, p2, p5}, LQ2/d;->n(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const-string p3, "You will be prompted to authenticate twice (once for decrypt, once for encrypt)."

    .line 62
    .line 63
    invoke-static {v1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1, p2, p5}, LQ2/d;->l(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :goto_0
    const-string p2, "Biometric migration failed"

    .line 71
    .line 72
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    .line 74
    .line 75
    new-instance p3, Ljava/lang/Exception;

    .line 76
    .line 77
    invoke-direct {p3, p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p5, p3}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final l(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    .locals 10

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "FlutterSecureStorage"

    .line 4
    .line 5
    :try_start_0
    const-string v2, "Step 1/7: Getting saved biometric cipher..."

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 11
    .line 12
    invoke-virtual {v2, v0}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2, v0}, LR2/a;->g(Landroid/content/Context;)Ljavax/crypto/Cipher;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    if-eqz v5, :cond_0

    .line 21
    .line 22
    const-string v0, "Authenticating with OLD biometric cipher to decrypt data..."

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    new-instance v3, LQ2/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    .line 29
    const/4 v9, 0x1

    .line 30
    move-object v4, p0

    .line 31
    move-object v7, p1

    .line 32
    move-object v6, p2

    .line 33
    move-object v8, p3

    .line 34
    :try_start_1
    invoke-direct/range {v3 .. v9}, LQ2/b;-><init>(LQ2/d;Ljavax/crypto/Cipher;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v5, v3}, LQ2/d;->b(Ljavax/crypto/Cipher;LQ2/i;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    :goto_0
    move-object p1, v0

    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception v0

    .line 45
    move-object v4, p0

    .line 46
    move-object v8, p3

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move-object v4, p0

    .line 49
    move-object v8, p3

    .line 50
    new-instance p1, Ljava/lang/Exception;

    .line 51
    .line 52
    const-string p2, "Failed to get saved biometric cipher"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    :goto_1
    const-string p2, "Failed to initialize biometric-to-biometric migration"

    .line 59
    .line 60
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {v8, p1}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final m(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    .locals 10

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "FlutterSecureStorage"

    .line 4
    .line 5
    :try_start_0
    const-string v2, "Step 1/6: Getting saved biometric cipher..."

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 11
    .line 12
    invoke-virtual {v2, v0}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2, v0}, LR2/a;->g(Landroid/content/Context;)Ljavax/crypto/Cipher;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    if-eqz v5, :cond_0

    .line 21
    .line 22
    const-string v0, "Authenticating with OLD biometric cipher to decrypt data..."

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    new-instance v3, LQ2/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    .line 29
    const/4 v9, 0x0

    .line 30
    move-object v4, p0

    .line 31
    move-object v7, p1

    .line 32
    move-object v6, p2

    .line 33
    move-object v8, p3

    .line 34
    :try_start_1
    invoke-direct/range {v3 .. v9}, LQ2/b;-><init>(LQ2/d;Ljavax/crypto/Cipher;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v5, v3}, LQ2/d;->b(Ljavax/crypto/Cipher;LQ2/i;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    :goto_0
    move-object p1, v0

    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception v0

    .line 45
    move-object v4, p0

    .line 46
    move-object v8, p3

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move-object v4, p0

    .line 49
    move-object v8, p3

    .line 50
    new-instance p1, Ljava/lang/Exception;

    .line 51
    .line 52
    const-string p2, "Failed to get saved biometric cipher"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    :goto_1
    const-string p2, "Failed to initialize biometric migration"

    .line 59
    .line 60
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {v8, p1}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final n(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    .locals 10

    .line 1
    iget-object v1, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v2, "FlutterSecureStorage"

    .line 4
    .line 5
    :try_start_0
    const-string v0, "Step 1/6: Decrypting all data with saved non-biometric cipher..."

    .line 6
    .line 7
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, LQ2/d;->e:LD0/d;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v0, v1, v3}, LD0/d;->f(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, p2, v0}, LQ2/d;->c(Landroid/content/SharedPreferences;LR2/e;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const-string v3, "Step 2/6: Deleting old RSA key from Android KeyStore..."

    .line 22
    .line 23
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, LQ2/d;->e:LD0/d;

    .line 27
    .line 28
    iget-object v4, v3, LD0/d;->f:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v4, LR2/b;

    .line 31
    .line 32
    iget-object v5, v3, LD0/d;->h:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v5, LR2/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 35
    .line 36
    if-eq v4, v5, :cond_0

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v4, 0x0

    .line 41
    :goto_0
    if-eqz v4, :cond_1

    .line 42
    .line 43
    :try_start_1
    invoke-virtual {v3, v1}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v3}, LR2/a;->l()V

    .line 48
    .line 49
    .line 50
    invoke-interface {v0, v1}, LR2/e;->c(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    const-string v0, "Old key deleted from KeyStore"

    .line 54
    .line 55
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    :try_start_2
    const-string v3, "Failed to delete old key from KeyStore (may not exist)"

    .line 61
    .line 62
    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catch_1
    move-exception v0

    .line 67
    move-object p1, v0

    .line 68
    move-object v4, p0

    .line 69
    move-object v8, p3

    .line 70
    goto :goto_3

    .line 71
    :cond_1
    :goto_1
    :try_start_3
    const-string v0, "Step 3/6: Updating algorithm markers to current..."

    .line 72
    .line 73
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, LQ2/d;->q(Landroid/content/SharedPreferences;)V

    .line 77
    .line 78
    .line 79
    const-string p1, "Step 4/6: Getting current biometric cipher..."

    .line 80
    .line 81
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, LQ2/d;->e:LD0/d;

    .line 85
    .line 86
    iget-object v0, p1, LD0/d;->h:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v0, LR2/b;

    .line 89
    .line 90
    iget-object v0, v0, LR2/b;->e:LA1/h;

    .line 91
    .line 92
    iget-object p1, p1, LD0/d;->j:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast p1, LQ2/e;

    .line 95
    .line 96
    invoke-virtual {v0, v1, p1}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-interface {p1, v1}, LR2/a;->g(Landroid/content/Context;)Ljavax/crypto/Cipher;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    if-eqz v5, :cond_2

    .line 105
    .line 106
    const-string p1, "Authenticating with NEW biometric cipher to encrypt data..."

    .line 107
    .line 108
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    new-instance v3, LD0/d;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 112
    .line 113
    const/4 v9, 0x2

    .line 114
    move-object v4, p0

    .line 115
    move-object v7, p2

    .line 116
    move-object v8, p3

    .line 117
    :try_start_4
    invoke-direct/range {v3 .. v9}, LD0/d;-><init>(LQ2/d;Ljava/lang/Object;Ljava/lang/Object;Landroid/content/SharedPreferences;LQ2/i;I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v5, v3}, LQ2/d;->b(Ljavax/crypto/Cipher;LQ2/i;)V

    .line 121
    .line 122
    .line 123
    goto :goto_4

    .line 124
    :catch_2
    move-exception v0

    .line 125
    :goto_2
    move-object p1, v0

    .line 126
    goto :goto_3

    .line 127
    :catch_3
    move-exception v0

    .line 128
    move-object v4, p0

    .line 129
    move-object v8, p3

    .line 130
    goto :goto_2

    .line 131
    :cond_2
    move-object v4, p0

    .line 132
    move-object v8, p3

    .line 133
    new-instance p1, Ljava/lang/Exception;

    .line 134
    .line 135
    const-string p2, "Failed to get current biometric cipher"

    .line 136
    .line 137
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 141
    :goto_3
    const-string p2, "Failed to initialize biometric migration"

    .line 142
    .line 143
    invoke-static {v2, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 144
    .line 145
    .line 146
    invoke-virtual {v8, p1}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 147
    .line 148
    .line 149
    :goto_4
    return-void
.end method

.method public final o(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;LV1/y;)V
    .locals 9

    .line 1
    iget-object v0, p0, LQ2/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "Non-biometric migration completed successfully! Migrated "

    .line 4
    .line 5
    const-string v2, "Starting non-biometric migration (no authentication required)..."

    .line 6
    .line 7
    const-string v3, "FlutterSecureStorage"

    .line 8
    .line 9
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :try_start_0
    const-string v2, "Step 1/6: Initializing saved cipher..."

    .line 13
    .line 14
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, LQ2/d;->e:LD0/d;

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v2, v0, v4}, LD0/d;->f(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v5, "Step 2/6: Decrypting all data with saved cipher..."

    .line 25
    .line 26
    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2, v2}, LQ2/d;->c(Landroid/content/SharedPreferences;LR2/e;)Ljava/util/HashMap;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "Step 3/6: Deleting old RSA key from Android KeyStore..."

    .line 34
    .line 35
    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object v6, p0, LQ2/d;->e:LD0/d;

    .line 39
    .line 40
    iget-object v7, v6, LD0/d;->f:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v7, LR2/b;

    .line 43
    .line 44
    iget-object v8, v6, LD0/d;->h:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v8, LR2/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 47
    .line 48
    if-eq v7, v8, :cond_0

    .line 49
    .line 50
    const/4 v7, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v7, 0x0

    .line 53
    :goto_0
    if-eqz v7, :cond_1

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {v6, v0}, LD0/d;->e(Landroid/content/Context;)LR2/a;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-interface {v6}, LR2/a;->l()V

    .line 60
    .line 61
    .line 62
    invoke-interface {v2, v0}, LR2/e;->c(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    const-string v2, "Old key deleted from KeyStore"

    .line 66
    .line 67
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catch_0
    move-exception v2

    .line 72
    :try_start_2
    const-string v6, "Failed to delete old key from KeyStore (may not exist)"

    .line 73
    .line 74
    invoke-static {v3, v6, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catch_1
    move-exception p1

    .line 79
    goto :goto_3

    .line 80
    :cond_1
    :goto_1
    const-string v2, "Step 4/6: Updating algorithm markers to current..."

    .line 81
    .line 82
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, LQ2/d;->q(Landroid/content/SharedPreferences;)V

    .line 86
    .line 87
    .line 88
    const-string p1, "Step 5/6: Initializing current cipher with fresh AES key..."

    .line 89
    .line 90
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, LQ2/d;->e:LD0/d;

    .line 94
    .line 95
    invoke-virtual {p1, v0, v4}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    const-string p2, "Step 6/6: No data to migrate, continuing..."

    .line 106
    .line 107
    invoke-static {v3, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_2
    const-string v0, "Step 6/6: Encrypting all data with current cipher..."

    .line 112
    .line 113
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    invoke-static {v5, p2, p1}, LQ2/d;->e(Ljava/util/HashMap;Landroid/content/SharedPreferences;LR2/e;)V

    .line 117
    .line 118
    .line 119
    :goto_2
    iput-object p1, p0, LQ2/d;->d:LR2/e;

    .line 120
    .line 121
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p2, " items."

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    invoke-virtual {p3, v4}, LV1/y;->b(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :goto_3
    const-string p2, "Non-biometric migration failed"

    .line 150
    .line 151
    invoke-static {v3, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    .line 153
    .line 154
    new-instance v0, Ljava/lang/Exception;

    .line 155
    .line 156
    invoke-direct {v0, p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p3, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 160
    .line 161
    .line 162
    :goto_4
    return-void
.end method

.method public final p()Ljava/util/HashMap;
    .locals 6

    .line 1
    iget-object v0, p0, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/util/Map$Entry;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Ljava/lang/String;

    .line 37
    .line 38
    iget-object v4, p0, LQ2/d;->a:LQ2/e;

    .line 39
    .line 40
    iget-object v4, v4, LQ2/e;->b:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ljava/lang/String;

    .line 53
    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v5, p0, LQ2/d;->a:LQ2/e;

    .line 60
    .line 61
    iget-object v5, v5, LQ2/e;->b:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const/16 v5, 0x5f

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v5, ""

    .line 76
    .line 77
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iget-object v4, p0, LQ2/d;->a:LQ2/e;

    .line 82
    .line 83
    iget-boolean v5, v4, LQ2/e;->e:Z

    .line 84
    .line 85
    if-eqz v5, :cond_1

    .line 86
    .line 87
    iget-boolean v4, v4, LQ2/e;->d:Z

    .line 88
    .line 89
    if-nez v4, :cond_1

    .line 90
    .line 91
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Ljava/lang/String;

    .line 106
    .line 107
    if-nez v2, :cond_2

    .line 108
    .line 109
    const/4 v2, 0x0

    .line 110
    goto :goto_1

    .line 111
    :cond_2
    const/4 v4, 0x0

    .line 112
    invoke-static {v2, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v4, p0, LQ2/d;->d:LR2/e;

    .line 117
    .line 118
    invoke-interface {v4, v2}, LR2/e;->d([B)[B

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    new-instance v4, Ljava/lang/String;

    .line 123
    .line 124
    sget-object v5, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 125
    .line 126
    invoke-direct {v4, v2, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 127
    .line 128
    .line 129
    move-object v2, v4

    .line 130
    :goto_1
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_3
    return-object v1
.end method

.method public final q(Landroid/content/SharedPreferences;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, LQ2/d;->e:LD0/d;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, LD0/d;->i(Landroid/content/SharedPreferences$Editor;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 11
    .line 12
    .line 13
    const-string p1, "FlutterSecureStorage"

    .line 14
    .line 15
    const-string v0, "Algorithm markers updated to current"

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final r(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LQ2/d;->a:LQ2/e;

    .line 8
    .line 9
    iget-boolean v2, v1, LQ2/e;->e:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-boolean v1, v1, LQ2/e;->d:Z

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v1, p0, LQ2/d;->d:LR2/e;

    .line 22
    .line 23
    sget-object v2, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-interface {v1, p2}, LR2/e;->a([B)[B

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {p2, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
