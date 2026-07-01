.class public abstract Lp1/e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lx1/u0;->CONFIG_NAME_FIELD_NUMBER:I

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lp1/e;->a()V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    throw v1
.end method

.method public static a()V
    .locals 4

    .line 1
    sget-object v0, Ls1/q;->b:Ls1/q;

    .line 2
    .line 3
    sget-object v1, Lp1/h;->a:Lp1/h;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ls1/q;->c(Ls1/F;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lp1/h;->b:Ls1/B;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ls1/q;->b(Ls1/B;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lo1/a;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v1, Lp1/b;->a:Ls1/B;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v1}, LE1/j;->e(I)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object v1, Lq1/a;->a:Ls1/w;

    .line 30
    .line 31
    sget-object v1, Ls1/s;->b:Ls1/s;

    .line 32
    .line 33
    sget-object v2, Lq1/a;->a:Ls1/w;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ls1/s;->f(Ls1/w;)V

    .line 36
    .line 37
    .line 38
    sget-object v2, Lq1/a;->b:Ls1/u;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ls1/s;->e(Ls1/u;)V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lq1/a;->c:Ls1/e;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ls1/s;->d(Ls1/e;)V

    .line 46
    .line 47
    .line 48
    sget-object v2, Lq1/a;->d:Ls1/c;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ls1/s;->c(Ls1/c;)V

    .line 51
    .line 52
    .line 53
    sget-object v1, Lp1/b;->a:Ls1/B;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ls1/q;->b(Ls1/B;)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Ls1/p;->b:Ls1/p;

    .line 59
    .line 60
    new-instance v1, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v2, "AES256_SIV"

    .line 66
    .line 67
    sget-object v3, Lp1/i;->a:Lp1/d;

    .line 68
    .line 69
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lp1/d;->b()LZ2/s;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const/16 v3, 0x40

    .line 77
    .line 78
    invoke-virtual {v2, v3}, LZ2/s;->C(I)V

    .line 79
    .line 80
    .line 81
    sget-object v3, Lp1/c;->d:Lp1/c;

    .line 82
    .line 83
    iput-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 84
    .line 85
    invoke-virtual {v2}, LZ2/s;->v()Lp1/d;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const-string v3, "AES256_SIV_RAW"

    .line 90
    .line 91
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Ls1/p;->b(Ljava/util/Map;)V

    .line 99
    .line 100
    .line 101
    sget-object v0, Ls1/m;->b:Ls1/m;

    .line 102
    .line 103
    sget-object v1, Lp1/b;->c:Lk1/h;

    .line 104
    .line 105
    const-class v2, Lp1/d;

    .line 106
    .line 107
    invoke-virtual {v0, v1, v2}, Ls1/m;->a(Lk1/h;Ljava/lang/Class;)V

    .line 108
    .line 109
    .line 110
    sget-object v0, Ls1/l;->b:Ls1/l;

    .line 111
    .line 112
    sget-object v1, Lp1/b;->d:Lk1/i;

    .line 113
    .line 114
    invoke-virtual {v0, v1, v2}, Ls1/l;->a(Lk1/i;Ljava/lang/Class;)V

    .line 115
    .line 116
    .line 117
    sget-object v0, Ls1/b;->d:Ls1/b;

    .line 118
    .line 119
    sget-object v1, Lp1/b;->b:Ls1/g;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ls1/b;->d(Ls1/g;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 126
    .line 127
    const-string v1, "Registering AES SIV is not supported in FIPS mode"

    .line 128
    .line 129
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0
.end method
