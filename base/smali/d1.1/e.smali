.class public abstract Ld1/e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/content/Context;

.field public static volatile b:Ld1/f;

.field public static final c:Ljava/util/concurrent/ConcurrentLinkedQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ld1/e;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/content/Context;I)Ld1/f;
    .locals 4

    .line 1
    invoke-static {p0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, LE1/j;->p(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "preferredRenderer: "

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "e"

    .line 15
    .line 16
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    sget-object v0, Ld1/e;->b:Ld1/f;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    sget v0, LK0/g;->c:I

    .line 26
    .line 27
    const v0, 0xcc77c0

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, LK0/g;->a(Landroid/content/Context;I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-static {p0, p1}, Ld1/e;->c(Landroid/content/Context;I)Ld1/f;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Ld1/e;->b:Ld1/f;

    .line 41
    .line 42
    :try_start_0
    sget-object v0, Ld1/e;->b:Ld1/f;

    .line 43
    .line 44
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/16 v3, 0x9

    .line 49
    .line 50
    invoke-virtual {v0, v2, v3}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_4

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v3, 0x2

    .line 66
    if-ne v2, v3, :cond_1

    .line 67
    .line 68
    const-string v2, "com.google.android.apps.photos"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    const-string v0, "early loading native code"

    .line 77
    .line 78
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    :try_start_1
    sget-object v0, Ld1/e;->b:Ld1/f;

    .line 82
    .line 83
    invoke-static {p0, p1}, Ld1/e;->b(Landroid/content/Context;I)Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    new-instance v3, LU0/b;

    .line 88
    .line 89
    invoke-direct {v3, v2}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v2, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 97
    .line 98
    .line 99
    const/16 v3, 0xb

    .line 100
    .line 101
    invoke-virtual {v0, v2, v3}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :catch_0
    move-exception p0

    .line 106
    new-instance p1, Le1/x;

    .line 107
    .line 108
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    throw p1

    .line 112
    :catch_1
    const-string v0, "Caught UnsatisfiedLinkError attempting to load the LATEST renderer\'s native library. Attempting to use the LEGACY renderer instead."

    .line 113
    .line 114
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    const/4 v0, 0x0

    .line 118
    sput-object v0, Ld1/e;->a:Landroid/content/Context;

    .line 119
    .line 120
    const/4 v0, 0x1

    .line 121
    invoke-static {p0, v0}, Ld1/e;->c(Landroid/content/Context;I)Ld1/f;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sput-object v0, Ld1/e;->b:Ld1/f;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_1
    const-string v0, "not early loading native code"

    .line 129
    .line 130
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    :goto_0
    :try_start_2
    sget-object v0, Ld1/e;->b:Ld1/f;

    .line 134
    .line 135
    invoke-static {p0, p1}, Ld1/e;->b(Landroid/content/Context;I)Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    new-instance p1, LU0/b;

    .line 144
    .line 145
    invoke-direct {p1, p0}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-static {p0, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 153
    .line 154
    .line 155
    const p1, 0x1312d00

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 159
    .line 160
    .line 161
    const/4 p1, 0x6

    .line 162
    invoke-virtual {v0, p0, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_3

    .line 163
    .line 164
    .line 165
    :goto_1
    sget-object p0, Ld1/e;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_2

    .line 172
    .line 173
    :try_start_3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    check-cast p0, Lc1/k;

    .line 178
    .line 179
    invoke-static {p0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    sget-object p1, Ld1/e;->b:Ld1/f;

    .line 183
    .line 184
    iget-object p0, p0, Lc1/k;->a:Landroid/content/Context;

    .line 185
    .line 186
    new-instance v0, LU0/b;

    .line 187
    .line 188
    invoke-direct {v0, p0}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    const-string p0, "gmp_git_androidmapsutils_v4.1.0"

    .line 192
    .line 193
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {v1, v0}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    const/16 p0, 0xc

    .line 204
    .line 205
    invoke-virtual {p1, v1, p0}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :catch_2
    move-exception p0

    .line 210
    new-instance p1, Le1/x;

    .line 211
    .line 212
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    throw p1

    .line 216
    :cond_2
    :goto_2
    sget-object p0, Ld1/e;->b:Ld1/f;

    .line 217
    .line 218
    return-object p0

    .line 219
    :catch_3
    move-exception p0

    .line 220
    new-instance p1, Le1/x;

    .line 221
    .line 222
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 223
    .line 224
    .line 225
    throw p1

    .line 226
    :catch_4
    move-exception p0

    .line 227
    new-instance p1, Le1/x;

    .line 228
    .line 229
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    throw p1

    .line 233
    :cond_3
    new-instance p0, LK0/f;

    .line 234
    .line 235
    invoke-direct {p0, v0}, LK0/f;-><init>(I)V

    .line 236
    .line 237
    .line 238
    throw p0
.end method

.method public static b(Landroid/content/Context;I)Landroid/content/Context;
    .locals 7

    .line 1
    sget-object v0, Ld1/e;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const-string p1, "com.google.android.gms.maps_legacy_dynamite"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p1, "com.google.android.gms.maps_core_dynamite"

    .line 12
    .line 13
    :goto_0
    :try_start_0
    sget-object v0, LV0/e;->b:LN0/f;

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, LV0/e;->a(Landroid/content/Context;LN0/f;Ljava/lang/String;)LV0/e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, v0, LV0/e;->a:Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :catch_0
    move-exception v0

    .line 23
    const-string v1, "com.google.android.gms.maps_dynamite"

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x3

    .line 31
    const-string v4, "com.google.android.gms"

    .line 32
    .line 33
    const-string v5, "Failed to load maps module, use pre-Chimera"

    .line 34
    .line 35
    const-string v6, "e"

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    :try_start_1
    const-string p1, "Attempting to load maps_dynamite again."

    .line 40
    .line 41
    invoke-static {v6, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    sget-object p1, LV0/e;->b:LN0/f;

    .line 45
    .line 46
    invoke-static {p0, p1, v1}, LV0/e;->a(Landroid/content/Context;LN0/f;Ljava/lang/String;)LV0/e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p0, p1, LV0/e;->a:Landroid/content/Context;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :catch_1
    move-exception p1

    .line 54
    invoke-static {v6, v5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .line 56
    .line 57
    sget p1, LK0/g;->c:I

    .line 58
    .line 59
    :try_start_2
    invoke-virtual {p0, v4, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 63
    goto :goto_1

    .line 64
    :catch_2
    move-object p0, v2

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-static {v6, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    .line 68
    .line 69
    sget p1, LK0/g;->c:I

    .line 70
    .line 71
    :try_start_3
    invoke-virtual {p0, v4, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p0
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    .line 75
    :goto_1
    sput-object p0, Ld1/e;->a:Landroid/content/Context;

    .line 76
    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    .line 81
    .line 82
    const-string p1, "Unable to load maps module, maps container context is null"

    .line 83
    .line 84
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0

    .line 88
    :cond_3
    return-object v0
.end method

.method public static c(Landroid/content/Context;I)Ld1/f;
    .locals 2

    .line 1
    const-string v0, "e"

    .line 2
    .line 3
    const-string v1, "Making Creator dynamically"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ld1/e;->b(Landroid/content/Context;I)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "com.google.android.gms.maps.internal.CreatorImpl"

    .line 17
    .line 18
    :try_start_0
    invoke-static {p0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 25
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 29
    check-cast p0, Landroid/os/IBinder;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const-string p1, "com.google.android.gms.maps.internal.ICreator"

    .line 34
    .line 35
    invoke-interface {p0, p1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    instance-of v1, v0, Ld1/f;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    check-cast v0, Ld1/f;

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_0
    new-instance v0, Ld1/f;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-direct {v0, p0, p1, v1}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 54
    .line 55
    const-string p1, "Unable to load maps module, IBinder for com.google.android.gms.maps.internal.CreatorImpl is null"

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p0

    .line 61
    :catch_0
    move-exception p1

    .line 62
    :try_start_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string v1, "Unable to call the default constructor of "

    .line 69
    .line 70
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-direct {v0, p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw v0

    .line 78
    :catch_1
    move-exception p1

    .line 79
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v1, "Unable to instantiate the dynamic class "

    .line 86
    .line 87
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-direct {v0, p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    throw v0
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 95
    :catch_2
    move-exception p0

    .line 96
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 97
    .line 98
    const-string v0, "Unable to find dynamic class com.google.android.gms.maps.internal.CreatorImpl"

    .line 99
    .line 100
    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    throw p1
.end method
