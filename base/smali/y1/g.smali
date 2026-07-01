.class public final Ly1/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly1/h;


# instance fields
.field public final synthetic e:I

.field public final f:Ly1/j;


# direct methods
.method public synthetic constructor <init>(Ly1/j;I)V
    .locals 0

    .line 1
    iput p2, p0, Ly1/g;->e:I

    iput-object p1, p0, Ly1/g;->f:Ly1/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Ly1/g;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "AndroidOpenSSL"

    .line 7
    .line 8
    const-string v1, "Conscrypt"

    .line 9
    .line 10
    const-string v2, "GmsCore_OpenSSL"

    .line 11
    .line 12
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    move v3, v2

    .line 23
    :goto_0
    const/4 v4, 0x3

    .line 24
    if-ge v3, v4, :cond_1

    .line 25
    .line 26
    aget-object v4, v0, v3

    .line 27
    .line 28
    invoke-static {v4}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v3, 0x0

    .line 45
    :cond_2
    :goto_1
    if-ge v2, v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    check-cast v4, Ljava/security/Provider;

    .line 54
    .line 55
    :try_start_0
    iget-object v5, p0, Ly1/g;->f:Ly1/j;

    .line 56
    .line 57
    invoke-interface {v5, p1, v4}, Ly1/j;->a(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    return-object p1

    .line 62
    :catch_0
    move-exception v4

    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    move-object v3, v4

    .line 66
    goto :goto_1

    .line 67
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 68
    .line 69
    const-string v0, "No good Provider found."

    .line 70
    .line 71
    invoke-direct {p1, v0, v3}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    throw p1

    .line 75
    :pswitch_0
    const-string v0, "GmsCore_OpenSSL"

    .line 76
    .line 77
    const-string v1, "AndroidOpenSSL"

    .line 78
    .line 79
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    const/4 v2, 0x0

    .line 89
    move v3, v2

    .line 90
    :goto_2
    const/4 v4, 0x2

    .line 91
    if-ge v3, v4, :cond_5

    .line 92
    .line 93
    aget-object v4, v0, v3

    .line 94
    .line 95
    invoke-static {v4}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    if-eqz v4, :cond_4

    .line 100
    .line 101
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    const/4 v3, 0x0

    .line 112
    move-object v4, v3

    .line 113
    :cond_6
    :goto_3
    iget-object v5, p0, Ly1/g;->f:Ly1/j;

    .line 114
    .line 115
    if-ge v2, v0, :cond_7

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    add-int/lit8 v2, v2, 0x1

    .line 122
    .line 123
    check-cast v6, Ljava/security/Provider;

    .line 124
    .line 125
    :try_start_1
    invoke-interface {v5, p1, v6}, Ly1/j;->a(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 129
    goto :goto_4

    .line 130
    :catch_1
    move-exception v5

    .line 131
    if-nez v4, :cond_6

    .line 132
    .line 133
    move-object v4, v5

    .line 134
    goto :goto_3

    .line 135
    :cond_7
    invoke-interface {v5, p1, v3}, Ly1/j;->a(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    :goto_4
    return-object p1

    .line 140
    nop

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
