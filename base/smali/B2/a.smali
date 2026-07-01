.class public final LB2/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA0/b;
.implements Li1/c;
.implements LQ2/i;
.implements LR2/e;
.implements Lk3/m;
.implements Lk3/d;


# static fields
.field public static i:LB2/a;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x17

    iput v0, p0, LB2/a;->e:I

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LB2/a;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LA0/c;)V
    .locals 1

    const/16 v0, 0x1d

    iput v0, p0, LB2/a;->e:I

    .line 68
    sget-object v0, Lk3/v;->a:Lk3/v;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 71
    const-string p1, "dexterous.com/flutter/local_notifications/actions"

    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 72
    iput-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LB2/a;LZ2/s;)V
    .locals 1

    const/16 v0, 0x1c

    iput v0, p0, LB2/a;->e:I

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 113
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 114
    iput-object p2, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LE/i;)V
    .locals 1

    const/16 v0, 0xe

    iput v0, p0, LB2/a;->e:I

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 75
    new-instance p1, LX/b;

    invoke-direct {p1}, LX/b;-><init>()V

    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 76
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LN0/f;)V
    .locals 1

    const/16 p1, 0xd

    iput p1, p0, LB2/a;->e:I

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance p1, LA/l;

    const/16 v0, 0x1e

    invoke-direct {p1, v0}, LA/l;-><init>(I)V

    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 83
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 84
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 85
    new-instance p1, LK0/h;

    const/16 v0, 0xa

    invoke-direct {p1, v0, p0}, LK0/h;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(LQ2/b;Ljavax/crypto/Cipher;Ljava/util/HashMap;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, LB2/a;->e:I

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    iput-object p2, p0, LB2/a;->f:Ljava/lang/Object;

    iput-object p3, p0, LB2/a;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LV1/y;LN1/e;LN/d;Ljava/util/Set;)V
    .locals 7

    const/4 v0, 0x6

    iput v0, p0, LB2/a;->e:I

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 103
    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 104
    iput-object p3, p0, LB2/a;->h:Ljava/lang/Object;

    .line 105
    invoke-interface {p4}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_1

    .line 106
    :cond_0
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [I

    .line 107
    new-instance v1, Ljava/lang/String;

    const/4 p3, 0x0

    array-length p4, p2

    invoke-direct {v1, p2, p3, p4}, Ljava/lang/String;-><init>([III)V

    .line 108
    new-instance v6, LA0/c;

    const/16 p2, 0xb

    invoke-direct {v6, p2, v1}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 109
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v2, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, LB2/a;->O(Ljava/lang/CharSequence;IIIZLN/o;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public constructor <init>(LZ2/y;)V
    .locals 4

    const/16 v0, 0x11

    iput v0, p0, LB2/a;->e:I

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 95
    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 96
    new-instance v0, LZ2/w;

    .line 97
    check-cast p1, LZ2/p;

    invoke-virtual {p1}, LZ2/p;->getBinaryMessenger()Lk3/f;

    move-result-object v1

    invoke-direct {v0, v1}, LZ2/w;-><init>(Lk3/f;)V

    new-instance v1, LZ2/s;

    new-instance v2, Lio/flutter/plugin/editing/j;

    .line 98
    invoke-virtual {p1}, LZ2/p;->getBinaryMessenger()Lk3/f;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/flutter/plugin/editing/j;-><init>(Lk3/f;)V

    invoke-direct {v1, v2}, LZ2/s;-><init>(Lio/flutter/plugin/editing/j;)V

    const/4 v2, 0x2

    new-array v2, v2, [LZ2/x;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    iput-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 99
    new-instance v0, LE/i;

    invoke-virtual {p1}, LZ2/p;->getBinaryMessenger()Lk3/f;

    move-result-object p1

    invoke-direct {v0, p1}, LE/i;-><init>(Lk3/f;)V

    .line 100
    iput-object p0, v0, LE/i;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljavax/crypto/Cipher;)V
    .locals 6

    const/16 v0, 0xb

    iput v0, p0, LB2/a;->e:I

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 18
    const-string v1, "AES/GCM/NoPadding"

    if-eqz p2, :cond_0

    goto :goto_0

    .line 19
    :cond_0
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p2

    .line 20
    :goto_0
    const-string v2, "FlutterSecureKeyStorage"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v2, 0x0

    .line 21
    const-string v4, "BVGhpcyBpcyB0aGUga2V5IGZvciBhIHNlY3VyZSBzdG9yYWdlIEFFUyBLZXkK"

    invoke-interface {p1, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 22
    const-string v5, "AES"

    if-eqz v2, :cond_1

    .line 23
    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    .line 24
    invoke-virtual {p2, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    .line 25
    new-instance p2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {p2, p1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    goto :goto_1

    :cond_1
    const/16 v2, 0x20

    .line 26
    new-array v2, v2, [B

    .line 27
    invoke-virtual {v0, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 28
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v0, v2, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 29
    invoke-virtual {p2, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p2

    .line 30
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 31
    invoke-static {p2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v4, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 32
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    move-object p2, v0

    .line 33
    :goto_1
    iput-object p2, p0, LB2/a;->h:Ljava/lang/Object;

    .line 34
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p1

    .line 35
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lb3/b;Lio/flutter/embedding/engine/FlutterJNI;)V
    .locals 5

    const/16 v0, 0x16

    iput v0, p0, LB2/a;->e:I

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, LE/i;

    const/16 v1, 0x1a

    invoke-direct {v0, v1, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 88
    new-instance v1, LV1/y;

    sget-object v2, Lk3/u;->a:Lk3/u;

    const/4 v3, 0x0

    .line 89
    const-string v4, "flutter/accessibility"

    invoke-direct {v1, p1, v4, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 90
    iput-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 91
    invoke-virtual {v1, v0}, LV1/y;->A(Lk3/b;)V

    .line 92
    iput-object p2, p0, LB2/a;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lc1/f;Ld1/h;)V
    .locals 1

    const/16 v0, 0x14

    iput v0, p0, LB2/a;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, LB2/a;->g:Ljava/lang/Object;

    .line 4
    invoke-static {p1}, LN0/n;->e(Ljava/lang/Object;)V

    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/messaging/FirebaseMessagingService;LE/i;Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    const/16 v0, 0xc

    iput v0, p0, LB2/a;->e:I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p3, p0, LB2/a;->f:Ljava/lang/Object;

    .line 79
    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 80
    iput-object p2, p0, LB2/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld1/g;)V
    .locals 1

    const/16 v0, 0x13

    iput v0, p0, LB2/a;->e:I

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    invoke-static {p1}, LN0/n;->e(Ljava/lang/Object;)V

    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lj3/b;)V
    .locals 1

    const/16 v0, 0x18

    iput v0, p0, LB2/a;->e:I

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 117
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 118
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 2
    iput p4, p0, LB2/a;->e:I

    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    iput-object p2, p0, LB2/a;->g:Ljava/lang/Object;

    iput-object p3, p0, LB2/a;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ls1/k;)V
    .locals 4

    const/16 v0, 0x15

    iput v0, p0, LB2/a;->e:I

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 121
    iput-object p2, p0, LB2/a;->g:Ljava/lang/Object;

    .line 122
    sget-object p2, Ln1/a;->a:Lj3/b;

    .line 123
    iget-object p2, p2, Lj3/b;->f:Ljava/lang/Object;

    check-cast p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 124
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 125
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 126
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj1/f;

    .line 127
    iget v2, v1, Lj1/f;->d:I

    .line 128
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 129
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 130
    iget-boolean v1, v1, Lj1/f;->e:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 131
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "KeyID "

    .line 132
    const-string v0, " is duplicated in the keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing."

    .line 133
    invoke-static {v2, p2, v0}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 134
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    if-eqz v0, :cond_3

    goto :goto_1

    .line 135
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Primary key id not found in keyset, and Tink is configured to reject such keysets with the flag validateKeysetsOnParsing."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    :goto_1
    const/4 p1, 0x0

    .line 136
    iput-object p1, p0, LB2/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    const/16 p2, 0x8

    iput p2, p0, LB2/a;->e:I

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    sget-object p1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    .line 9
    :goto_0
    sget-object p2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object p3, p0, LB2/a;->g:Ljava/lang/Object;

    sget-object p3, Lf1/a;->a:Lf1/a;

    iput-object p3, p0, LB2/a;->h:Ljava/lang/Object;

    new-instance p3, Ljava/util/HashSet;

    .line 10
    invoke-direct {p3, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 11
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_1

    .line 12
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    return-void

    .line 13
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    new-instance p1, Ljava/lang/ClassCastException;

    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    throw p1
.end method

.method public constructor <init>(Lx2/a;)V
    .locals 2

    const/4 v0, 0x3

    iput v0, p0, LB2/a;->e:I

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, LB2/e;

    const/4 v1, 0x2

    .line 62
    invoke-direct {v0, v1}, LB2/e;-><init>(I)V

    const/4 v1, 0x0

    .line 63
    iput v1, v0, LB2/e;->b:I

    const/4 v1, 0x1

    .line 64
    iput v1, v0, LB2/e;->c:I

    .line 65
    iput-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 67
    iput-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx2/b;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    iput v2, v0, LB2/a;->e:I

    .line 36
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 37
    iget v3, v1, Lx2/b;->f:I

    const/16 v4, 0x8

    if-lt v3, v4, :cond_9

    const/16 v4, 0x90

    if-gt v3, v4, :cond_9

    and-int/lit8 v4, v3, 0x1

    if-nez v4, :cond_9

    .line 38
    iget v5, v1, Lx2/b;->e:I

    .line 39
    sget-object v6, LB2/f;->h:[LB2/f;

    if-nez v4, :cond_8

    and-int/lit8 v4, v5, 0x1

    if-nez v4, :cond_8

    .line 40
    sget-object v4, LB2/f;->h:[LB2/f;

    move v6, v2

    :goto_0
    const/16 v7, 0x30

    if-ge v6, v7, :cond_7

    aget-object v7, v4, v6

    .line 41
    iget v8, v7, LB2/f;->b:I

    if-ne v8, v3, :cond_6

    iget v9, v7, LB2/f;->c:I

    if-ne v9, v5, :cond_6

    .line 42
    iput-object v7, v0, LB2/a;->h:Ljava/lang/Object;

    .line 43
    iget v3, v1, Lx2/b;->f:I

    if-ne v3, v8, :cond_5

    .line 44
    iget v3, v7, LB2/f;->d:I

    .line 45
    iget v4, v7, LB2/f;->e:I

    .line 46
    div-int/2addr v8, v3

    .line 47
    div-int/2addr v9, v4

    mul-int v5, v8, v3

    mul-int v6, v9, v4

    .line 48
    new-instance v7, Lx2/b;

    invoke-direct {v7, v6, v5}, Lx2/b;-><init>(II)V

    move v5, v2

    :goto_1
    if-ge v5, v8, :cond_4

    mul-int v6, v5, v3

    move v10, v2

    :goto_2
    if-ge v10, v9, :cond_3

    mul-int v11, v10, v4

    move v12, v2

    :goto_3
    if-ge v12, v3, :cond_2

    add-int/lit8 v13, v3, 0x2

    mul-int/2addr v13, v5

    add-int/lit8 v13, v13, 0x1

    add-int/2addr v13, v12

    add-int v14, v6, v12

    move v15, v2

    :goto_4
    if-ge v15, v4, :cond_1

    add-int/lit8 v16, v4, 0x2

    mul-int v16, v16, v10

    add-int/lit8 v16, v16, 0x1

    add-int v2, v16, v15

    .line 49
    invoke-virtual {v1, v2, v13}, Lx2/b;->b(II)Z

    move-result v2

    if-eqz v2, :cond_0

    add-int v2, v11, v15

    .line 50
    invoke-virtual {v7, v2, v14}, Lx2/b;->h(II)V

    :cond_0
    add-int/lit8 v15, v15, 0x1

    const/4 v2, 0x0

    goto :goto_4

    :cond_1
    add-int/lit8 v12, v12, 0x1

    const/4 v2, 0x0

    goto :goto_3

    :cond_2
    add-int/lit8 v10, v10, 0x1

    const/4 v2, 0x0

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    const/4 v2, 0x0

    goto :goto_1

    .line 51
    :cond_4
    iput-object v7, v0, LB2/a;->f:Ljava/lang/Object;

    .line 52
    new-instance v1, Lx2/b;

    .line 53
    iget v2, v7, Lx2/b;->e:I

    .line 54
    iget v3, v7, Lx2/b;->f:I

    .line 55
    invoke-direct {v1, v2, v3}, Lx2/b;-><init>(II)V

    iput-object v1, v0, LB2/a;->g:Ljava/lang/Object;

    return-void

    .line 56
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Dimension of bitMatrix must match the version size"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6
    add-int/lit8 v6, v6, 0x1

    const/4 v2, 0x0

    goto :goto_0

    .line 57
    :cond_7
    invoke-static {}, Lr2/e;->a()Lr2/e;

    move-result-object v1

    throw v1

    .line 58
    :cond_8
    invoke-static {}, Lr2/e;->a()Lr2/e;

    move-result-object v1

    throw v1

    .line 59
    :cond_9
    invoke-static {}, Lr2/e;->a()Lr2/e;

    move-result-object v1

    throw v1
.end method

.method public static J()LB2/a;
    .locals 5

    .line 1
    sget-object v0, LB2/a;->i:LB2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LK0/h;

    .line 6
    .line 7
    const/16 v1, 0xc

    .line 8
    .line 9
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v1, LY2/a;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    iput v2, v1, LY2/a;->a:I

    .line 19
    .line 20
    invoke-static {v1}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v3, Le3/e;

    .line 25
    .line 26
    new-instance v4, Lio/flutter/embedding/engine/FlutterJNI;

    .line 27
    .line 28
    invoke-direct {v4}, Lio/flutter/embedding/engine/FlutterJNI;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-boolean v2, v3, Le3/e;->a:Z

    .line 35
    .line 36
    iput-object v4, v3, Le3/e;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 37
    .line 38
    iput-object v1, v3, Le3/e;->f:Ljava/util/concurrent/ExecutorService;

    .line 39
    .line 40
    new-instance v2, LB2/a;

    .line 41
    .line 42
    const/16 v4, 0x10

    .line 43
    .line 44
    invoke-direct {v2, v4}, LB2/a;-><init>(I)V

    .line 45
    .line 46
    .line 47
    iput-object v3, v2, LB2/a;->f:Ljava/lang/Object;

    .line 48
    .line 49
    iput-object v0, v2, LB2/a;->g:Ljava/lang/Object;

    .line 50
    .line 51
    iput-object v1, v2, LB2/a;->h:Ljava/lang/Object;

    .line 52
    .line 53
    sput-object v2, LB2/a;->i:LB2/a;

    .line 54
    .line 55
    :cond_0
    sget-object v0, LB2/a;->i:LB2/a;

    .line 56
    .line 57
    return-object v0
.end method

.method public static L(Lx1/Z;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq p0, v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq p0, v1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public static T(Lx1/f0;)Landroid/support/v4/media/session/a;
    .locals 5

    .line 1
    invoke-static {p0}, LB2/a;->U(Lx1/f0;)Ls1/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ls1/s;->b:Ls1/s;

    .line 6
    .line 7
    iget-object v1, v0, Ls1/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ls1/M;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    new-instance v2, Ls1/K;

    .line 19
    .line 20
    const-class v3, Ls1/G;

    .line 21
    .line 22
    iget-object v4, p0, Ls1/G;->b:Lz1/a;

    .line 23
    .line 24
    invoke-direct {v2, v3, v4}, Ls1/K;-><init>(Ljava/lang/Class;Lz1/a;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, v1, Ls1/M;->b:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    new-instance v0, Ls1/i;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ls1/i;-><init>(Ls1/G;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_0
    invoke-virtual {v0, p0}, Ls1/s;->a(Ls1/G;)Landroid/support/v4/media/session/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static U(Lx1/f0;)Ls1/G;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lx1/f0;->E()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lx1/f0;->F()Lx1/t0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lx1/t0;->i:Lx1/t0;

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-virtual {p0}, Lx1/f0;->D()Lx1/Y;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lx1/Y;->E()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Lx1/f0;->D()Lx1/Y;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lx1/Y;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {p0}, Lx1/f0;->D()Lx1/Y;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Lx1/Y;->D()Lx1/X;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0}, Lx1/f0;->F()Lx1/t0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v1, v2, v3, p0, v0}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static l(Landroid/support/v4/media/session/a;Lx1/Z;I)Lx1/f0;
    .locals 4

    .line 1
    sget-object v0, Ls1/s;->b:Ls1/s;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ls1/s;->g(Landroid/support/v4/media/session/a;)Ls1/J;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ls1/G;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/support/v4/media/session/a;->n()Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-ne p0, p2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 23
    .line 24
    const-string p1, "Wrong ID set for key with ID requirement"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_0
    invoke-static {}, Lx1/f0;->I()Lx1/e0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Lx1/Y;->G()Lx1/W;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, v0, Ls1/G;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 41
    .line 42
    .line 43
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 44
    .line 45
    check-cast v3, Lx1/Y;

    .line 46
    .line 47
    invoke-static {v3, v2}, Lx1/Y;->z(Lx1/Y;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, v0, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 53
    .line 54
    .line 55
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 56
    .line 57
    check-cast v3, Lx1/Y;

    .line 58
    .line 59
    invoke-static {v3, v2}, Lx1/Y;->A(Lx1/Y;Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, v0, Ls1/G;->d:Lx1/X;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 65
    .line 66
    .line 67
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 68
    .line 69
    check-cast v3, Lx1/Y;

    .line 70
    .line 71
    invoke-static {v3, v2}, Lx1/Y;->B(Lx1/Y;Lx1/X;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 78
    .line 79
    check-cast v2, Lx1/f0;

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lx1/Y;

    .line 86
    .line 87
    invoke-static {v2, v1}, Lx1/f0;->z(Lx1/f0;Lx1/Y;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 94
    .line 95
    check-cast v1, Lx1/f0;

    .line 96
    .line 97
    invoke-static {v1, p1}, Lx1/f0;->B(Lx1/f0;Lx1/Z;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 104
    .line 105
    check-cast p1, Lx1/f0;

    .line 106
    .line 107
    invoke-static {p1, p2}, Lx1/f0;->C(Lx1/f0;I)V

    .line 108
    .line 109
    .line 110
    iget-object p1, v0, Ls1/G;->e:Lx1/t0;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 116
    .line 117
    check-cast p2, Lx1/f0;

    .line 118
    .line 119
    invoke-static {p2, p1}, Lx1/f0;->A(Lx1/f0;Lx1/t0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Lx1/f0;

    .line 127
    .line 128
    return-object p0
.end method

.method public static o(Landroid/text/Editable;Landroid/view/KeyEvent;Z)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p1}, Landroid/view/KeyEvent;->metaStateHasNoModifiers(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, -0x1

    .line 22
    if-eq p1, v2, :cond_6

    .line 23
    .line 24
    if-eq v1, v2, :cond_6

    .line 25
    .line 26
    if-eq p1, v1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const-class v2, LN/w;

    .line 30
    .line 31
    invoke-interface {p0, p1, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, [LN/w;

    .line 36
    .line 37
    if-eqz v1, :cond_6

    .line 38
    .line 39
    array-length v2, v1

    .line 40
    if-lez v2, :cond_6

    .line 41
    .line 42
    array-length v2, v1

    .line 43
    move v3, v0

    .line 44
    :goto_0
    if-ge v3, v2, :cond_6

    .line 45
    .line 46
    aget-object v4, v1, v3

    .line 47
    .line 48
    invoke-interface {p0, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-interface {p0, v4}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    if-eq v5, p1, :cond_4

    .line 59
    .line 60
    :cond_2
    if-nez p2, :cond_3

    .line 61
    .line 62
    if-eq v4, p1, :cond_4

    .line 63
    .line 64
    :cond_3
    if-le p1, v5, :cond_5

    .line 65
    .line 66
    if-ge p1, v4, :cond_5

    .line 67
    .line 68
    :cond_4
    invoke-interface {p0, v5, v4}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_6
    :goto_1
    return v0
.end method

.method public static t(IILx2/a;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v0, p1, :cond_1

    .line 4
    .line 5
    add-int v2, p0, v0

    .line 6
    .line 7
    invoke-virtual {p2, v2}, Lx2/a;->a(I)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    sub-int v2, p1, v0

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    sub-int/2addr v2, v3

    .line 17
    shl-int v2, v3, v2

    .line 18
    .line 19
    or-int/2addr v1, v2

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v1
.end method

.method public static final v(Lx1/g0;)LB2/a;
    .locals 11

    .line 1
    invoke-virtual {p0}, Lx1/g0;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_5

    .line 6
    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0}, Lx1/g0;->C()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lx1/g0;->D()Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v3, v0

    .line 35
    check-cast v3, Lx1/f0;

    .line 36
    .line 37
    invoke-virtual {v3}, Lx1/f0;->E()I

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    const/4 v4, 0x1

    .line 42
    const/4 v5, 0x0

    .line 43
    :try_start_0
    invoke-static {v3}, LB2/a;->T(Lx1/f0;)Landroid/support/v4/media/session/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    move v9, v5

    .line 48
    goto :goto_1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    sget-object v6, Ln1/a;->a:Lj3/b;

    .line 51
    .line 52
    iget-object v6, v6, Lj3/b;->f:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 55
    .line 56
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-nez v6, :cond_3

    .line 61
    .line 62
    new-instance v0, Ls1/i;

    .line 63
    .line 64
    invoke-static {v3}, LB2/a;->U(Lx1/f0;)Ls1/G;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-direct {v0, v6}, Ls1/i;-><init>(Ls1/G;)V

    .line 69
    .line 70
    .line 71
    move v9, v4

    .line 72
    :goto_1
    sget-object v6, Ln1/a;->a:Lj3/b;

    .line 73
    .line 74
    iget-object v6, v6, Lj3/b;->f:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_0

    .line 83
    .line 84
    invoke-virtual {v3}, Lx1/f0;->G()Lx1/Z;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-static {v6}, LB2/a;->L(Lx1/Z;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-eqz v6, :cond_1

    .line 93
    .line 94
    :cond_0
    move v6, v4

    .line 95
    goto :goto_2

    .line 96
    :cond_1
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 97
    .line 98
    const-string v0, "Parsing of a single key failed (wrong status) and Tink is configured via validateKeysetsOnParsing to reject such keysets."

    .line 99
    .line 100
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    throw p0

    .line 104
    :goto_2
    new-instance v4, Lj1/f;

    .line 105
    .line 106
    invoke-virtual {v3}, Lx1/f0;->G()Lx1/Z;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {p0}, Lx1/g0;->E()I

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    if-ne v7, v8, :cond_2

    .line 115
    .line 116
    move v8, v6

    .line 117
    goto :goto_3

    .line 118
    :cond_2
    move v8, v5

    .line 119
    :goto_3
    sget-object v10, Lj1/f;->h:Lb2/f;

    .line 120
    .line 121
    move-object v5, v0

    .line 122
    move-object v6, v3

    .line 123
    invoke-direct/range {v4 .. v10}, Lj1/f;-><init>(Landroid/support/v4/media/session/a;Lx1/Z;IZZLb2/f;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    throw v0

    .line 131
    :cond_4
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance v0, LB2/a;

    .line 136
    .line 137
    sget-object v1, Ls1/k;->b:Ls1/k;

    .line 138
    .line 139
    invoke-direct {v0, p0, v1}, LB2/a;-><init>(Ljava/util/List;Ls1/k;)V

    .line 140
    .line 141
    .line 142
    return-object v0

    .line 143
    :cond_5
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 144
    .line 145
    const-string v0, "empty keyset"

    .line 146
    .line 147
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p0
.end method


# virtual methods
.method public A()Lj1/f;
    .locals 3

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lj1/f;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-boolean v2, v1, Lj1/f;->e:Z

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v0, v1, Lj1/f;->c:Lj1/c;

    .line 28
    .line 29
    sget-object v2, Lj1/c;->c:Lj1/c;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 35
    .line 36
    const-string v1, "Keyset has primary which isn\'t enabled"

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v0

    .line 42
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string v1, "Keyset has no valid primary"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v0
.end method

.method public B(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 13

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LB2/a;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    move-object v2, p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v2, v1

    .line 14
    :goto_0
    invoke-virtual {v2}, LB2/a;->y()Lx1/g0;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget v3, Lj1/j;->a:I

    .line 19
    .line 20
    invoke-virtual {v2}, Lx1/g0;->E()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v2}, Lx1/g0;->D()Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const/4 v5, 0x1

    .line 33
    const/4 v6, 0x0

    .line 34
    move v9, v5

    .line 35
    move v7, v6

    .line 36
    move v8, v7

    .line 37
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    if-eqz v10, :cond_8

    .line 42
    .line 43
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    check-cast v10, Lx1/f0;

    .line 48
    .line 49
    invoke-virtual {v10}, Lx1/f0;->G()Lx1/Z;

    .line 50
    .line 51
    .line 52
    move-result-object v11

    .line 53
    sget-object v12, Lx1/Z;->g:Lx1/Z;

    .line 54
    .line 55
    if-eq v11, v12, :cond_1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-virtual {v10}, Lx1/f0;->H()Z

    .line 59
    .line 60
    .line 61
    move-result v11

    .line 62
    if-eqz v11, :cond_7

    .line 63
    .line 64
    invoke-virtual {v10}, Lx1/f0;->F()Lx1/t0;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    sget-object v12, Lx1/t0;->f:Lx1/t0;

    .line 69
    .line 70
    if-eq v11, v12, :cond_6

    .line 71
    .line 72
    invoke-virtual {v10}, Lx1/f0;->G()Lx1/Z;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    sget-object v12, Lx1/Z;->f:Lx1/Z;

    .line 77
    .line 78
    if-eq v11, v12, :cond_5

    .line 79
    .line 80
    invoke-virtual {v10}, Lx1/f0;->E()I

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    if-ne v11, v3, :cond_3

    .line 85
    .line 86
    if-nez v8, :cond_2

    .line 87
    .line 88
    move v8, v5

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 91
    .line 92
    const-string v0, "keyset contains multiple primary keys"

    .line 93
    .line 94
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p1

    .line 98
    :cond_3
    :goto_2
    invoke-virtual {v10}, Lx1/f0;->D()Lx1/Y;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    invoke-virtual {v10}, Lx1/Y;->D()Lx1/X;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    sget-object v11, Lx1/X;->i:Lx1/X;

    .line 107
    .line 108
    if-eq v10, v11, :cond_4

    .line 109
    .line 110
    move v9, v6

    .line 111
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 115
    .line 116
    invoke-virtual {v10}, Lx1/f0;->E()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v1, "key %d has unknown status"

    .line 129
    .line 130
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p1

    .line 138
    :cond_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 139
    .line 140
    invoke-virtual {v10}, Lx1/f0;->E()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const-string v1, "key %d has unknown prefix"

    .line 153
    .line 154
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    throw p1

    .line 162
    :cond_7
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 163
    .line 164
    invoke-virtual {v10}, Lx1/f0;->E()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    const-string v1, "key %d has no key data"

    .line 177
    .line 178
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    throw p1

    .line 186
    :cond_8
    if-eqz v7, :cond_f

    .line 187
    .line 188
    if-nez v8, :cond_a

    .line 189
    .line 190
    if-eqz v9, :cond_9

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 194
    .line 195
    const-string v0, "keyset doesn\'t contain a valid primary key"

    .line 196
    .line 197
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    throw p1

    .line 201
    :cond_a
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    if-ge v6, v3, :cond_c

    .line 206
    .line 207
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    check-cast v3, Lj1/f;

    .line 212
    .line 213
    iget-boolean v3, v3, Lj1/f;->f:Z

    .line 214
    .line 215
    if-nez v3, :cond_b

    .line 216
    .line 217
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Lj1/f;

    .line 222
    .line 223
    iget-object v3, v3, Lj1/f;->b:Lx1/Z;

    .line 224
    .line 225
    invoke-static {v3}, LB2/a;->L(Lx1/Z;)Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-eqz v3, :cond_b

    .line 230
    .line 231
    add-int/lit8 v6, v6, 0x1

    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_b
    invoke-virtual {v2, v6}, Lx1/g0;->B(I)Lx1/f0;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 239
    .line 240
    const-string v1, "Key parsing of key with index "

    .line 241
    .line 242
    const-string v2, " and type_url "

    .line 243
    .line 244
    invoke-static {v6, v1, v2}, LE1/j;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-virtual {p1}, Lx1/f0;->D()Lx1/Y;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p1}, Lx1/Y;->E()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string p1, " failed, unable to get primitive"

    .line 260
    .line 261
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    throw v0

    .line 272
    :cond_c
    if-nez v1, :cond_d

    .line 273
    .line 274
    move-object v1, p0

    .line 275
    :cond_d
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 276
    .line 277
    check-cast v0, Ls1/k;

    .line 278
    .line 279
    sget-object v2, Ls1/q;->b:Ls1/q;

    .line 280
    .line 281
    iget-object v2, v2, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 282
    .line 283
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Ls1/E;

    .line 288
    .line 289
    iget-object v3, v2, Ls1/E;->b:Ljava/util/HashMap;

    .line 290
    .line 291
    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v4

    .line 295
    if-eqz v4, :cond_e

    .line 296
    .line 297
    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    check-cast p1, Ls1/F;

    .line 302
    .line 303
    new-instance v3, LE0/j;

    .line 304
    .line 305
    const/16 v4, 0x8

    .line 306
    .line 307
    invoke-direct {v3, v4, v2, p1}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    invoke-interface {p1, v1, v0, v3}, Ls1/F;->b(LB2/a;Ls1/k;LE0/j;)Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    return-object p1

    .line 315
    :cond_e
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 316
    .line 317
    new-instance v1, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    const-string v2, "No wrapper found for "

    .line 320
    .line 321
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    throw v0

    .line 335
    :cond_f
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 336
    .line 337
    const-string v0, "keyset must contain at least one ENABLED key"

    .line 338
    .line 339
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    throw p1
.end method

.method public C()LE/i;
    .locals 6

    .line 1
    :try_start_0
    new-instance v0, LE/i;

    .line 2
    .line 3
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ld1/g;

    .line 6
    .line 7
    const-string v2, "com.google.android.gms.maps.internal.IProjectionDelegate"

    .line 8
    .line 9
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const/16 v4, 0x1a

    .line 14
    .line 15
    invoke-virtual {v1, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-interface {v3, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    instance-of v5, v4, Ld1/b;

    .line 32
    .line 33
    if-eqz v5, :cond_1

    .line 34
    .line 35
    move-object v2, v4

    .line 36
    check-cast v2, Ld1/b;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance v4, Ld1/b;

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    invoke-direct {v4, v3, v2, v5}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    move-object v2, v4

    .line 46
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 47
    .line 48
    .line 49
    const/16 v1, 0x18

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, LE/i;-><init>(ILjava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    new-instance v1, Le1/x;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    throw v1
.end method

.method public D()LA0/c;
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LA0/c;

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    new-instance v0, LA0/c;

    .line 8
    .line 9
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ld1/g;

    .line 12
    .line 13
    const-string v2, "com.google.android.gms.maps.internal.IUiSettingsDelegate"

    .line 14
    .line 15
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/16 v4, 0x19

    .line 20
    .line 21
    invoke-virtual {v1, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-interface {v3, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    instance-of v5, v4, Ld1/c;

    .line 38
    .line 39
    if-eqz v5, :cond_1

    .line 40
    .line 41
    move-object v2, v4

    .line 42
    check-cast v2, Ld1/c;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    new-instance v4, Ld1/c;

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    invoke-direct {v4, v3, v2, v5}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    move-object v2, v4

    .line 52
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 53
    .line 54
    .line 55
    const/16 v1, 0x1a

    .line 56
    .line 57
    invoke-direct {v0, v1, v2}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :catch_0
    move-exception v0

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    :goto_1
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, LA0/c;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    return-object v0

    .line 70
    :goto_2
    new-instance v1, Le1/x;

    .line 71
    .line 72
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    throw v1
.end method

.method public E(I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LE/i;

    .line 4
    .line 5
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1
.end method

.method public F()I
    .locals 1

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LE/i;

    .line 4
    .line 5
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public G(Landroid/view/KeyEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [LZ2/x;

    .line 4
    .line 5
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    array-length v1, v0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-lez v1, :cond_2

    .line 20
    .line 21
    new-instance v1, LR/a;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, LR/a;-><init>(LB2/a;Landroid/view/KeyEvent;)V

    .line 24
    .line 25
    .line 26
    array-length v4, v0

    .line 27
    :goto_0
    if-ge v2, v4, :cond_1

    .line 28
    .line 29
    aget-object v5, v0, v2

    .line 30
    .line 31
    new-instance v6, LI2/h;

    .line 32
    .line 33
    invoke-direct {v6, v1}, LI2/h;-><init>(LR/a;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v5, p1, v6}, LZ2/x;->a(Landroid/view/KeyEvent;LI2/h;)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return v3

    .line 43
    :cond_2
    invoke-virtual {p0, p1}, LB2/a;->M(Landroid/view/KeyEvent;)V

    .line 44
    .line 45
    .line 46
    return v3
.end method

.method public H()Z
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, LB2/a;->h:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, LE/i;

    .line 6
    .line 7
    const-string v2, "gcm.n.noui"

    .line 8
    .line 9
    invoke-virtual {v0, v2}, LE/i;->k(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    iget-object v0, v1, LB2/a;->g:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessagingService;

    .line 20
    .line 21
    const-string v3, "keyguard"

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/app/KeyguardManager;

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const-string v5, "activity"

    .line 42
    .line 43
    invoke-virtual {v0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/app/ActivityManager;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-eqz v5, :cond_3

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 70
    .line 71
    iget v6, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    .line 72
    .line 73
    if-ne v6, v3, :cond_2

    .line 74
    .line 75
    iget v0, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 76
    .line 77
    const/16 v3, 0x64

    .line 78
    .line 79
    if-ne v0, v3, :cond_3

    .line 80
    .line 81
    return v4

    .line 82
    :cond_3
    :goto_0
    iget-object v0, v1, LB2/a;->h:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v0, LE/i;

    .line 85
    .line 86
    const-string v3, "gcm.n.image"

    .line 87
    .line 88
    invoke-virtual {v0, v3}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    const-string v6, "FirebaseMessaging"

    .line 97
    .line 98
    if-eqz v3, :cond_4

    .line 99
    .line 100
    :goto_1
    const/4 v3, 0x0

    .line 101
    goto :goto_2

    .line 102
    :cond_4
    :try_start_0
    new-instance v3, LV1/r;

    .line 103
    .line 104
    new-instance v7, Ljava/net/URL;

    .line 105
    .line 106
    invoke-direct {v7, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-direct {v3, v7}, LV1/r;-><init>(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :catch_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v7, "Not downloading image, bad URL: "

    .line 116
    .line 117
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :goto_2
    if-eqz v3, :cond_5

    .line 132
    .line 133
    iget-object v0, v1, LB2/a;->f:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v0, Ljava/util/concurrent/ExecutorService;

    .line 136
    .line 137
    new-instance v7, Li1/i;

    .line 138
    .line 139
    invoke-direct {v7}, Li1/i;-><init>()V

    .line 140
    .line 141
    .line 142
    new-instance v8, LD1/h;

    .line 143
    .line 144
    const/16 v9, 0x8

    .line 145
    .line 146
    invoke-direct {v8, v9, v3, v7}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, v3, LV1/r;->f:Ljava/util/concurrent/Future;

    .line 154
    .line 155
    iget-object v0, v7, Li1/i;->a:Li1/p;

    .line 156
    .line 157
    iput-object v0, v3, LV1/r;->g:Li1/p;

    .line 158
    .line 159
    :cond_5
    iget-object v0, v1, LB2/a;->g:Ljava/lang/Object;

    .line 160
    .line 161
    move-object v7, v0

    .line 162
    check-cast v7, Lcom/google/firebase/messaging/FirebaseMessagingService;

    .line 163
    .line 164
    iget-object v0, v1, LB2/a;->h:Ljava/lang/Object;

    .line 165
    .line 166
    move-object v8, v0

    .line 167
    check-cast v8, LE/i;

    .line 168
    .line 169
    sget-object v0, LV1/e;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 170
    .line 171
    const-string v9, "Couldn\'t get own application info: "

    .line 172
    .line 173
    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v10

    .line 181
    const/16 v11, 0x80

    .line 182
    .line 183
    :try_start_1
    invoke-virtual {v0, v10, v11}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    if-eqz v0, :cond_6

    .line 188
    .line 189
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 190
    .line 191
    if-eqz v0, :cond_6

    .line 192
    .line 193
    :goto_3
    move-object v10, v0

    .line 194
    goto :goto_4

    .line 195
    :catch_1
    move-exception v0

    .line 196
    new-instance v10, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    :cond_6
    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :goto_4
    const-string v0, "gcm.n.android_channel_id"

    .line 215
    .line 216
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 221
    .line 222
    const/16 v12, 0x1a

    .line 223
    .line 224
    if-ge v11, v12, :cond_7

    .line 225
    .line 226
    :catch_2
    :goto_5
    const/4 v0, 0x0

    .line 227
    goto/16 :goto_8

    .line 228
    .line 229
    :cond_7
    :try_start_2
    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 230
    .line 231
    .line 232
    move-result-object v11

    .line 233
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v13

    .line 237
    invoke-virtual {v11, v13, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 238
    .line 239
    .line 240
    move-result-object v11

    .line 241
    iget v11, v11, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 242
    .line 243
    if-ge v11, v12, :cond_8

    .line 244
    .line 245
    goto :goto_5

    .line 246
    :cond_8
    const-class v11, Landroid/app/NotificationManager;

    .line 247
    .line 248
    invoke-virtual {v7, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v11

    .line 252
    check-cast v11, Landroid/app/NotificationManager;

    .line 253
    .line 254
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result v12

    .line 258
    if-nez v12, :cond_a

    .line 259
    .line 260
    invoke-static {v11, v0}, Lcom/dexterous/flutterlocalnotifications/a;->b(Landroid/app/NotificationManager;Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 261
    .line 262
    .line 263
    move-result-object v12

    .line 264
    if-eqz v12, :cond_9

    .line 265
    .line 266
    goto :goto_8

    .line 267
    :cond_9
    new-instance v12, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v13, "Notification Channel requested ("

    .line 270
    .line 271
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v0, ") has not been created by the app. Manifest configuration, or default, value will be used."

    .line 278
    .line 279
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    .line 288
    .line 289
    :cond_a
    const-string v0, "com.google.firebase.messaging.default_notification_channel_id"

    .line 290
    .line 291
    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v12

    .line 299
    if-nez v12, :cond_c

    .line 300
    .line 301
    invoke-static {v11, v0}, Lcom/dexterous/flutterlocalnotifications/a;->b(Landroid/app/NotificationManager;Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 302
    .line 303
    .line 304
    move-result-object v12

    .line 305
    if-eqz v12, :cond_b

    .line 306
    .line 307
    goto :goto_8

    .line 308
    :cond_b
    const-string v0, "Notification Channel set in AndroidManifest.xml has not been created by the app. Default value will be used."

    .line 309
    .line 310
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    .line 312
    .line 313
    goto :goto_6

    .line 314
    :cond_c
    const-string v0, "Missing Default Notification Channel metadata in AndroidManifest. Default value will be used."

    .line 315
    .line 316
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    .line 318
    .line 319
    :goto_6
    invoke-static {v11}, LB/a;->z(Landroid/app/NotificationManager;)Landroid/app/NotificationChannel;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    if-nez v0, :cond_e

    .line 324
    .line 325
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    const-string v12, "string"

    .line 330
    .line 331
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v13

    .line 335
    const-string v14, "fcm_fallback_notification_channel_label"

    .line 336
    .line 337
    invoke-virtual {v0, v14, v12, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    if-nez v0, :cond_d

    .line 342
    .line 343
    const-string v0, "String resource \"fcm_fallback_notification_channel_label\" is not found. Using default string channel name."

    .line 344
    .line 345
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    const-string v0, "Misc"

    .line 349
    .line 350
    goto :goto_7

    .line 351
    :cond_d
    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    :goto_7
    invoke-static {v0}, LB/a;->A(Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-static {v11, v0}, Lcom/dexterous/flutterlocalnotifications/a;->s(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 360
    .line 361
    .line 362
    :cond_e
    const-string v0, "fcm_fallback_notification_channel"

    .line 363
    .line 364
    :goto_8
    sget-object v11, LV1/e;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 365
    .line 366
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v12

    .line 370
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 371
    .line 372
    .line 373
    move-result-object v13

    .line 374
    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 375
    .line 376
    .line 377
    move-result-object v14

    .line 378
    new-instance v15, Lt/i;

    .line 379
    .line 380
    invoke-direct {v15, v7, v0}, Lt/i;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    const-string v0, "gcm.n.title"

    .line 384
    .line 385
    invoke-virtual {v8, v13, v12, v0}, LE/i;->w(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 390
    .line 391
    .line 392
    move-result v16

    .line 393
    if-nez v16, :cond_f

    .line 394
    .line 395
    invoke-static {v0}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    iput-object v0, v15, Lt/i;->e:Ljava/lang/CharSequence;

    .line 400
    .line 401
    :cond_f
    const-string v0, "gcm.n.body"

    .line 402
    .line 403
    invoke-virtual {v8, v13, v12, v0}, LE/i;->w(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 408
    .line 409
    .line 410
    move-result v16

    .line 411
    if-nez v16, :cond_10

    .line 412
    .line 413
    invoke-static {v0}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 414
    .line 415
    .line 416
    move-result-object v5

    .line 417
    iput-object v5, v15, Lt/i;->f:Ljava/lang/CharSequence;

    .line 418
    .line 419
    new-instance v5, Lt/g;

    .line 420
    .line 421
    invoke-direct {v5, v4}, Lt/g;-><init>(I)V

    .line 422
    .line 423
    .line 424
    invoke-static {v0}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    iput-object v0, v5, Lt/g;->f:Ljava/lang/Object;

    .line 429
    .line 430
    invoke-virtual {v15, v5}, Lt/i;->f(Lt/A;)V

    .line 431
    .line 432
    .line 433
    :cond_10
    const-string v0, "gcm.n.icon"

    .line 434
    .line 435
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 440
    .line 441
    .line 442
    move-result v5

    .line 443
    if-nez v5, :cond_13

    .line 444
    .line 445
    const-string v5, "drawable"

    .line 446
    .line 447
    invoke-virtual {v13, v0, v5, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    .line 449
    .line 450
    move-result v5

    .line 451
    if-eqz v5, :cond_11

    .line 452
    .line 453
    invoke-static {v13, v5}, LV1/e;->a(Landroid/content/res/Resources;I)Z

    .line 454
    .line 455
    .line 456
    move-result v17

    .line 457
    if-eqz v17, :cond_11

    .line 458
    .line 459
    :goto_9
    move/from16 v17, v2

    .line 460
    .line 461
    goto :goto_d

    .line 462
    :cond_11
    const-string v5, "mipmap"

    .line 463
    .line 464
    invoke-virtual {v13, v0, v5, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    .line 466
    .line 467
    move-result v5

    .line 468
    if-eqz v5, :cond_12

    .line 469
    .line 470
    invoke-static {v13, v5}, LV1/e;->a(Landroid/content/res/Resources;I)Z

    .line 471
    .line 472
    .line 473
    move-result v17

    .line 474
    if-eqz v17, :cond_12

    .line 475
    .line 476
    goto :goto_9

    .line 477
    :cond_12
    new-instance v5, Ljava/lang/StringBuilder;

    .line 478
    .line 479
    move/from16 v17, v2

    .line 480
    .line 481
    const-string v2, "Icon resource "

    .line 482
    .line 483
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    const-string v0, " not found. Notification will use default icon."

    .line 490
    .line 491
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    .line 500
    .line 501
    goto :goto_a

    .line 502
    :cond_13
    move/from16 v17, v2

    .line 503
    .line 504
    :goto_a
    const-string v0, "com.google.firebase.messaging.default_notification_icon"

    .line 505
    .line 506
    invoke-virtual {v10, v0, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 507
    .line 508
    .line 509
    move-result v2

    .line 510
    if-eqz v2, :cond_14

    .line 511
    .line 512
    invoke-static {v13, v2}, LV1/e;->a(Landroid/content/res/Resources;I)Z

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    if-nez v0, :cond_15

    .line 517
    .line 518
    :cond_14
    :try_start_3
    invoke-virtual {v14, v12, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    iget v2, v0, Landroid/content/pm/ApplicationInfo;->icon:I
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    .line 523
    .line 524
    goto :goto_b

    .line 525
    :catch_3
    move-exception v0

    .line 526
    new-instance v5, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    .line 540
    .line 541
    :cond_15
    :goto_b
    if-eqz v2, :cond_17

    .line 542
    .line 543
    invoke-static {v13, v2}, LV1/e;->a(Landroid/content/res/Resources;I)Z

    .line 544
    .line 545
    .line 546
    move-result v0

    .line 547
    if-nez v0, :cond_16

    .line 548
    .line 549
    goto :goto_c

    .line 550
    :cond_16
    move v5, v2

    .line 551
    goto :goto_d

    .line 552
    :cond_17
    :goto_c
    const v0, 0x1080093

    .line 553
    .line 554
    .line 555
    move v5, v0

    .line 556
    :goto_d
    iget-object v0, v15, Lt/i;->G:Landroid/app/Notification;

    .line 557
    .line 558
    iput v5, v0, Landroid/app/Notification;->icon:I

    .line 559
    .line 560
    const-string v0, "gcm.n.sound2"

    .line 561
    .line 562
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 567
    .line 568
    .line 569
    move-result v2

    .line 570
    if-eqz v2, :cond_18

    .line 571
    .line 572
    const-string v0, "gcm.n.sound"

    .line 573
    .line 574
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 575
    .line 576
    .line 577
    move-result-object v0

    .line 578
    :cond_18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 579
    .line 580
    .line 581
    move-result v2

    .line 582
    const/4 v5, 0x2

    .line 583
    if-eqz v2, :cond_19

    .line 584
    .line 585
    const/4 v0, 0x0

    .line 586
    goto :goto_e

    .line 587
    :cond_19
    const-string v2, "default"

    .line 588
    .line 589
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 590
    .line 591
    .line 592
    move-result v2

    .line 593
    if-nez v2, :cond_1a

    .line 594
    .line 595
    const-string v2, "raw"

    .line 596
    .line 597
    invoke-virtual {v13, v0, v2, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    .line 599
    .line 600
    move-result v2

    .line 601
    if-eqz v2, :cond_1a

    .line 602
    .line 603
    new-instance v2, Ljava/lang/StringBuilder;

    .line 604
    .line 605
    const-string v9, "android.resource://"

    .line 606
    .line 607
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    .line 612
    .line 613
    const-string v9, "/raw/"

    .line 614
    .line 615
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    goto :goto_e

    .line 630
    :cond_1a
    invoke-static {v5}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    .line 631
    .line 632
    .line 633
    move-result-object v0

    .line 634
    :goto_e
    if-eqz v0, :cond_1b

    .line 635
    .line 636
    invoke-virtual {v15, v0}, Lt/i;->e(Landroid/net/Uri;)V

    .line 637
    .line 638
    .line 639
    :cond_1b
    const-string v0, "gcm.n.click_action"

    .line 640
    .line 641
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 646
    .line 647
    .line 648
    move-result v2

    .line 649
    if-nez v2, :cond_1c

    .line 650
    .line 651
    new-instance v2, Landroid/content/Intent;

    .line 652
    .line 653
    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v2, v12}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 657
    .line 658
    .line 659
    const/high16 v0, 0x10000000

    .line 660
    .line 661
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 662
    .line 663
    .line 664
    goto :goto_10

    .line 665
    :cond_1c
    const-string v0, "gcm.n.link_android"

    .line 666
    .line 667
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v0

    .line 671
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 672
    .line 673
    .line 674
    move-result v2

    .line 675
    if-eqz v2, :cond_1d

    .line 676
    .line 677
    const-string v0, "gcm.n.link"

    .line 678
    .line 679
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 680
    .line 681
    .line 682
    move-result-object v0

    .line 683
    :cond_1d
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 684
    .line 685
    .line 686
    move-result v2

    .line 687
    if-nez v2, :cond_1e

    .line 688
    .line 689
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    goto :goto_f

    .line 694
    :cond_1e
    const/4 v0, 0x0

    .line 695
    :goto_f
    if-eqz v0, :cond_1f

    .line 696
    .line 697
    new-instance v2, Landroid/content/Intent;

    .line 698
    .line 699
    const-string v9, "android.intent.action.VIEW"

    .line 700
    .line 701
    invoke-direct {v2, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 702
    .line 703
    .line 704
    invoke-virtual {v2, v12}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 705
    .line 706
    .line 707
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 708
    .line 709
    .line 710
    goto :goto_10

    .line 711
    :cond_1f
    invoke-virtual {v14, v12}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 712
    .line 713
    .line 714
    move-result-object v2

    .line 715
    if-nez v2, :cond_20

    .line 716
    .line 717
    const-string v0, "No activity found to launch app"

    .line 718
    .line 719
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    .line 721
    .line 722
    :cond_20
    :goto_10
    const/high16 v0, 0x44000000    # 512.0f

    .line 723
    .line 724
    const-string v9, "google.c.a.e"

    .line 725
    .line 726
    if-nez v2, :cond_21

    .line 727
    .line 728
    const/4 v2, 0x0

    .line 729
    goto :goto_12

    .line 730
    :cond_21
    const/high16 v12, 0x4000000

    .line 731
    .line 732
    invoke-virtual {v2, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 733
    .line 734
    .line 735
    new-instance v12, Landroid/os/Bundle;

    .line 736
    .line 737
    iget-object v13, v8, LE/i;->f:Ljava/lang/Object;

    .line 738
    .line 739
    check-cast v13, Landroid/os/Bundle;

    .line 740
    .line 741
    invoke-direct {v12, v13}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 742
    .line 743
    .line 744
    invoke-virtual {v13}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 745
    .line 746
    .line 747
    move-result-object v13

    .line 748
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 749
    .line 750
    .line 751
    move-result-object v13

    .line 752
    :goto_11
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 753
    .line 754
    .line 755
    move-result v14

    .line 756
    if-eqz v14, :cond_24

    .line 757
    .line 758
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 759
    .line 760
    .line 761
    move-result-object v14

    .line 762
    check-cast v14, Ljava/lang/String;

    .line 763
    .line 764
    const-string v5, "google.c."

    .line 765
    .line 766
    invoke-virtual {v14, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 767
    .line 768
    .line 769
    move-result v5

    .line 770
    if-nez v5, :cond_22

    .line 771
    .line 772
    const-string v5, "gcm.n."

    .line 773
    .line 774
    invoke-virtual {v14, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 775
    .line 776
    .line 777
    move-result v5

    .line 778
    if-nez v5, :cond_22

    .line 779
    .line 780
    const-string v5, "gcm.notification."

    .line 781
    .line 782
    invoke-virtual {v14, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 783
    .line 784
    .line 785
    move-result v5

    .line 786
    if-eqz v5, :cond_23

    .line 787
    .line 788
    :cond_22
    invoke-virtual {v12, v14}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 789
    .line 790
    .line 791
    :cond_23
    const/4 v5, 0x2

    .line 792
    goto :goto_11

    .line 793
    :cond_24
    invoke-virtual {v2, v12}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 794
    .line 795
    .line 796
    invoke-virtual {v8, v9}, LE/i;->k(Ljava/lang/String;)Z

    .line 797
    .line 798
    .line 799
    move-result v5

    .line 800
    if-eqz v5, :cond_25

    .line 801
    .line 802
    const-string v5, "gcm.n.analytics_data"

    .line 803
    .line 804
    invoke-virtual {v8}, LE/i;->D()Landroid/os/Bundle;

    .line 805
    .line 806
    .line 807
    move-result-object v12

    .line 808
    invoke-virtual {v2, v5, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 809
    .line 810
    .line 811
    :cond_25
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 812
    .line 813
    .line 814
    move-result v5

    .line 815
    invoke-static {v7, v5, v2, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 816
    .line 817
    .line 818
    move-result-object v2

    .line 819
    :goto_12
    iput-object v2, v15, Lt/i;->g:Landroid/app/PendingIntent;

    .line 820
    .line 821
    invoke-virtual {v8, v9}, LE/i;->k(Ljava/lang/String;)Z

    .line 822
    .line 823
    .line 824
    move-result v2

    .line 825
    if-nez v2, :cond_26

    .line 826
    .line 827
    const/4 v0, 0x0

    .line 828
    goto :goto_13

    .line 829
    :cond_26
    new-instance v2, Landroid/content/Intent;

    .line 830
    .line 831
    const-string v5, "com.google.firebase.messaging.NOTIFICATION_DISMISS"

    .line 832
    .line 833
    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 834
    .line 835
    .line 836
    invoke-virtual {v8}, LE/i;->D()Landroid/os/Bundle;

    .line 837
    .line 838
    .line 839
    move-result-object v5

    .line 840
    invoke-virtual {v2, v5}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 841
    .line 842
    .line 843
    move-result-object v2

    .line 844
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 845
    .line 846
    .line 847
    move-result v5

    .line 848
    new-instance v9, Landroid/content/Intent;

    .line 849
    .line 850
    const-string v11, "com.google.android.c2dm.intent.RECEIVE"

    .line 851
    .line 852
    invoke-direct {v9, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 853
    .line 854
    .line 855
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 856
    .line 857
    .line 858
    move-result-object v11

    .line 859
    invoke-virtual {v9, v11}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 860
    .line 861
    .line 862
    move-result-object v9

    .line 863
    const-string v11, "wrapped_intent"

    .line 864
    .line 865
    invoke-virtual {v9, v11, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 866
    .line 867
    .line 868
    move-result-object v2

    .line 869
    invoke-static {v7, v5, v2, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 870
    .line 871
    .line 872
    move-result-object v0

    .line 873
    :goto_13
    if-eqz v0, :cond_27

    .line 874
    .line 875
    iget-object v2, v15, Lt/i;->G:Landroid/app/Notification;

    .line 876
    .line 877
    iput-object v0, v2, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 878
    .line 879
    :cond_27
    const-string v0, "gcm.n.color"

    .line 880
    .line 881
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v0

    .line 885
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 886
    .line 887
    .line 888
    move-result v2

    .line 889
    if-nez v2, :cond_28

    .line 890
    .line 891
    :try_start_4
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 892
    .line 893
    .line 894
    move-result v2

    .line 895
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 896
    .line 897
    .line 898
    move-result-object v0
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_4

    .line 899
    goto :goto_14

    .line 900
    :catch_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 901
    .line 902
    const-string v5, "Color is invalid: "

    .line 903
    .line 904
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 908
    .line 909
    .line 910
    const-string v0, ". Notification will use default color."

    .line 911
    .line 912
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 913
    .line 914
    .line 915
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 916
    .line 917
    .line 918
    move-result-object v0

    .line 919
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    .line 921
    .line 922
    :cond_28
    const-string v0, "com.google.firebase.messaging.default_notification_color"

    .line 923
    .line 924
    invoke-virtual {v10, v0, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 925
    .line 926
    .line 927
    move-result v0

    .line 928
    if-eqz v0, :cond_29

    .line 929
    .line 930
    :try_start_5
    invoke-virtual {v7, v0}, Landroid/content/Context;->getColor(I)I

    .line 931
    .line 932
    .line 933
    move-result v0

    .line 934
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 935
    .line 936
    .line 937
    move-result-object v0
    :try_end_5
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5 .. :try_end_5} :catch_5

    .line 938
    goto :goto_14

    .line 939
    :catch_5
    const-string v0, "Cannot find the color resource referenced in AndroidManifest."

    .line 940
    .line 941
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 942
    .line 943
    .line 944
    :cond_29
    const/4 v0, 0x0

    .line 945
    :goto_14
    if-eqz v0, :cond_2a

    .line 946
    .line 947
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 948
    .line 949
    .line 950
    move-result v0

    .line 951
    iput v0, v15, Lt/i;->z:I

    .line 952
    .line 953
    :cond_2a
    const-string v0, "gcm.n.sticky"

    .line 954
    .line 955
    invoke-virtual {v8, v0}, LE/i;->k(Ljava/lang/String;)Z

    .line 956
    .line 957
    .line 958
    move-result v0

    .line 959
    xor-int/lit8 v0, v0, 0x1

    .line 960
    .line 961
    const/16 v2, 0x10

    .line 962
    .line 963
    invoke-virtual {v15, v2, v0}, Lt/i;->c(IZ)V

    .line 964
    .line 965
    .line 966
    const-string v0, "gcm.n.local_only"

    .line 967
    .line 968
    invoke-virtual {v8, v0}, LE/i;->k(Ljava/lang/String;)Z

    .line 969
    .line 970
    .line 971
    move-result v0

    .line 972
    iput-boolean v0, v15, Lt/i;->u:Z

    .line 973
    .line 974
    const-string v0, "gcm.n.ticker"

    .line 975
    .line 976
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    if-eqz v0, :cond_2b

    .line 981
    .line 982
    iget-object v2, v15, Lt/i;->G:Landroid/app/Notification;

    .line 983
    .line 984
    invoke-static {v0}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 985
    .line 986
    .line 987
    move-result-object v0

    .line 988
    iput-object v0, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 989
    .line 990
    :cond_2b
    const-string v0, "gcm.n.notification_priority"

    .line 991
    .line 992
    invoke-virtual {v8, v0}, LE/i;->m(Ljava/lang/String;)Ljava/lang/Integer;

    .line 993
    .line 994
    .line 995
    move-result-object v0

    .line 996
    const/4 v2, -0x2

    .line 997
    if-nez v0, :cond_2c

    .line 998
    .line 999
    :goto_15
    const/4 v0, 0x0

    .line 1000
    goto :goto_16

    .line 1001
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1002
    .line 1003
    .line 1004
    move-result v5

    .line 1005
    if-lt v5, v2, :cond_2d

    .line 1006
    .line 1007
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1008
    .line 1009
    .line 1010
    move-result v5

    .line 1011
    const/4 v7, 0x2

    .line 1012
    if-le v5, v7, :cond_2e

    .line 1013
    .line 1014
    :cond_2d
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1015
    .line 1016
    const-string v7, "notificationPriority is invalid "

    .line 1017
    .line 1018
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1019
    .line 1020
    .line 1021
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1022
    .line 1023
    .line 1024
    const-string v0, ". Skipping setting notificationPriority."

    .line 1025
    .line 1026
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1027
    .line 1028
    .line 1029
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    .line 1035
    .line 1036
    goto :goto_15

    .line 1037
    :cond_2e
    :goto_16
    if-eqz v0, :cond_2f

    .line 1038
    .line 1039
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1040
    .line 1041
    .line 1042
    move-result v0

    .line 1043
    iput v0, v15, Lt/i;->k:I

    .line 1044
    .line 1045
    :cond_2f
    const-string v0, "gcm.n.visibility"

    .line 1046
    .line 1047
    invoke-virtual {v8, v0}, LE/i;->m(Ljava/lang/String;)Ljava/lang/Integer;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v0

    .line 1051
    if-nez v0, :cond_30

    .line 1052
    .line 1053
    :goto_17
    const/4 v0, 0x0

    .line 1054
    goto :goto_18

    .line 1055
    :cond_30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1056
    .line 1057
    .line 1058
    move-result v5

    .line 1059
    const/4 v7, -0x1

    .line 1060
    if-lt v5, v7, :cond_31

    .line 1061
    .line 1062
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1063
    .line 1064
    .line 1065
    move-result v5

    .line 1066
    move/from16 v7, v17

    .line 1067
    .line 1068
    if-le v5, v7, :cond_32

    .line 1069
    .line 1070
    :cond_31
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1071
    .line 1072
    const-string v7, "visibility is invalid: "

    .line 1073
    .line 1074
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1078
    .line 1079
    .line 1080
    const-string v0, ". Skipping setting visibility."

    .line 1081
    .line 1082
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1083
    .line 1084
    .line 1085
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v0

    .line 1089
    const-string v5, "NotificationParams"

    .line 1090
    .line 1091
    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1092
    .line 1093
    .line 1094
    goto :goto_17

    .line 1095
    :cond_32
    :goto_18
    if-eqz v0, :cond_33

    .line 1096
    .line 1097
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1098
    .line 1099
    .line 1100
    move-result v0

    .line 1101
    iput v0, v15, Lt/i;->A:I

    .line 1102
    .line 1103
    :cond_33
    const-string v0, "gcm.n.notification_count"

    .line 1104
    .line 1105
    invoke-virtual {v8, v0}, LE/i;->m(Ljava/lang/String;)Ljava/lang/Integer;

    .line 1106
    .line 1107
    .line 1108
    move-result-object v0

    .line 1109
    if-nez v0, :cond_34

    .line 1110
    .line 1111
    :goto_19
    const/4 v0, 0x0

    .line 1112
    goto :goto_1a

    .line 1113
    :cond_34
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1114
    .line 1115
    .line 1116
    move-result v5

    .line 1117
    if-gez v5, :cond_35

    .line 1118
    .line 1119
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1120
    .line 1121
    const-string v7, "notificationCount is invalid: "

    .line 1122
    .line 1123
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1124
    .line 1125
    .line 1126
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1127
    .line 1128
    .line 1129
    const-string v0, ". Skipping setting notificationCount."

    .line 1130
    .line 1131
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1132
    .line 1133
    .line 1134
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1135
    .line 1136
    .line 1137
    move-result-object v0

    .line 1138
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1139
    .line 1140
    .line 1141
    goto :goto_19

    .line 1142
    :cond_35
    :goto_1a
    if-eqz v0, :cond_36

    .line 1143
    .line 1144
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1145
    .line 1146
    .line 1147
    move-result v0

    .line 1148
    iput v0, v15, Lt/i;->j:I

    .line 1149
    .line 1150
    :cond_36
    invoke-virtual {v8}, LE/i;->v()Ljava/lang/Long;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v0

    .line 1154
    if-eqz v0, :cond_37

    .line 1155
    .line 1156
    const/4 v7, 0x1

    .line 1157
    iput-boolean v7, v15, Lt/i;->l:Z

    .line 1158
    .line 1159
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 1160
    .line 1161
    .line 1162
    move-result-wide v9

    .line 1163
    iget-object v0, v15, Lt/i;->G:Landroid/app/Notification;

    .line 1164
    .line 1165
    iput-wide v9, v0, Landroid/app/Notification;->when:J

    .line 1166
    .line 1167
    :cond_37
    invoke-virtual {v8}, LE/i;->y()[J

    .line 1168
    .line 1169
    .line 1170
    move-result-object v0

    .line 1171
    if-eqz v0, :cond_38

    .line 1172
    .line 1173
    iget-object v5, v15, Lt/i;->G:Landroid/app/Notification;

    .line 1174
    .line 1175
    iput-object v0, v5, Landroid/app/Notification;->vibrate:[J

    .line 1176
    .line 1177
    :cond_38
    invoke-virtual {v8}, LE/i;->r()[I

    .line 1178
    .line 1179
    .line 1180
    move-result-object v0

    .line 1181
    if-eqz v0, :cond_3a

    .line 1182
    .line 1183
    aget v5, v0, v4

    .line 1184
    .line 1185
    const/16 v17, 0x1

    .line 1186
    .line 1187
    aget v7, v0, v17

    .line 1188
    .line 1189
    const/16 v18, 0x2

    .line 1190
    .line 1191
    aget v0, v0, v18

    .line 1192
    .line 1193
    iget-object v9, v15, Lt/i;->G:Landroid/app/Notification;

    .line 1194
    .line 1195
    iput v5, v9, Landroid/app/Notification;->ledARGB:I

    .line 1196
    .line 1197
    iput v7, v9, Landroid/app/Notification;->ledOnMS:I

    .line 1198
    .line 1199
    iput v0, v9, Landroid/app/Notification;->ledOffMS:I

    .line 1200
    .line 1201
    if-eqz v7, :cond_39

    .line 1202
    .line 1203
    if-eqz v0, :cond_39

    .line 1204
    .line 1205
    const/4 v0, 0x1

    .line 1206
    goto :goto_1b

    .line 1207
    :cond_39
    move v0, v4

    .line 1208
    :goto_1b
    iget v5, v9, Landroid/app/Notification;->flags:I

    .line 1209
    .line 1210
    and-int/2addr v2, v5

    .line 1211
    or-int/2addr v0, v2

    .line 1212
    iput v0, v9, Landroid/app/Notification;->flags:I

    .line 1213
    .line 1214
    :cond_3a
    const-string v0, "gcm.n.default_sound"

    .line 1215
    .line 1216
    invoke-virtual {v8, v0}, LE/i;->k(Ljava/lang/String;)Z

    .line 1217
    .line 1218
    .line 1219
    move-result v0

    .line 1220
    const-string v2, "gcm.n.default_vibrate_timings"

    .line 1221
    .line 1222
    invoke-virtual {v8, v2}, LE/i;->k(Ljava/lang/String;)Z

    .line 1223
    .line 1224
    .line 1225
    move-result v2

    .line 1226
    if-eqz v2, :cond_3b

    .line 1227
    .line 1228
    or-int/lit8 v0, v0, 0x2

    .line 1229
    .line 1230
    :cond_3b
    const-string v2, "gcm.n.default_light_settings"

    .line 1231
    .line 1232
    invoke-virtual {v8, v2}, LE/i;->k(Ljava/lang/String;)Z

    .line 1233
    .line 1234
    .line 1235
    move-result v2

    .line 1236
    if-eqz v2, :cond_3c

    .line 1237
    .line 1238
    or-int/lit8 v0, v0, 0x4

    .line 1239
    .line 1240
    :cond_3c
    iget-object v2, v15, Lt/i;->G:Landroid/app/Notification;

    .line 1241
    .line 1242
    iput v0, v2, Landroid/app/Notification;->defaults:I

    .line 1243
    .line 1244
    and-int/lit8 v0, v0, 0x4

    .line 1245
    .line 1246
    if-eqz v0, :cond_3d

    .line 1247
    .line 1248
    iget v0, v2, Landroid/app/Notification;->flags:I

    .line 1249
    .line 1250
    const/16 v17, 0x1

    .line 1251
    .line 1252
    or-int/lit8 v0, v0, 0x1

    .line 1253
    .line 1254
    iput v0, v2, Landroid/app/Notification;->flags:I

    .line 1255
    .line 1256
    :cond_3d
    const-string v0, "gcm.n.tag"

    .line 1257
    .line 1258
    invoke-virtual {v8, v0}, LE/i;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v0

    .line 1262
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1263
    .line 1264
    .line 1265
    move-result v2

    .line 1266
    if-nez v2, :cond_3e

    .line 1267
    .line 1268
    :goto_1c
    move-object v2, v0

    .line 1269
    goto :goto_1d

    .line 1270
    :cond_3e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1271
    .line 1272
    const-string v2, "FCM-Notification:"

    .line 1273
    .line 1274
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1275
    .line 1276
    .line 1277
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 1278
    .line 1279
    .line 1280
    move-result-wide v7

    .line 1281
    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 1282
    .line 1283
    .line 1284
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1285
    .line 1286
    .line 1287
    move-result-object v0

    .line 1288
    goto :goto_1c

    .line 1289
    :goto_1d
    if-nez v3, :cond_3f

    .line 1290
    .line 1291
    goto :goto_20

    .line 1292
    :cond_3f
    :try_start_6
    iget-object v0, v3, LV1/r;->g:Li1/p;

    .line 1293
    .line 1294
    invoke-static {v0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 1295
    .line 1296
    .line 1297
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1298
    .line 1299
    const-wide/16 v7, 0x5

    .line 1300
    .line 1301
    invoke-static {v0, v7, v8}, LV0/g;->b(Li1/h;J)Ljava/lang/Object;

    .line 1302
    .line 1303
    .line 1304
    move-result-object v0

    .line 1305
    check-cast v0, Landroid/graphics/Bitmap;

    .line 1306
    .line 1307
    invoke-virtual {v15, v0}, Lt/i;->d(Landroid/graphics/Bitmap;)V

    .line 1308
    .line 1309
    .line 1310
    new-instance v5, Lt/f;

    .line 1311
    .line 1312
    invoke-direct {v5}, Lt/A;-><init>()V

    .line 1313
    .line 1314
    .line 1315
    if-nez v0, :cond_40

    .line 1316
    .line 1317
    const/4 v0, 0x0

    .line 1318
    goto :goto_1e

    .line 1319
    :cond_40
    invoke-static {v0}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v0

    .line 1323
    :goto_1e
    iput-object v0, v5, Lt/f;->e:Landroidx/core/graphics/drawable/IconCompat;

    .line 1324
    .line 1325
    const/4 v7, 0x0

    .line 1326
    iput-object v7, v5, Lt/f;->f:Landroidx/core/graphics/drawable/IconCompat;

    .line 1327
    .line 1328
    const/4 v7, 0x1

    .line 1329
    iput-boolean v7, v5, Lt/f;->g:Z

    .line 1330
    .line 1331
    invoke-virtual {v15, v5}, Lt/i;->f(Lt/A;)V
    :try_end_6
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_6 .. :try_end_6} :catch_7

    .line 1332
    .line 1333
    .line 1334
    goto :goto_20

    .line 1335
    :catch_6
    move-exception v0

    .line 1336
    goto :goto_1f

    .line 1337
    :catch_7
    const-string v0, "Failed to download image in time, showing notification without it"

    .line 1338
    .line 1339
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1340
    .line 1341
    .line 1342
    invoke-virtual {v3}, LV1/r;->close()V

    .line 1343
    .line 1344
    .line 1345
    goto :goto_20

    .line 1346
    :catch_8
    const-string v0, "Interrupted while downloading image, showing notification without it"

    .line 1347
    .line 1348
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1349
    .line 1350
    .line 1351
    invoke-virtual {v3}, LV1/r;->close()V

    .line 1352
    .line 1353
    .line 1354
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 1355
    .line 1356
    .line 1357
    move-result-object v0

    .line 1358
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 1359
    .line 1360
    .line 1361
    goto :goto_20

    .line 1362
    :goto_1f
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1363
    .line 1364
    const-string v5, "Failed to download image: "

    .line 1365
    .line 1366
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1367
    .line 1368
    .line 1369
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1370
    .line 1371
    .line 1372
    move-result-object v0

    .line 1373
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1374
    .line 1375
    .line 1376
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1377
    .line 1378
    .line 1379
    move-result-object v0

    .line 1380
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1381
    .line 1382
    .line 1383
    :goto_20
    const/4 v0, 0x3

    .line 1384
    invoke-static {v6, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 1385
    .line 1386
    .line 1387
    move-result v0

    .line 1388
    if-eqz v0, :cond_41

    .line 1389
    .line 1390
    const-string v0, "Showing notification"

    .line 1391
    .line 1392
    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1393
    .line 1394
    .line 1395
    :cond_41
    iget-object v0, v1, LB2/a;->g:Ljava/lang/Object;

    .line 1396
    .line 1397
    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessagingService;

    .line 1398
    .line 1399
    const-string v3, "notification"

    .line 1400
    .line 1401
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 1402
    .line 1403
    .line 1404
    move-result-object v0

    .line 1405
    check-cast v0, Landroid/app/NotificationManager;

    .line 1406
    .line 1407
    invoke-virtual {v15}, Lt/i;->a()Landroid/app/Notification;

    .line 1408
    .line 1409
    .line 1410
    move-result-object v3

    .line 1411
    invoke-virtual {v0, v2, v4, v3}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 1412
    .line 1413
    .line 1414
    const/16 v17, 0x1

    .line 1415
    .line 1416
    return v17
.end method

.method public I(Ljava/lang/CharSequence;IILN/v;)Z
    .locals 7

    .line 1
    iget v0, p4, LN/v;->c:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, LN/g;

    .line 13
    .line 14
    invoke-virtual {p4}, LN/v;->b()LO/a;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    const/16 v5, 0x8

    .line 19
    .line 20
    invoke-virtual {v4, v5}, LD/r;->a(I)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    iget-object v6, v4, LD/r;->d:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v6, Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    iget v4, v4, LD/r;->a:I

    .line 31
    .line 32
    add-int/2addr v5, v4

    .line 33
    invoke-virtual {v6, v5}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 34
    .line 35
    .line 36
    :cond_0
    check-cast v0, LN/d;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    sget-object v4, LN/d;->b:Ljava/lang/ThreadLocal;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    new-instance v5, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 64
    .line 65
    .line 66
    :goto_0
    if-ge p2, p3, :cond_2

    .line 67
    .line 68
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    add-int/lit8 p2, p2, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p1, v0, LN/d;->a:Landroid/text/TextPaint;

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    sget p3, Lw/c;->a:I

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->hasGlyph(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget p2, p4, LN/v;->c:I

    .line 91
    .line 92
    and-int/lit8 p2, p2, 0x4

    .line 93
    .line 94
    if-eqz p1, :cond_3

    .line 95
    .line 96
    or-int/lit8 p1, p2, 0x2

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    or-int/lit8 p1, p2, 0x1

    .line 100
    .line 101
    :goto_1
    iput p1, p4, LN/v;->c:I

    .line 102
    .line 103
    :cond_4
    iget p1, p4, LN/v;->c:I

    .line 104
    .line 105
    and-int/lit8 p1, p1, 0x3

    .line 106
    .line 107
    if-ne p1, v1, :cond_5

    .line 108
    .line 109
    return v3

    .line 110
    :cond_5
    return v2
.end method

.method public K(I)Z
    .locals 5

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lx2/a;

    .line 6
    .line 7
    iget v2, v1, Lx2/a;->f:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-le v0, v2, :cond_0

    .line 11
    .line 12
    return v3

    .line 13
    :cond_0
    move v0, v3

    .line 14
    :goto_0
    const/4 v2, 0x5

    .line 15
    if-ge v0, v2, :cond_3

    .line 16
    .line 17
    add-int v2, v0, p1

    .line 18
    .line 19
    iget v4, v1, Lx2/a;->f:I

    .line 20
    .line 21
    if-ge v2, v4, :cond_3

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    if-ne v0, v4, :cond_1

    .line 25
    .line 26
    add-int/lit8 v2, p1, 0x2

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lx2/a;->a(I)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    return v3

    .line 35
    :cond_1
    invoke-virtual {v1, v2}, Lx2/a;->a(I)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    return v3

    .line 42
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const/4 p1, 0x1

    .line 46
    return p1
.end method

.method public M(Landroid/view/KeyEvent;)V
    .locals 9

    .line 1
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashSet;

    .line 4
    .line 5
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LZ2/y;

    .line 8
    .line 9
    if-eqz v1, :cond_c

    .line 10
    .line 11
    move-object v2, v1

    .line 12
    check-cast v2, LZ2/p;

    .line 13
    .line 14
    iget-object v2, v2, LZ2/p;->q:Lio/flutter/plugin/editing/k;

    .line 15
    .line 16
    iget-object v3, v2, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/inputmethod/InputMethodManager;->isAcceptingText()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    if-eqz v3, :cond_a

    .line 24
    .line 25
    iget-object v2, v2, Lio/flutter/plugin/editing/k;->j:Landroid/view/inputmethod/InputConnection;

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    instance-of v3, v2, Lio/flutter/plugin/editing/c;

    .line 32
    .line 33
    if-eqz v3, :cond_9

    .line 34
    .line 35
    check-cast v2, Lio/flutter/plugin/editing/c;

    .line 36
    .line 37
    iget-object v3, v2, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-nez v5, :cond_a

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/16 v6, 0x15

    .line 50
    .line 51
    const/4 v7, 0x1

    .line 52
    if-ne v5, v6, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {v2, v7, v3}, Lio/flutter/plugin/editing/c;->d(ZZ)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    goto/16 :goto_1

    .line 63
    .line 64
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    const/16 v6, 0x16

    .line 69
    .line 70
    if-ne v5, v6, :cond_2

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual {v2, v4, v3}, Lio/flutter/plugin/editing/c;->d(ZZ)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    goto/16 :goto_1

    .line 81
    .line 82
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    const/16 v6, 0x13

    .line 87
    .line 88
    if-ne v5, v6, :cond_3

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v2, v7, v3}, Lio/flutter/plugin/editing/c;->e(ZZ)Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    goto :goto_1

    .line 99
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    const/16 v6, 0x14

    .line 104
    .line 105
    if-ne v5, v6, :cond_4

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v2, v4, v3}, Lio/flutter/plugin/editing/c;->e(ZZ)Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    goto :goto_1

    .line 116
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    const/16 v6, 0x42

    .line 121
    .line 122
    if-eq v5, v6, :cond_5

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    const/16 v6, 0xa0

    .line 129
    .line 130
    if-ne v5, v6, :cond_6

    .line 131
    .line 132
    :cond_5
    iget-object v5, v2, Lio/flutter/plugin/editing/c;->e:Landroid/view/inputmethod/EditorInfo;

    .line 133
    .line 134
    iget v6, v5, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 135
    .line 136
    const/high16 v8, 0x20000

    .line 137
    .line 138
    and-int/2addr v6, v8

    .line 139
    if-nez v6, :cond_6

    .line 140
    .line 141
    iget v3, v5, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    .line 142
    .line 143
    and-int/lit16 v3, v3, 0xff

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Lio/flutter/plugin/editing/c;->performEditorAction(I)Z

    .line 146
    .line 147
    .line 148
    :goto_0
    move v4, v7

    .line 149
    goto :goto_1

    .line 150
    :cond_6
    invoke-static {v3}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    invoke-static {v3}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    .line 159
    .line 160
    .line 161
    move-result v8

    .line 162
    if-ltz v5, :cond_a

    .line 163
    .line 164
    if-ltz v6, :cond_a

    .line 165
    .line 166
    if-nez v8, :cond_7

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_7
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    invoke-virtual {v2}, Lio/flutter/plugin/editing/c;->beginBatchEdit()Z

    .line 178
    .line 179
    .line 180
    if-eq v4, v5, :cond_8

    .line 181
    .line 182
    invoke-virtual {v3, v4, v5}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 183
    .line 184
    .line 185
    :cond_8
    int-to-char v5, v8

    .line 186
    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    invoke-virtual {v3, v4, v5}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 191
    .line 192
    .line 193
    add-int/2addr v4, v7

    .line 194
    invoke-virtual {v2, v4, v4}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_9
    invoke-interface {v2, p1}, Landroid/view/inputmethod/InputConnection;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    :cond_a
    :goto_1
    if-eqz v4, :cond_b

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_b
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    check-cast v1, LZ2/p;

    .line 212
    .line 213
    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v1, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_c

    .line 225
    .line 226
    const-string p1, "KeyboardManager"

    .line 227
    .line 228
    const-string v0, "A redispatched key event was consumed before reaching KeyboardManager"

    .line 229
    .line 230
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    :cond_c
    :goto_2
    return-void
.end method

.method public N(Landroid/app/Activity;Lh0/j;)V
    .locals 3

    .line 1
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/WeakHashMap;

    .line 4
    .line 5
    const-string v1, "activity"

    .line 6
    .line 7
    invoke-static {p1, v1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lh0/j;

    .line 22
    .line 23
    invoke-virtual {p2, v2}, Lh0/j;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    :try_start_1
    invoke-virtual {v0, p1, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lh0/j;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, Lj3/b;

    .line 45
    .line 46
    iget-object v0, v0, Lj3/b;->f:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v0, Lk0/k;

    .line 49
    .line 50
    iget-object v0, v0, Lk0/k;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lk0/j;

    .line 67
    .line 68
    iget-object v2, v1, Lk0/j;->a:Landroid/app/Activity;

    .line 69
    .line 70
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iput-object p2, v1, Lk0/j;->c:Lh0/j;

    .line 78
    .line 79
    iget-object v1, v1, Lk0/j;->b:LZ2/l;

    .line 80
    .line 81
    invoke-virtual {v1, p2}, LZ2/l;->accept(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    return-void

    .line 86
    :catchall_0
    move-exception p1

    .line 87
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 88
    .line 89
    .line 90
    throw p1
.end method

.method public O(Ljava/lang/CharSequence;IIIZLN/o;)Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p6

    .line 10
    .line 11
    new-instance v5, LN/p;

    .line 12
    .line 13
    iget-object v6, v0, LB2/a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v6, LV1/y;

    .line 16
    .line 17
    iget-object v6, v6, LV1/y;->h:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v6, LN/s;

    .line 20
    .line 21
    invoke-direct {v5, v6}, LN/p;-><init>(LN/s;)V

    .line 22
    .line 23
    .line 24
    invoke-static/range {p1 .. p2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    const/4 v7, 0x0

    .line 29
    const/4 v8, 0x1

    .line 30
    move v9, v6

    .line 31
    move v10, v7

    .line 32
    move v11, v8

    .line 33
    move/from16 v6, p2

    .line 34
    .line 35
    :cond_0
    :goto_0
    move v7, v6

    .line 36
    :goto_1
    const/4 v12, 0x2

    .line 37
    if-ge v6, v2, :cond_f

    .line 38
    .line 39
    if-ge v10, v3, :cond_f

    .line 40
    .line 41
    if-eqz v11, :cond_f

    .line 42
    .line 43
    iget-object v13, v5, LN/p;->e:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v13, LN/s;

    .line 46
    .line 47
    iget-object v13, v13, LN/s;->a:Landroid/util/SparseArray;

    .line 48
    .line 49
    if-nez v13, :cond_1

    .line 50
    .line 51
    const/4 v13, 0x0

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    invoke-virtual {v13, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v13

    .line 57
    check-cast v13, LN/s;

    .line 58
    .line 59
    :goto_2
    iget v14, v5, LN/p;->a:I

    .line 60
    .line 61
    const/4 v15, 0x3

    .line 62
    if-eq v14, v12, :cond_3

    .line 63
    .line 64
    if-nez v13, :cond_2

    .line 65
    .line 66
    invoke-virtual {v5}, LN/p;->c()V

    .line 67
    .line 68
    .line 69
    :goto_3
    move v13, v8

    .line 70
    goto :goto_6

    .line 71
    :cond_2
    iput v12, v5, LN/p;->a:I

    .line 72
    .line 73
    iput-object v13, v5, LN/p;->e:Ljava/lang/Object;

    .line 74
    .line 75
    iput v8, v5, LN/p;->c:I

    .line 76
    .line 77
    :goto_4
    move v13, v12

    .line 78
    goto :goto_6

    .line 79
    :cond_3
    if-eqz v13, :cond_4

    .line 80
    .line 81
    iput-object v13, v5, LN/p;->e:Ljava/lang/Object;

    .line 82
    .line 83
    iget v13, v5, LN/p;->c:I

    .line 84
    .line 85
    add-int/2addr v13, v8

    .line 86
    iput v13, v5, LN/p;->c:I

    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_4
    const v13, 0xfe0e

    .line 90
    .line 91
    .line 92
    if-ne v9, v13, :cond_5

    .line 93
    .line 94
    invoke-virtual {v5}, LN/p;->c()V

    .line 95
    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_5
    const v13, 0xfe0f

    .line 99
    .line 100
    .line 101
    if-ne v9, v13, :cond_6

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_6
    iget-object v13, v5, LN/p;->e:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v13, LN/s;

    .line 107
    .line 108
    iget-object v14, v13, LN/s;->b:LN/v;

    .line 109
    .line 110
    if-eqz v14, :cond_9

    .line 111
    .line 112
    iget v14, v5, LN/p;->c:I

    .line 113
    .line 114
    if-ne v14, v8, :cond_8

    .line 115
    .line 116
    invoke-virtual {v5}, LN/p;->d()Z

    .line 117
    .line 118
    .line 119
    move-result v13

    .line 120
    if-eqz v13, :cond_7

    .line 121
    .line 122
    iget-object v13, v5, LN/p;->e:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v13, LN/s;

    .line 125
    .line 126
    iput-object v13, v5, LN/p;->f:Ljava/lang/Object;

    .line 127
    .line 128
    invoke-virtual {v5}, LN/p;->c()V

    .line 129
    .line 130
    .line 131
    :goto_5
    move v13, v15

    .line 132
    goto :goto_6

    .line 133
    :cond_7
    invoke-virtual {v5}, LN/p;->c()V

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_8
    iput-object v13, v5, LN/p;->f:Ljava/lang/Object;

    .line 138
    .line 139
    invoke-virtual {v5}, LN/p;->c()V

    .line 140
    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_9
    invoke-virtual {v5}, LN/p;->c()V

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :goto_6
    iput v9, v5, LN/p;->b:I

    .line 148
    .line 149
    if-eq v13, v8, :cond_e

    .line 150
    .line 151
    if-eq v13, v12, :cond_c

    .line 152
    .line 153
    if-eq v13, v15, :cond_a

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_a
    if-nez p5, :cond_b

    .line 157
    .line 158
    iget-object v12, v5, LN/p;->f:Ljava/lang/Object;

    .line 159
    .line 160
    check-cast v12, LN/s;

    .line 161
    .line 162
    iget-object v12, v12, LN/s;->b:LN/v;

    .line 163
    .line 164
    invoke-virtual {v0, v1, v7, v6, v12}, LB2/a;->I(Ljava/lang/CharSequence;IILN/v;)Z

    .line 165
    .line 166
    .line 167
    move-result v12

    .line 168
    if-nez v12, :cond_0

    .line 169
    .line 170
    :cond_b
    iget-object v11, v5, LN/p;->f:Ljava/lang/Object;

    .line 171
    .line 172
    check-cast v11, LN/s;

    .line 173
    .line 174
    iget-object v11, v11, LN/s;->b:LN/v;

    .line 175
    .line 176
    invoke-interface {v4, v1, v7, v6, v11}, LN/o;->t(Ljava/lang/CharSequence;IILN/v;)Z

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    add-int/lit8 v10, v10, 0x1

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :cond_c
    invoke-static {v9}, Ljava/lang/Character;->charCount(I)I

    .line 185
    .line 186
    .line 187
    move-result v12

    .line 188
    add-int/2addr v12, v6

    .line 189
    if-ge v12, v2, :cond_d

    .line 190
    .line 191
    invoke-static {v1, v12}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    move v9, v6

    .line 196
    :cond_d
    move v6, v12

    .line 197
    goto/16 :goto_1

    .line 198
    .line 199
    :cond_e
    invoke-static {v1, v7}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 204
    .line 205
    .line 206
    move-result v6

    .line 207
    add-int/2addr v6, v7

    .line 208
    if-ge v6, v2, :cond_0

    .line 209
    .line 210
    invoke-static {v1, v6}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 211
    .line 212
    .line 213
    move-result v7

    .line 214
    move v9, v7

    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :cond_f
    iget v2, v5, LN/p;->a:I

    .line 218
    .line 219
    if-ne v2, v12, :cond_12

    .line 220
    .line 221
    iget-object v2, v5, LN/p;->e:Ljava/lang/Object;

    .line 222
    .line 223
    check-cast v2, LN/s;

    .line 224
    .line 225
    iget-object v2, v2, LN/s;->b:LN/v;

    .line 226
    .line 227
    if-eqz v2, :cond_12

    .line 228
    .line 229
    iget v2, v5, LN/p;->c:I

    .line 230
    .line 231
    if-gt v2, v8, :cond_10

    .line 232
    .line 233
    invoke-virtual {v5}, LN/p;->d()Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-eqz v2, :cond_12

    .line 238
    .line 239
    :cond_10
    if-ge v10, v3, :cond_12

    .line 240
    .line 241
    if-eqz v11, :cond_12

    .line 242
    .line 243
    if-nez p5, :cond_11

    .line 244
    .line 245
    iget-object v2, v5, LN/p;->e:Ljava/lang/Object;

    .line 246
    .line 247
    check-cast v2, LN/s;

    .line 248
    .line 249
    iget-object v2, v2, LN/s;->b:LN/v;

    .line 250
    .line 251
    invoke-virtual {v0, v1, v7, v6, v2}, LB2/a;->I(Ljava/lang/CharSequence;IILN/v;)Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-nez v2, :cond_12

    .line 256
    .line 257
    :cond_11
    iget-object v2, v5, LN/p;->e:Ljava/lang/Object;

    .line 258
    .line 259
    check-cast v2, LN/s;

    .line 260
    .line 261
    iget-object v2, v2, LN/s;->b:LN/v;

    .line 262
    .line 263
    invoke-interface {v4, v1, v7, v6, v2}, LN/o;->t(Ljava/lang/CharSequence;IILN/v;)Z

    .line 264
    .line 265
    .line 266
    :cond_12
    invoke-interface {v4}, LN/o;->a()Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    return-object v1
.end method

.method public P(IIII)Z
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    add-int/2addr p1, p3

    .line 4
    add-int/lit8 v0, p3, 0x4

    .line 5
    .line 6
    and-int/lit8 v0, v0, 0x7

    .line 7
    .line 8
    rsub-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    add-int/2addr p2, v0

    .line 11
    :cond_0
    if-gez p2, :cond_1

    .line 12
    .line 13
    add-int/2addr p2, p4

    .line 14
    add-int/lit8 p4, p4, 0x4

    .line 15
    .line 16
    and-int/lit8 p4, p4, 0x7

    .line 17
    .line 18
    rsub-int/lit8 p4, p4, 0x4

    .line 19
    .line 20
    add-int/2addr p1, p4

    .line 21
    :cond_1
    if-lt p1, p3, :cond_2

    .line 22
    .line 23
    sub-int/2addr p1, p3

    .line 24
    :cond_2
    iget-object p3, p0, LB2/a;->g:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p3, Lx2/b;

    .line 27
    .line 28
    invoke-virtual {p3, p2, p1}, Lx2/b;->h(II)V

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, LB2/a;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p3, Lx2/b;

    .line 34
    .line 35
    invoke-virtual {p3, p2, p1}, Lx2/b;->b(II)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    return p1
.end method

.method public Q(IIII)I
    .locals 5

    .line 1
    add-int/lit8 v0, p1, -0x2

    .line 2
    .line 3
    add-int/lit8 v1, p2, -0x2

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, p3, p4}, LB2/a;->P(IIII)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    shl-int/lit8 v2, v2, 0x1

    .line 10
    .line 11
    add-int/lit8 v3, p2, -0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0, v3, p3, p4}, LB2/a;->P(IIII)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    or-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    :cond_0
    shl-int/lit8 v0, v2, 0x1

    .line 22
    .line 23
    add-int/lit8 v2, p1, -0x1

    .line 24
    .line 25
    invoke-virtual {p0, v2, v1, p3, p4}, LB2/a;->P(IIII)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    or-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    :cond_1
    shl-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    invoke-virtual {p0, v2, v3, p3, p4}, LB2/a;->P(IIII)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    or-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    :cond_2
    shl-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, v2, p2, p3, p4}, LB2/a;->P(IIII)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    or-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    :cond_3
    shl-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    invoke-virtual {p0, p1, v1, p3, p4}, LB2/a;->P(IIII)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    or-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    :cond_4
    shl-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    invoke-virtual {p0, p1, v3, p3, p4}, LB2/a;->P(IIII)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_5

    .line 70
    .line 71
    or-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    :cond_5
    shl-int/lit8 v0, v0, 0x1

    .line 74
    .line 75
    invoke-virtual {p0, p1, p2, p3, p4}, LB2/a;->P(IIII)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_6

    .line 80
    .line 81
    or-int/lit8 p1, v0, 0x1

    .line 82
    .line 83
    return p1

    .line 84
    :cond_6
    return v0
.end method

.method public R(Ljava/util/ArrayList;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, LX/a;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, LB2/a;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v3, LA/l;

    .line 20
    .line 21
    iget-object v4, v3, LA/l;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v4, [Ljava/lang/Object;

    .line 24
    .line 25
    const-string v5, "instance"

    .line 26
    .line 27
    invoke-static {v2, v5}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget v5, v3, LA/l;->a:I

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    :goto_1
    if-ge v6, v5, :cond_1

    .line 34
    .line 35
    aget-object v7, v4, v6

    .line 36
    .line 37
    if-eq v7, v2, :cond_0

    .line 38
    .line 39
    add-int/lit8 v6, v6, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string v0, "Already in the pool!"

    .line 45
    .line 46
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p1

    .line 50
    :cond_1
    iget v5, v3, LA/l;->a:I

    .line 51
    .line 52
    array-length v6, v4

    .line 53
    if-ge v5, v6, :cond_2

    .line 54
    .line 55
    aput-object v2, v4, v5

    .line 56
    .line 57
    add-int/lit8 v5, v5, 0x1

    .line 58
    .line 59
    iput v5, v3, LA/l;->a:I

    .line 60
    .line 61
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public S(Z)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ld1/g;

    .line 4
    .line 5
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, LZ0/r;->a:I

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0x12

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p1

    .line 21
    new-instance v0, Le1/x;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    throw v0
.end method

.method public a([B)[B
    .locals 6

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object v2, p0, LB2/a;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ljava/security/SecureRandom;

    .line 8
    .line 9
    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ljavax/crypto/spec/GCMParameterSpec;

    .line 13
    .line 14
    const/16 v3, 0x80

    .line 15
    .line 16
    invoke-direct {v2, v3, v1}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, LB2/a;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v3, Ljavax/crypto/Cipher;

    .line 22
    .line 23
    iget-object v4, p0, LB2/a;->h:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    invoke-virtual {v3, v5, v4, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    array-length v2, p1

    .line 36
    add-int/2addr v2, v0

    .line 37
    new-array v2, v2, [B

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    array-length v1, p1

    .line 44
    invoke-static {p1, v3, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    .line 46
    .line 47
    return-object v2
.end method

.method public b(Ljava/lang/Object;)V
    .locals 6

    .line 1
    invoke-static {p1}, LQ2/a;->v(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "FlutterSecureStorage"

    .line 5
    .line 6
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LQ2/b;

    .line 9
    .line 10
    iget-object v1, v0, LQ2/b;->i:LV1/y;

    .line 11
    .line 12
    :try_start_0
    const-string v2, "Step 6/7: Initializing current biometric cipher..."

    .line 13
    .line 14
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    iget-object v2, v0, LQ2/b;->j:LQ2/d;

    .line 18
    .line 19
    iget-object v3, v2, LQ2/d;->e:LD0/d;

    .line 20
    .line 21
    iget-object v4, v2, LQ2/d;->b:Landroid/content/Context;

    .line 22
    .line 23
    iget-object v5, p0, LB2/a;->f:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v5, Ljavax/crypto/Cipher;

    .line 26
    .line 27
    invoke-virtual {v3, v4, v5}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "Step 7/7: Encrypting all data with current biometric cipher..."

    .line 32
    .line 33
    invoke-static {p1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object v4, p0, LB2/a;->g:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v4, Ljava/util/HashMap;

    .line 39
    .line 40
    iget-object v0, v0, LQ2/b;->g:Landroid/content/SharedPreferences;

    .line 41
    .line 42
    invoke-static {v4, v0, v3}, LQ2/d;->e(Ljava/util/HashMap;Landroid/content/SharedPreferences;LR2/e;)V

    .line 43
    .line 44
    .line 45
    iput-object v3, v2, LQ2/d;->d:LR2/e;

    .line 46
    .line 47
    const-string v0, "Biometric\u2192Biometric migration completed! Data now uses new biometric cipher."

    .line 48
    .line 49
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {v1, v0}, LV1/y;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    const-string v2, "Failed to complete migration after second authentication"

    .line 59
    .line 60
    invoke-static {p1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public c(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "FlutterSecureKeyStorage"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "BVGhpcyBpcyB0aGUga2V5IGZvciBhIHNlY3VyZSBzdG9yYWdlIEFFUyBLZXkK"

    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public d([B)[B
    .locals 5

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    array-length v3, p1

    .line 10
    sub-int/2addr v3, v0

    .line 11
    new-array v4, v3, [B

    .line 12
    .line 13
    invoke-static {p1, v0, v4, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ljavax/crypto/spec/GCMParameterSpec;

    .line 17
    .line 18
    const/16 v0, 0x80

    .line 19
    .line 20
    invoke-direct {p1, v0, v1}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljavax/crypto/Cipher;

    .line 26
    .line 27
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    invoke-virtual {v0, v2, v1, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    return-object p1
.end method

.method public e(Le1/p;)Le1/o;
    .locals 4

    .line 1
    instance-of v0, p1, Le1/b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput v1, p1, Le1/p;->u:I

    .line 7
    .line 8
    :cond_0
    :try_start_0
    const-string v0, "MarkerOptions must not be null."

    .line 9
    .line 10
    invoke-static {p1, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ld1/g;

    .line 16
    .line 17
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2, p1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 22
    .line 23
    .line 24
    const/16 v3, 0xb

    .line 25
    .line 26
    invoke-virtual {v0, v2, v3}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 39
    .line 40
    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    iget p1, p1, Le1/p;->u:I

    .line 44
    .line 45
    if-ne p1, v1, :cond_1

    .line 46
    .line 47
    new-instance p1, Le1/a;

    .line 48
    .line 49
    invoke-direct {p1, v2}, Le1/o;-><init>(LZ0/f;)V

    .line 50
    .line 51
    .line 52
    return-object p1

    .line 53
    :catch_0
    move-exception p1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance p1, Le1/o;

    .line 56
    .line 57
    invoke-direct {p1, v2}, Le1/o;-><init>(LZ0/f;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_2
    const/4 p1, 0x0

    .line 62
    return-object p1

    .line 63
    :goto_0
    new-instance v0, Le1/x;

    .line 64
    .line 65
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    throw v0
.end method

.method public f(Li1/h;)V
    .locals 3

    .line 1
    iget-object p1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, LJ0/b;

    .line 4
    .line 5
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ljava/util/concurrent/ScheduledFuture;

    .line 12
    .line 13
    iget-object v2, p1, LJ0/b;->a:Lp/j;

    .line 14
    .line 15
    monitor-enter v2

    .line 16
    :try_start_0
    iget-object p1, p1, LJ0/b;->a:Lp/j;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lp/j;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-interface {v1, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public g(Le1/D;)Le1/C;
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ld1/g;

    .line 4
    .line 5
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1, p1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 10
    .line 11
    .line 12
    const/16 p1, 0xd

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, LZ0/n;->d:I

    .line 23
    .line 24
    const-string v1, "com.google.android.gms.maps.model.internal.ITileOverlayDelegate"

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    move-object v3, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-interface {v0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    instance-of v4, v3, LZ0/o;

    .line 36
    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    check-cast v3, LZ0/o;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance v3, LZ0/m;

    .line 43
    .line 44
    const/4 v4, 0x1

    .line 45
    invoke-direct {v3, v0, v1, v4}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 49
    .line 50
    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    new-instance p1, Le1/C;

    .line 54
    .line 55
    invoke-direct {p1, v3}, Le1/C;-><init>(LZ0/o;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-object p1

    .line 59
    :catch_0
    move-exception p1

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    return-object v2

    .line 62
    :goto_1
    new-instance v0, Le1/x;

    .line 63
    .line 64
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    throw v0
.end method

.method public get()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lx3/a;

    .line 4
    .line 5
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/content/Context;

    .line 10
    .line 11
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lx3/a;

    .line 14
    .line 15
    invoke-interface {v1}, Lx3/a;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, LF0/d;

    .line 20
    .line 21
    iget-object v2, p0, LB2/a;->h:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v2, LN0/f;

    .line 24
    .line 25
    invoke-virtual {v2}, LN0/f;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, LE0/b;

    .line 30
    .line 31
    new-instance v3, LE0/d;

    .line 32
    .line 33
    invoke-direct {v3, v0, v1, v2}, LE0/d;-><init>(Landroid/content/Context;LF0/d;LE0/b;)V

    .line 34
    .line 35
    .line 36
    return-object v3
.end method

.method public h(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    const-string v0, "FlutterSecureStorage"

    .line 2
    .line 3
    const-string v1, "Second biometric authentication failed for migration"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, LQ2/b;

    .line 11
    .line 12
    iget-object v0, v0, LQ2/b;->i:LV1/y;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/Exception;

    .line 15
    .line 16
    const-string v2, "Migration cancelled: Second biometric authentication failed"

    .line 17
    .line 18
    invoke-direct {v1, v2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public i()Lk1/m;
    .locals 5

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lk1/o;

    .line 4
    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lio/flutter/plugin/editing/j;

    .line 10
    .line 11
    if-eqz v1, :cond_8

    .line 12
    .line 13
    iget v2, v0, Lk1/o;->a:I

    .line 14
    .line 15
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lz1/a;

    .line 18
    .line 19
    iget-object v1, v1, Lz1/a;->a:[B

    .line 20
    .line 21
    array-length v1, v1

    .line 22
    if-ne v2, v1, :cond_7

    .line 23
    .line 24
    invoke-virtual {v0}, Lk1/o;->a()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 38
    .line 39
    const-string v1, "Cannot create key without ID requirement with parameters with ID requirement"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :cond_1
    :goto_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lk1/o;

    .line 48
    .line 49
    invoke-virtual {v0}, Lk1/o;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Ljava/lang/Integer;

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 63
    .line 64
    const-string v1, "Cannot create key with ID requirement with parameters without ID requirement"

    .line 65
    .line 66
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw v0

    .line 70
    :cond_3
    :goto_1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lk1/o;

    .line 73
    .line 74
    iget-object v0, v0, Lk1/o;->d:Lk1/k;

    .line 75
    .line 76
    sget-object v1, Lk1/k;->m:Lk1/k;

    .line 77
    .line 78
    if-ne v0, v1, :cond_4

    .line 79
    .line 80
    sget-object v0, Ls1/t;->a:Lz1/a;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    sget-object v1, Lk1/k;->l:Lk1/k;

    .line 84
    .line 85
    if-ne v0, v1, :cond_5

    .line 86
    .line 87
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v0}, Ls1/t;->a(I)Lz1/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    sget-object v1, Lk1/k;->k:Lk1/k;

    .line 101
    .line 102
    if-ne v0, v1, :cond_6

    .line 103
    .line 104
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v0, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {v0}, Ls1/t;->b(I)Lz1/a;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :goto_2
    new-instance v1, Lk1/m;

    .line 117
    .line 118
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Lk1/o;

    .line 121
    .line 122
    iget-object v3, p0, LB2/a;->g:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 125
    .line 126
    iget-object v4, p0, LB2/a;->h:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-direct {v1, v2, v3, v0, v4}, Lk1/m;-><init>(Lk1/o;Lio/flutter/plugin/editing/j;Lz1/a;Ljava/lang/Integer;)V

    .line 131
    .line 132
    .line 133
    return-object v1

    .line 134
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v2, "Unknown AesEaxParameters.Variant: "

    .line 139
    .line 140
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v2, Lk1/o;

    .line 146
    .line 147
    iget-object v2, v2, Lk1/o;->d:Lk1/k;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw v0

    .line 160
    :cond_7
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 161
    .line 162
    const-string v1, "Key size mismatch"

    .line 163
    .line 164
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw v0

    .line 168
    :cond_8
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 169
    .line 170
    const-string v1, "Cannot build without parameters and/or key material"

    .line 171
    .line 172
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    throw v0
.end method

.method public j()Lk1/p;
    .locals 5

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lk1/r;

    .line 4
    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lio/flutter/plugin/editing/j;

    .line 10
    .line 11
    if-eqz v1, :cond_8

    .line 12
    .line 13
    iget v2, v0, Lk1/r;->a:I

    .line 14
    .line 15
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lz1/a;

    .line 18
    .line 19
    iget-object v1, v1, Lz1/a;->a:[B

    .line 20
    .line 21
    array-length v1, v1

    .line 22
    if-ne v2, v1, :cond_7

    .line 23
    .line 24
    invoke-virtual {v0}, Lk1/r;->a()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 38
    .line 39
    const-string v1, "Cannot create key without ID requirement with parameters with ID requirement"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :cond_1
    :goto_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lk1/r;

    .line 48
    .line 49
    invoke-virtual {v0}, Lk1/r;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Ljava/lang/Integer;

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 63
    .line 64
    const-string v1, "Cannot create key with ID requirement with parameters without ID requirement"

    .line 65
    .line 66
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw v0

    .line 70
    :cond_3
    :goto_1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lk1/r;

    .line 73
    .line 74
    iget-object v0, v0, Lk1/r;->d:Lk1/k;

    .line 75
    .line 76
    sget-object v1, Lk1/k;->p:Lk1/k;

    .line 77
    .line 78
    if-ne v0, v1, :cond_4

    .line 79
    .line 80
    sget-object v0, Ls1/t;->a:Lz1/a;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    sget-object v1, Lk1/k;->o:Lk1/k;

    .line 84
    .line 85
    if-ne v0, v1, :cond_5

    .line 86
    .line 87
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v0}, Ls1/t;->a(I)Lz1/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    sget-object v1, Lk1/k;->n:Lk1/k;

    .line 101
    .line 102
    if-ne v0, v1, :cond_6

    .line 103
    .line 104
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v0, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {v0}, Ls1/t;->b(I)Lz1/a;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :goto_2
    new-instance v1, Lk1/p;

    .line 117
    .line 118
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Lk1/r;

    .line 121
    .line 122
    iget-object v3, p0, LB2/a;->g:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 125
    .line 126
    iget-object v4, p0, LB2/a;->h:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-direct {v1, v2, v3, v0, v4}, Lk1/p;-><init>(Lk1/r;Lio/flutter/plugin/editing/j;Lz1/a;Ljava/lang/Integer;)V

    .line 131
    .line 132
    .line 133
    return-object v1

    .line 134
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v2, "Unknown AesGcmParameters.Variant: "

    .line 139
    .line 140
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v2, Lk1/r;

    .line 146
    .line 147
    iget-object v2, v2, Lk1/r;->d:Lk1/k;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw v0

    .line 160
    :cond_7
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 161
    .line 162
    const-string v1, "Key size mismatch"

    .line 163
    .line 164
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw v0

    .line 168
    :cond_8
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 169
    .line 170
    const-string v1, "Cannot build without parameters and/or key material"

    .line 171
    .line 172
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    throw v0
.end method

.method public k()Lk1/s;
    .locals 5

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lk1/u;

    .line 4
    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lio/flutter/plugin/editing/j;

    .line 10
    .line 11
    if-eqz v1, :cond_8

    .line 12
    .line 13
    iget v2, v0, Lk1/u;->a:I

    .line 14
    .line 15
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lz1/a;

    .line 18
    .line 19
    iget-object v1, v1, Lz1/a;->a:[B

    .line 20
    .line 21
    array-length v1, v1

    .line 22
    if-ne v2, v1, :cond_7

    .line 23
    .line 24
    invoke-virtual {v0}, Lk1/u;->a()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 38
    .line 39
    const-string v1, "Cannot create key without ID requirement with parameters with ID requirement"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :cond_1
    :goto_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lk1/u;

    .line 48
    .line 49
    invoke-virtual {v0}, Lk1/u;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Ljava/lang/Integer;

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 63
    .line 64
    const-string v1, "Cannot create key with ID requirement with parameters without ID requirement"

    .line 65
    .line 66
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw v0

    .line 70
    :cond_3
    :goto_1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lk1/u;

    .line 73
    .line 74
    iget-object v0, v0, Lk1/u;->b:Lk1/k;

    .line 75
    .line 76
    sget-object v1, Lk1/k;->s:Lk1/k;

    .line 77
    .line 78
    if-ne v0, v1, :cond_4

    .line 79
    .line 80
    sget-object v0, Ls1/t;->a:Lz1/a;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    sget-object v1, Lk1/k;->r:Lk1/k;

    .line 84
    .line 85
    if-ne v0, v1, :cond_5

    .line 86
    .line 87
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v0}, Ls1/t;->a(I)Lz1/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    sget-object v1, Lk1/k;->q:Lk1/k;

    .line 101
    .line 102
    if-ne v0, v1, :cond_6

    .line 103
    .line 104
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v0, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {v0}, Ls1/t;->b(I)Lz1/a;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :goto_2
    new-instance v1, Lk1/s;

    .line 117
    .line 118
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Lk1/u;

    .line 121
    .line 122
    iget-object v3, p0, LB2/a;->g:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 125
    .line 126
    iget-object v4, p0, LB2/a;->h:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-direct {v1, v2, v3, v0, v4}, Lk1/s;-><init>(Lk1/u;Lio/flutter/plugin/editing/j;Lz1/a;Ljava/lang/Integer;)V

    .line 131
    .line 132
    .line 133
    return-object v1

    .line 134
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v2, "Unknown AesGcmSivParameters.Variant: "

    .line 139
    .line 140
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, LB2/a;->f:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v2, Lk1/u;

    .line 146
    .line 147
    iget-object v2, v2, Lk1/u;->b:Lk1/k;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw v0

    .line 160
    :cond_7
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 161
    .line 162
    const-string v1, "Key size mismatch"

    .line 163
    .line 164
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw v0

    .line 168
    :cond_8
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 169
    .line 170
    const-string v1, "Cannot build without parameters and/or key material"

    .line 171
    .line 172
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    throw v0
.end method

.method public m(ILjava/lang/StringBuilder;)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0, v1, p1}, LB2/a;->n(Ljava/lang/String;I)LI2/j;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v1, LI2/j;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v2}, LI2/n;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-boolean v2, v1, LI2/j;->d:Z

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    iget v2, v1, LI2/j;->c:I

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move-object v2, v0

    .line 30
    :goto_1
    iget v1, v1, LI2/l;->a:I

    .line 31
    .line 32
    if-ne p1, v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    return-object p1

    .line 39
    :cond_2
    move p1, v1

    .line 40
    move-object v1, v2

    .line 41
    goto :goto_0
.end method

.method public n(Ljava/lang/String;I)LI2/j;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, LB2/a;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Lx2/a;

    .line 8
    .line 9
    iget-object v3, v0, LB2/a;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v3, LB2/e;

    .line 12
    .line 13
    iget-object v4, v0, LB2/a;->h:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v4, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 19
    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    :cond_0
    move/from16 v1, p2

    .line 27
    .line 28
    iput v1, v3, LB2/e;->b:I

    .line 29
    .line 30
    :goto_0
    iget v1, v3, LB2/e;->b:I

    .line 31
    .line 32
    iget v6, v3, LB2/e;->c:I

    .line 33
    .line 34
    const/16 v7, 0x24

    .line 35
    .line 36
    const/16 v15, 0x3a

    .line 37
    .line 38
    const/16 v5, 0x20

    .line 39
    .line 40
    const/16 v10, 0xf

    .line 41
    .line 42
    const/16 v11, 0x3f

    .line 43
    .line 44
    const/16 v12, 0x10

    .line 45
    .line 46
    const/4 v13, 0x5

    .line 47
    const/4 v14, 0x2

    .line 48
    if-ne v6, v14, :cond_e

    .line 49
    .line 50
    :goto_1
    iget v6, v3, LB2/e;->b:I

    .line 51
    .line 52
    add-int/lit8 v14, v6, 0x5

    .line 53
    .line 54
    iget v8, v2, Lx2/a;->f:I

    .line 55
    .line 56
    if-le v14, v8, :cond_1

    .line 57
    .line 58
    goto/16 :goto_6

    .line 59
    .line 60
    :cond_1
    invoke-static {v6, v13, v2}, LB2/a;->t(IILx2/a;)I

    .line 61
    .line 62
    .line 63
    move-result v14

    .line 64
    const/4 v9, 0x6

    .line 65
    if-lt v14, v13, :cond_2

    .line 66
    .line 67
    if-ge v14, v12, :cond_2

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    add-int/lit8 v14, v6, 0x6

    .line 71
    .line 72
    if-le v14, v8, :cond_3

    .line 73
    .line 74
    goto/16 :goto_6

    .line 75
    .line 76
    :cond_3
    invoke-static {v6, v9, v2}, LB2/a;->t(IILx2/a;)I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-lt v6, v12, :cond_8

    .line 81
    .line 82
    if-ge v6, v11, :cond_8

    .line 83
    .line 84
    :goto_2
    iget v6, v3, LB2/e;->b:I

    .line 85
    .line 86
    invoke-static {v6, v13, v2}, LB2/a;->t(IILx2/a;)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-ne v8, v10, :cond_4

    .line 91
    .line 92
    new-instance v8, LI2/i;

    .line 93
    .line 94
    add-int/lit8 v6, v6, 0x5

    .line 95
    .line 96
    invoke-direct {v8, v7, v6}, LI2/i;-><init>(CI)V

    .line 97
    .line 98
    .line 99
    goto :goto_5

    .line 100
    :cond_4
    if-lt v8, v13, :cond_5

    .line 101
    .line 102
    if-ge v8, v10, :cond_5

    .line 103
    .line 104
    new-instance v9, LI2/i;

    .line 105
    .line 106
    add-int/lit8 v6, v6, 0x5

    .line 107
    .line 108
    add-int/lit8 v8, v8, 0x2b

    .line 109
    .line 110
    int-to-char v8, v8

    .line 111
    invoke-direct {v9, v8, v6}, LI2/i;-><init>(CI)V

    .line 112
    .line 113
    .line 114
    :goto_3
    move-object v8, v9

    .line 115
    goto :goto_5

    .line 116
    :cond_5
    invoke-static {v6, v9, v2}, LB2/a;->t(IILx2/a;)I

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    if-lt v8, v5, :cond_6

    .line 121
    .line 122
    if-ge v8, v15, :cond_6

    .line 123
    .line 124
    new-instance v9, LI2/i;

    .line 125
    .line 126
    add-int/lit8 v6, v6, 0x6

    .line 127
    .line 128
    add-int/lit8 v8, v8, 0x21

    .line 129
    .line 130
    int-to-char v8, v8

    .line 131
    invoke-direct {v9, v8, v6}, LI2/i;-><init>(CI)V

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_6
    packed-switch v8, :pswitch_data_0

    .line 136
    .line 137
    .line 138
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 139
    .line 140
    const-string v2, "Decoding invalid alphanumeric value: "

    .line 141
    .line 142
    invoke-static {v2, v8}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    throw v1

    .line 150
    :pswitch_0
    const/16 v8, 0x2f

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :pswitch_1
    const/16 v8, 0x2e

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :pswitch_2
    const/16 v8, 0x2d

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :pswitch_3
    const/16 v8, 0x2c

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :pswitch_4
    const/16 v8, 0x2a

    .line 163
    .line 164
    :goto_4
    new-instance v9, LI2/i;

    .line 165
    .line 166
    add-int/lit8 v6, v6, 0x6

    .line 167
    .line 168
    invoke-direct {v9, v8, v6}, LI2/i;-><init>(CI)V

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :goto_5
    iget v6, v8, LI2/l;->a:I

    .line 173
    .line 174
    iput v6, v3, LB2/e;->b:I

    .line 175
    .line 176
    iget-char v8, v8, LI2/i;->b:C

    .line 177
    .line 178
    if-ne v8, v7, :cond_7

    .line 179
    .line 180
    new-instance v5, LI2/j;

    .line 181
    .line 182
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    invoke-direct {v5, v7, v6}, LI2/j;-><init>(Ljava/lang/String;I)V

    .line 187
    .line 188
    .line 189
    new-instance v6, LI2/h;

    .line 190
    .line 191
    const/4 v7, 0x1

    .line 192
    invoke-direct {v6, v5, v7}, LI2/h;-><init>(Ljava/lang/Object;Z)V

    .line 193
    .line 194
    .line 195
    goto :goto_c

    .line 196
    :cond_7
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :cond_8
    :goto_6
    iget v5, v3, LB2/e;->b:I

    .line 202
    .line 203
    add-int/lit8 v6, v5, 0x3

    .line 204
    .line 205
    iget v7, v2, Lx2/a;->f:I

    .line 206
    .line 207
    if-le v6, v7, :cond_9

    .line 208
    .line 209
    goto :goto_8

    .line 210
    :cond_9
    :goto_7
    if-ge v5, v6, :cond_c

    .line 211
    .line 212
    invoke-virtual {v2, v5}, Lx2/a;->a(I)Z

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    if-eqz v7, :cond_b

    .line 217
    .line 218
    :goto_8
    iget v5, v3, LB2/e;->b:I

    .line 219
    .line 220
    invoke-virtual {v0, v5}, LB2/a;->K(I)Z

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    if-eqz v5, :cond_d

    .line 225
    .line 226
    iget v5, v3, LB2/e;->b:I

    .line 227
    .line 228
    add-int/lit8 v6, v5, 0x5

    .line 229
    .line 230
    if-ge v6, v8, :cond_a

    .line 231
    .line 232
    add-int/lit8 v5, v5, 0x5

    .line 233
    .line 234
    iput v5, v3, LB2/e;->b:I

    .line 235
    .line 236
    :goto_9
    const/4 v9, 0x3

    .line 237
    goto :goto_a

    .line 238
    :cond_a
    iput v8, v3, LB2/e;->b:I

    .line 239
    .line 240
    goto :goto_9

    .line 241
    :goto_a
    iput v9, v3, LB2/e;->c:I

    .line 242
    .line 243
    goto :goto_b

    .line 244
    :cond_b
    const/4 v9, 0x3

    .line 245
    add-int/lit8 v5, v5, 0x1

    .line 246
    .line 247
    goto :goto_7

    .line 248
    :cond_c
    const/4 v9, 0x3

    .line 249
    iget v5, v3, LB2/e;->b:I

    .line 250
    .line 251
    add-int/2addr v5, v9

    .line 252
    iput v5, v3, LB2/e;->b:I

    .line 253
    .line 254
    const/4 v7, 0x1

    .line 255
    iput v7, v3, LB2/e;->c:I

    .line 256
    .line 257
    :cond_d
    :goto_b
    new-instance v6, LI2/h;

    .line 258
    .line 259
    invoke-direct {v6}, LI2/h;-><init>()V

    .line 260
    .line 261
    .line 262
    :goto_c
    iget-boolean v5, v6, LI2/h;->a:Z

    .line 263
    .line 264
    :goto_d
    const/4 v10, 0x1

    .line 265
    goto/16 :goto_27

    .line 266
    .line 267
    :cond_e
    const/4 v9, 0x3

    .line 268
    const/16 v8, 0x8

    .line 269
    .line 270
    const/4 v5, 0x7

    .line 271
    if-ne v6, v9, :cond_1f

    .line 272
    .line 273
    :goto_e
    iget v6, v3, LB2/e;->b:I

    .line 274
    .line 275
    add-int/lit8 v9, v6, 0x5

    .line 276
    .line 277
    iget v11, v2, Lx2/a;->f:I

    .line 278
    .line 279
    if-le v9, v11, :cond_f

    .line 280
    .line 281
    goto/16 :goto_13

    .line 282
    .line 283
    :cond_f
    invoke-static {v6, v13, v2}, LB2/a;->t(IILx2/a;)I

    .line 284
    .line 285
    .line 286
    move-result v9

    .line 287
    const/16 v15, 0x74

    .line 288
    .line 289
    const/16 v14, 0x40

    .line 290
    .line 291
    if-lt v9, v13, :cond_10

    .line 292
    .line 293
    if-ge v9, v12, :cond_10

    .line 294
    .line 295
    goto :goto_f

    .line 296
    :cond_10
    add-int/lit8 v9, v6, 0x7

    .line 297
    .line 298
    if-le v9, v11, :cond_11

    .line 299
    .line 300
    goto/16 :goto_13

    .line 301
    .line 302
    :cond_11
    invoke-static {v6, v5, v2}, LB2/a;->t(IILx2/a;)I

    .line 303
    .line 304
    .line 305
    move-result v9

    .line 306
    if-lt v9, v14, :cond_12

    .line 307
    .line 308
    if-ge v9, v15, :cond_12

    .line 309
    .line 310
    goto :goto_f

    .line 311
    :cond_12
    add-int/lit8 v9, v6, 0x8

    .line 312
    .line 313
    if-le v9, v11, :cond_13

    .line 314
    .line 315
    goto/16 :goto_13

    .line 316
    .line 317
    :cond_13
    invoke-static {v6, v8, v2}, LB2/a;->t(IILx2/a;)I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    const/16 v9, 0xe8

    .line 322
    .line 323
    if-lt v6, v9, :cond_19

    .line 324
    .line 325
    const/16 v9, 0xfd

    .line 326
    .line 327
    if-ge v6, v9, :cond_19

    .line 328
    .line 329
    :goto_f
    iget v6, v3, LB2/e;->b:I

    .line 330
    .line 331
    invoke-static {v6, v13, v2}, LB2/a;->t(IILx2/a;)I

    .line 332
    .line 333
    .line 334
    move-result v9

    .line 335
    if-ne v9, v10, :cond_14

    .line 336
    .line 337
    new-instance v9, LI2/i;

    .line 338
    .line 339
    add-int/lit8 v6, v6, 0x5

    .line 340
    .line 341
    invoke-direct {v9, v7, v6}, LI2/i;-><init>(CI)V

    .line 342
    .line 343
    .line 344
    goto/16 :goto_12

    .line 345
    .line 346
    :cond_14
    if-lt v9, v13, :cond_15

    .line 347
    .line 348
    if-ge v9, v10, :cond_15

    .line 349
    .line 350
    new-instance v11, LI2/i;

    .line 351
    .line 352
    add-int/lit8 v6, v6, 0x5

    .line 353
    .line 354
    add-int/lit8 v9, v9, 0x2b

    .line 355
    .line 356
    int-to-char v9, v9

    .line 357
    invoke-direct {v11, v9, v6}, LI2/i;-><init>(CI)V

    .line 358
    .line 359
    .line 360
    :goto_10
    move-object v9, v11

    .line 361
    goto/16 :goto_12

    .line 362
    .line 363
    :cond_15
    invoke-static {v6, v5, v2}, LB2/a;->t(IILx2/a;)I

    .line 364
    .line 365
    .line 366
    move-result v9

    .line 367
    const/16 v11, 0x5a

    .line 368
    .line 369
    if-lt v9, v14, :cond_16

    .line 370
    .line 371
    if-ge v9, v11, :cond_16

    .line 372
    .line 373
    new-instance v11, LI2/i;

    .line 374
    .line 375
    add-int/lit8 v6, v6, 0x7

    .line 376
    .line 377
    add-int/lit8 v9, v9, 0x1

    .line 378
    .line 379
    int-to-char v9, v9

    .line 380
    invoke-direct {v11, v9, v6}, LI2/i;-><init>(CI)V

    .line 381
    .line 382
    .line 383
    goto :goto_10

    .line 384
    :cond_16
    if-lt v9, v11, :cond_17

    .line 385
    .line 386
    if-ge v9, v15, :cond_17

    .line 387
    .line 388
    new-instance v11, LI2/i;

    .line 389
    .line 390
    add-int/lit8 v6, v6, 0x7

    .line 391
    .line 392
    add-int/lit8 v9, v9, 0x7

    .line 393
    .line 394
    int-to-char v9, v9

    .line 395
    invoke-direct {v11, v9, v6}, LI2/i;-><init>(CI)V

    .line 396
    .line 397
    .line 398
    goto :goto_10

    .line 399
    :cond_17
    invoke-static {v6, v8, v2}, LB2/a;->t(IILx2/a;)I

    .line 400
    .line 401
    .line 402
    move-result v9

    .line 403
    packed-switch v9, :pswitch_data_1

    .line 404
    .line 405
    .line 406
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    throw v1

    .line 411
    :pswitch_5
    const/16 v9, 0x20

    .line 412
    .line 413
    goto :goto_11

    .line 414
    :pswitch_6
    const/16 v9, 0x5f

    .line 415
    .line 416
    goto :goto_11

    .line 417
    :pswitch_7
    const/16 v9, 0x3f

    .line 418
    .line 419
    goto :goto_11

    .line 420
    :pswitch_8
    const/16 v9, 0x3e

    .line 421
    .line 422
    goto :goto_11

    .line 423
    :pswitch_9
    const/16 v9, 0x3d

    .line 424
    .line 425
    goto :goto_11

    .line 426
    :pswitch_a
    const/16 v9, 0x3c

    .line 427
    .line 428
    goto :goto_11

    .line 429
    :pswitch_b
    const/16 v9, 0x3b

    .line 430
    .line 431
    goto :goto_11

    .line 432
    :pswitch_c
    const/16 v9, 0x3a

    .line 433
    .line 434
    goto :goto_11

    .line 435
    :pswitch_d
    const/16 v9, 0x2f

    .line 436
    .line 437
    goto :goto_11

    .line 438
    :pswitch_e
    const/16 v9, 0x2e

    .line 439
    .line 440
    goto :goto_11

    .line 441
    :pswitch_f
    const/16 v9, 0x2d

    .line 442
    .line 443
    goto :goto_11

    .line 444
    :pswitch_10
    const/16 v9, 0x2c

    .line 445
    .line 446
    goto :goto_11

    .line 447
    :pswitch_11
    const/16 v9, 0x2b

    .line 448
    .line 449
    goto :goto_11

    .line 450
    :pswitch_12
    const/16 v9, 0x2a

    .line 451
    .line 452
    goto :goto_11

    .line 453
    :pswitch_13
    const/16 v9, 0x29

    .line 454
    .line 455
    goto :goto_11

    .line 456
    :pswitch_14
    const/16 v9, 0x28

    .line 457
    .line 458
    goto :goto_11

    .line 459
    :pswitch_15
    const/16 v9, 0x27

    .line 460
    .line 461
    goto :goto_11

    .line 462
    :pswitch_16
    const/16 v9, 0x26

    .line 463
    .line 464
    goto :goto_11

    .line 465
    :pswitch_17
    const/16 v9, 0x25

    .line 466
    .line 467
    goto :goto_11

    .line 468
    :pswitch_18
    const/16 v9, 0x22

    .line 469
    .line 470
    goto :goto_11

    .line 471
    :pswitch_19
    const/16 v9, 0x21

    .line 472
    .line 473
    :goto_11
    new-instance v11, LI2/i;

    .line 474
    .line 475
    add-int/lit8 v6, v6, 0x8

    .line 476
    .line 477
    invoke-direct {v11, v9, v6}, LI2/i;-><init>(CI)V

    .line 478
    .line 479
    .line 480
    goto :goto_10

    .line 481
    :goto_12
    iget v6, v9, LI2/l;->a:I

    .line 482
    .line 483
    iput v6, v3, LB2/e;->b:I

    .line 484
    .line 485
    iget-char v9, v9, LI2/i;->b:C

    .line 486
    .line 487
    if-ne v9, v7, :cond_18

    .line 488
    .line 489
    new-instance v5, LI2/j;

    .line 490
    .line 491
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v7

    .line 495
    invoke-direct {v5, v7, v6}, LI2/j;-><init>(Ljava/lang/String;I)V

    .line 496
    .line 497
    .line 498
    new-instance v6, LI2/h;

    .line 499
    .line 500
    const/4 v7, 0x1

    .line 501
    invoke-direct {v6, v5, v7}, LI2/h;-><init>(Ljava/lang/Object;Z)V

    .line 502
    .line 503
    .line 504
    goto :goto_19

    .line 505
    :cond_18
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 506
    .line 507
    .line 508
    const/16 v11, 0x3f

    .line 509
    .line 510
    const/4 v14, 0x2

    .line 511
    const/16 v15, 0x3a

    .line 512
    .line 513
    goto/16 :goto_e

    .line 514
    .line 515
    :cond_19
    :goto_13
    iget v5, v3, LB2/e;->b:I

    .line 516
    .line 517
    add-int/lit8 v6, v5, 0x3

    .line 518
    .line 519
    iget v7, v2, Lx2/a;->f:I

    .line 520
    .line 521
    if-le v6, v7, :cond_1a

    .line 522
    .line 523
    goto :goto_15

    .line 524
    :cond_1a
    :goto_14
    if-ge v5, v6, :cond_1d

    .line 525
    .line 526
    invoke-virtual {v2, v5}, Lx2/a;->a(I)Z

    .line 527
    .line 528
    .line 529
    move-result v7

    .line 530
    if-eqz v7, :cond_1c

    .line 531
    .line 532
    :goto_15
    iget v5, v3, LB2/e;->b:I

    .line 533
    .line 534
    invoke-virtual {v0, v5}, LB2/a;->K(I)Z

    .line 535
    .line 536
    .line 537
    move-result v5

    .line 538
    if-eqz v5, :cond_1e

    .line 539
    .line 540
    iget v5, v3, LB2/e;->b:I

    .line 541
    .line 542
    add-int/lit8 v6, v5, 0x5

    .line 543
    .line 544
    iget v7, v2, Lx2/a;->f:I

    .line 545
    .line 546
    if-ge v6, v7, :cond_1b

    .line 547
    .line 548
    add-int/lit8 v5, v5, 0x5

    .line 549
    .line 550
    iput v5, v3, LB2/e;->b:I

    .line 551
    .line 552
    :goto_16
    const/4 v5, 0x2

    .line 553
    goto :goto_17

    .line 554
    :cond_1b
    iput v7, v3, LB2/e;->b:I

    .line 555
    .line 556
    goto :goto_16

    .line 557
    :goto_17
    iput v5, v3, LB2/e;->c:I

    .line 558
    .line 559
    goto :goto_18

    .line 560
    :cond_1c
    add-int/lit8 v5, v5, 0x1

    .line 561
    .line 562
    goto :goto_14

    .line 563
    :cond_1d
    iget v5, v3, LB2/e;->b:I

    .line 564
    .line 565
    const/16 v16, 0x3

    .line 566
    .line 567
    add-int/lit8 v5, v5, 0x3

    .line 568
    .line 569
    iput v5, v3, LB2/e;->b:I

    .line 570
    .line 571
    const/4 v7, 0x1

    .line 572
    iput v7, v3, LB2/e;->c:I

    .line 573
    .line 574
    :cond_1e
    :goto_18
    new-instance v5, LI2/h;

    .line 575
    .line 576
    invoke-direct {v5}, LI2/h;-><init>()V

    .line 577
    .line 578
    .line 579
    move-object v6, v5

    .line 580
    :goto_19
    iget-boolean v5, v6, LI2/h;->a:Z

    .line 581
    .line 582
    goto/16 :goto_d

    .line 583
    .line 584
    :cond_1f
    :goto_1a
    iget v6, v3, LB2/e;->b:I

    .line 585
    .line 586
    add-int/lit8 v7, v6, 0x7

    .line 587
    .line 588
    iget v9, v2, Lx2/a;->f:I

    .line 589
    .line 590
    if-le v7, v9, :cond_21

    .line 591
    .line 592
    add-int/lit8 v6, v6, 0x4

    .line 593
    .line 594
    if-gt v6, v9, :cond_20

    .line 595
    .line 596
    :goto_1b
    const/4 v6, 0x1

    .line 597
    goto :goto_1d

    .line 598
    :cond_20
    const/4 v6, 0x0

    .line 599
    goto :goto_1d

    .line 600
    :cond_21
    move v7, v6

    .line 601
    :goto_1c
    add-int/lit8 v10, v6, 0x3

    .line 602
    .line 603
    if-ge v7, v10, :cond_23

    .line 604
    .line 605
    invoke-virtual {v2, v7}, Lx2/a;->a(I)Z

    .line 606
    .line 607
    .line 608
    move-result v10

    .line 609
    if-eqz v10, :cond_22

    .line 610
    .line 611
    goto :goto_1b

    .line 612
    :cond_22
    add-int/lit8 v7, v7, 0x1

    .line 613
    .line 614
    goto :goto_1c

    .line 615
    :cond_23
    invoke-virtual {v2, v10}, Lx2/a;->a(I)Z

    .line 616
    .line 617
    .line 618
    move-result v6

    .line 619
    :goto_1d
    const/4 v7, 0x4

    .line 620
    if-eqz v6, :cond_2c

    .line 621
    .line 622
    iget v6, v3, LB2/e;->b:I

    .line 623
    .line 624
    add-int/lit8 v10, v6, 0x7

    .line 625
    .line 626
    const/16 v11, 0xa

    .line 627
    .line 628
    if-le v10, v9, :cond_25

    .line 629
    .line 630
    invoke-static {v6, v7, v2}, LB2/a;->t(IILx2/a;)I

    .line 631
    .line 632
    .line 633
    move-result v6

    .line 634
    if-nez v6, :cond_24

    .line 635
    .line 636
    new-instance v6, LI2/k;

    .line 637
    .line 638
    invoke-direct {v6, v9, v11, v11}, LI2/k;-><init>(III)V

    .line 639
    .line 640
    .line 641
    goto :goto_1e

    .line 642
    :cond_24
    new-instance v7, LI2/k;

    .line 643
    .line 644
    add-int/lit8 v6, v6, -0x1

    .line 645
    .line 646
    invoke-direct {v7, v9, v6, v11}, LI2/k;-><init>(III)V

    .line 647
    .line 648
    .line 649
    move-object v6, v7

    .line 650
    goto :goto_1e

    .line 651
    :cond_25
    invoke-static {v6, v5, v2}, LB2/a;->t(IILx2/a;)I

    .line 652
    .line 653
    .line 654
    move-result v6

    .line 655
    sub-int/2addr v6, v8

    .line 656
    div-int/lit8 v7, v6, 0xb

    .line 657
    .line 658
    rem-int/lit8 v6, v6, 0xb

    .line 659
    .line 660
    new-instance v9, LI2/k;

    .line 661
    .line 662
    invoke-direct {v9, v10, v7, v6}, LI2/k;-><init>(III)V

    .line 663
    .line 664
    .line 665
    move-object v6, v9

    .line 666
    :goto_1e
    iget v7, v6, LI2/l;->a:I

    .line 667
    .line 668
    iput v7, v3, LB2/e;->b:I

    .line 669
    .line 670
    iget v9, v6, LI2/k;->b:I

    .line 671
    .line 672
    if-ne v9, v11, :cond_26

    .line 673
    .line 674
    const/4 v10, 0x1

    .line 675
    goto :goto_1f

    .line 676
    :cond_26
    const/4 v10, 0x0

    .line 677
    :goto_1f
    iget v6, v6, LI2/k;->c:I

    .line 678
    .line 679
    if-eqz v10, :cond_29

    .line 680
    .line 681
    if-ne v6, v11, :cond_27

    .line 682
    .line 683
    const/4 v5, 0x1

    .line 684
    goto :goto_20

    .line 685
    :cond_27
    const/4 v5, 0x0

    .line 686
    :goto_20
    if-eqz v5, :cond_28

    .line 687
    .line 688
    new-instance v5, LI2/j;

    .line 689
    .line 690
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v6

    .line 694
    invoke-direct {v5, v6, v7}, LI2/j;-><init>(Ljava/lang/String;I)V

    .line 695
    .line 696
    .line 697
    goto :goto_21

    .line 698
    :cond_28
    new-instance v5, LI2/j;

    .line 699
    .line 700
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v8

    .line 704
    invoke-direct {v5, v7, v6, v8}, LI2/j;-><init>(IILjava/lang/String;)V

    .line 705
    .line 706
    .line 707
    :goto_21
    new-instance v6, LI2/h;

    .line 708
    .line 709
    const/4 v7, 0x1

    .line 710
    invoke-direct {v6, v5, v7}, LI2/h;-><init>(Ljava/lang/Object;Z)V

    .line 711
    .line 712
    .line 713
    move v10, v7

    .line 714
    goto :goto_26

    .line 715
    :cond_29
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 716
    .line 717
    .line 718
    if-ne v6, v11, :cond_2a

    .line 719
    .line 720
    const/4 v7, 0x1

    .line 721
    goto :goto_22

    .line 722
    :cond_2a
    const/4 v7, 0x0

    .line 723
    :goto_22
    if-eqz v7, :cond_2b

    .line 724
    .line 725
    new-instance v5, LI2/j;

    .line 726
    .line 727
    iget v6, v3, LB2/e;->b:I

    .line 728
    .line 729
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 730
    .line 731
    .line 732
    move-result-object v7

    .line 733
    invoke-direct {v5, v7, v6}, LI2/j;-><init>(Ljava/lang/String;I)V

    .line 734
    .line 735
    .line 736
    new-instance v6, LI2/h;

    .line 737
    .line 738
    const/4 v10, 0x1

    .line 739
    invoke-direct {v6, v5, v10}, LI2/h;-><init>(Ljava/lang/Object;Z)V

    .line 740
    .line 741
    .line 742
    goto :goto_26

    .line 743
    :cond_2b
    const/4 v10, 0x1

    .line 744
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 745
    .line 746
    .line 747
    goto/16 :goto_1a

    .line 748
    .line 749
    :cond_2c
    const/4 v10, 0x1

    .line 750
    iget v5, v3, LB2/e;->b:I

    .line 751
    .line 752
    add-int/lit8 v6, v5, 0x1

    .line 753
    .line 754
    if-le v6, v9, :cond_2d

    .line 755
    .line 756
    :goto_23
    const/4 v5, 0x0

    .line 757
    goto :goto_25

    .line 758
    :cond_2d
    const/4 v6, 0x0

    .line 759
    :goto_24
    if-ge v6, v7, :cond_2f

    .line 760
    .line 761
    add-int v8, v6, v5

    .line 762
    .line 763
    if-ge v8, v9, :cond_2f

    .line 764
    .line 765
    invoke-virtual {v2, v8}, Lx2/a;->a(I)Z

    .line 766
    .line 767
    .line 768
    move-result v8

    .line 769
    if-eqz v8, :cond_2e

    .line 770
    .line 771
    goto :goto_23

    .line 772
    :cond_2e
    add-int/lit8 v6, v6, 0x1

    .line 773
    .line 774
    goto :goto_24

    .line 775
    :cond_2f
    move v5, v10

    .line 776
    :goto_25
    if-eqz v5, :cond_30

    .line 777
    .line 778
    const/4 v5, 0x2

    .line 779
    iput v5, v3, LB2/e;->c:I

    .line 780
    .line 781
    iget v5, v3, LB2/e;->b:I

    .line 782
    .line 783
    add-int/2addr v5, v7

    .line 784
    iput v5, v3, LB2/e;->b:I

    .line 785
    .line 786
    :cond_30
    new-instance v5, LI2/h;

    .line 787
    .line 788
    invoke-direct {v5}, LI2/h;-><init>()V

    .line 789
    .line 790
    .line 791
    move-object v6, v5

    .line 792
    :goto_26
    iget-boolean v5, v6, LI2/h;->a:Z

    .line 793
    .line 794
    :goto_27
    iget v7, v3, LB2/e;->b:I

    .line 795
    .line 796
    if-eq v1, v7, :cond_31

    .line 797
    .line 798
    move v9, v10

    .line 799
    goto :goto_28

    .line 800
    :cond_31
    const/4 v9, 0x0

    .line 801
    :goto_28
    if-nez v9, :cond_32

    .line 802
    .line 803
    if-nez v5, :cond_32

    .line 804
    .line 805
    goto :goto_29

    .line 806
    :cond_32
    if-eqz v5, :cond_34

    .line 807
    .line 808
    :goto_29
    iget-object v1, v6, LI2/h;->b:Ljava/lang/Object;

    .line 809
    .line 810
    check-cast v1, LI2/j;

    .line 811
    .line 812
    if-eqz v1, :cond_33

    .line 813
    .line 814
    iget-boolean v2, v1, LI2/j;->d:Z

    .line 815
    .line 816
    if-eqz v2, :cond_33

    .line 817
    .line 818
    new-instance v2, LI2/j;

    .line 819
    .line 820
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 821
    .line 822
    .line 823
    move-result-object v3

    .line 824
    iget v1, v1, LI2/j;->c:I

    .line 825
    .line 826
    invoke-direct {v2, v7, v1, v3}, LI2/j;-><init>(IILjava/lang/String;)V

    .line 827
    .line 828
    .line 829
    return-object v2

    .line 830
    :cond_33
    new-instance v1, LI2/j;

    .line 831
    .line 832
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 833
    .line 834
    .line 835
    move-result-object v2

    .line 836
    invoke-direct {v1, v2, v7}, LI2/j;-><init>(Ljava/lang/String;I)V

    .line 837
    .line 838
    .line 839
    return-object v1

    .line 840
    :cond_34
    const/4 v5, 0x0

    .line 841
    goto/16 :goto_0

    .line 842
    .line 843
    :pswitch_data_0
    .packed-switch 0x3a
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    :pswitch_data_1
    .packed-switch 0xe8
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public onMethodCall(Lk3/l;Lk3/n;)V
    .locals 10

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lk3/l;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "getDeviceInfo"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_8

    .line 15
    .line 16
    new-instance p1, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v0, "board"

    .line 22
    .line 23
    sget-object v1, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string v0, "bootloader"

    .line 29
    .line 30
    sget-object v1, Landroid/os/Build;->BOOTLOADER:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "brand"

    .line 38
    .line 39
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 43
    .line 44
    const-string v2, "device"

    .line 45
    .line 46
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const-string v2, "display"

    .line 50
    .line 51
    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    sget-object v2, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 57
    .line 58
    const-string v3, "fingerprint"

    .line 59
    .line 60
    invoke-virtual {p1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    sget-object v3, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 64
    .line 65
    const-string v4, "hardware"

    .line 66
    .line 67
    invoke-virtual {p1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    const-string v4, "host"

    .line 71
    .line 72
    sget-object v5, Landroid/os/Build;->HOST:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    const-string v4, "id"

    .line 78
    .line 79
    sget-object v5, Landroid/os/Build;->ID:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 85
    .line 86
    const-string v5, "manufacturer"

    .line 87
    .line 88
    invoke-virtual {p1, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 92
    .line 93
    const-string v6, "model"

    .line 94
    .line 95
    invoke-virtual {p1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    sget-object v6, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 99
    .line 100
    const-string v7, "product"

    .line 101
    .line 102
    invoke-virtual {p1, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 106
    .line 107
    const/16 v8, 0x19

    .line 108
    .line 109
    if-lt v7, v8, :cond_1

    .line 110
    .line 111
    iget-object v7, p0, LB2/a;->h:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v7, Landroid/content/ContentResolver;

    .line 114
    .line 115
    const-string v8, "device_name"

    .line 116
    .line 117
    invoke-static {v7, v8}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    if-nez v7, :cond_0

    .line 122
    .line 123
    const-string v7, ""

    .line 124
    .line 125
    :cond_0
    const-string v8, "name"

    .line 126
    .line 127
    invoke-virtual {p1, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    :cond_1
    sget-object v7, Landroid/os/Build;->SUPPORTED_32_BIT_ABIS:[Ljava/lang/String;

    .line 131
    .line 132
    array-length v8, v7

    .line 133
    invoke-static {v7, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    invoke-static {v7}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    const-string v8, "supported32BitAbis"

    .line 142
    .line 143
    invoke-virtual {p1, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    sget-object v7, Landroid/os/Build;->SUPPORTED_64_BIT_ABIS:[Ljava/lang/String;

    .line 147
    .line 148
    array-length v8, v7

    .line 149
    invoke-static {v7, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    invoke-static {v7}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    const-string v8, "supported64BitAbis"

    .line 158
    .line 159
    invoke-virtual {p1, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    sget-object v7, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    .line 163
    .line 164
    array-length v8, v7

    .line 165
    invoke-static {v7, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    invoke-static {v7}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    const-string v8, "supportedAbis"

    .line 174
    .line 175
    invoke-virtual {p1, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    const-string v7, "tags"

    .line 179
    .line 180
    sget-object v8, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {p1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    const-string v7, "type"

    .line 186
    .line 187
    sget-object v8, Landroid/os/Build;->TYPE:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    const-string v7, "BRAND"

    .line 193
    .line 194
    invoke-static {v0, v7}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    const-string v7, "generic"

    .line 198
    .line 199
    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    const/4 v8, 0x0

    .line 204
    const/4 v9, 0x1

    .line 205
    if-eqz v0, :cond_2

    .line 206
    .line 207
    const-string v0, "DEVICE"

    .line 208
    .line 209
    invoke-static {v1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_4

    .line 217
    .line 218
    :cond_2
    const-string v0, "FINGERPRINT"

    .line 219
    .line 220
    invoke-static {v2, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-nez v0, :cond_4

    .line 228
    .line 229
    const-string v0, "unknown"

    .line 230
    .line 231
    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_4

    .line 236
    .line 237
    const-string v0, "HARDWARE"

    .line 238
    .line 239
    invoke-static {v3, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    const-string v0, "goldfish"

    .line 243
    .line 244
    invoke-static {v3, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_4

    .line 249
    .line 250
    const-string v0, "ranchu"

    .line 251
    .line 252
    invoke-static {v3, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_4

    .line 257
    .line 258
    const-string v0, "MODEL"

    .line 259
    .line 260
    invoke-static {v5, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    const-string v0, "google_sdk"

    .line 264
    .line 265
    invoke-static {v5, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-nez v0, :cond_4

    .line 270
    .line 271
    const-string v0, "Emulator"

    .line 272
    .line 273
    invoke-static {v5, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-nez v0, :cond_4

    .line 278
    .line 279
    const-string v0, "Android SDK built for x86"

    .line 280
    .line 281
    invoke-static {v5, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_4

    .line 286
    .line 287
    const-string v0, "MANUFACTURER"

    .line 288
    .line 289
    invoke-static {v4, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    const-string v0, "Genymotion"

    .line 293
    .line 294
    invoke-static {v4, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-nez v0, :cond_4

    .line 299
    .line 300
    const-string v0, "PRODUCT"

    .line 301
    .line 302
    invoke-static {v6, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    const-string v0, "sdk"

    .line 306
    .line 307
    invoke-static {v6, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-nez v0, :cond_4

    .line 312
    .line 313
    const-string v0, "vbox86p"

    .line 314
    .line 315
    invoke-static {v6, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-nez v0, :cond_4

    .line 320
    .line 321
    const-string v0, "emulator"

    .line 322
    .line 323
    invoke-static {v6, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    if-nez v0, :cond_4

    .line 328
    .line 329
    const-string v0, "simulator"

    .line 330
    .line 331
    invoke-static {v6, v0}, LM3/l;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-eqz v0, :cond_3

    .line 336
    .line 337
    goto :goto_0

    .line 338
    :cond_3
    move v0, v8

    .line 339
    goto :goto_1

    .line 340
    :cond_4
    :goto_0
    move v0, v9

    .line 341
    :goto_1
    xor-int/2addr v0, v9

    .line 342
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    const-string v1, "isPhysicalDevice"

    .line 347
    .line 348
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 352
    .line 353
    check-cast v0, Landroid/content/pm/PackageManager;

    .line 354
    .line 355
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getSystemAvailableFeatures()[Landroid/content/pm/FeatureInfo;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    const-string v1, "getSystemAvailableFeatures(...)"

    .line 360
    .line 361
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    new-instance v1, Ljava/util/ArrayList;

    .line 365
    .line 366
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 367
    .line 368
    .line 369
    array-length v2, v0

    .line 370
    move v3, v8

    .line 371
    :goto_2
    if-ge v3, v2, :cond_6

    .line 372
    .line 373
    aget-object v4, v0, v3

    .line 374
    .line 375
    iget-object v5, v4, Landroid/content/pm/FeatureInfo;->name:Ljava/lang/String;

    .line 376
    .line 377
    if-nez v5, :cond_5

    .line 378
    .line 379
    goto :goto_3

    .line 380
    :cond_5
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 384
    .line 385
    goto :goto_2

    .line 386
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    .line 387
    .line 388
    invoke-static {v1}, Lz3/f;->T(Ljava/lang/Iterable;)I

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    :goto_4
    if-ge v8, v2, :cond_7

    .line 400
    .line 401
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    add-int/lit8 v8, v8, 0x1

    .line 406
    .line 407
    check-cast v3, Landroid/content/pm/FeatureInfo;

    .line 408
    .line 409
    iget-object v3, v3, Landroid/content/pm/FeatureInfo;->name:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    goto :goto_4

    .line 415
    :cond_7
    const-string v1, "systemFeatures"

    .line 416
    .line 417
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    new-instance v0, Landroid/os/StatFs;

    .line 421
    .line 422
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v1

    .line 430
    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v0}, Landroid/os/StatFs;->getFreeBytes()J

    .line 434
    .line 435
    .line 436
    move-result-wide v1

    .line 437
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    const-string v2, "freeDiskSize"

    .line 442
    .line 443
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v0}, Landroid/os/StatFs;->getTotalBytes()J

    .line 447
    .line 448
    .line 449
    move-result-wide v0

    .line 450
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 451
    .line 452
    .line 453
    move-result-object v0

    .line 454
    const-string v1, "totalDiskSize"

    .line 455
    .line 456
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    new-instance v0, Ljava/util/HashMap;

    .line 460
    .line 461
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 462
    .line 463
    .line 464
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 465
    .line 466
    const-string v2, "baseOS"

    .line 467
    .line 468
    sget-object v3, Landroid/os/Build$VERSION;->BASE_OS:Ljava/lang/String;

    .line 469
    .line 470
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    .line 472
    .line 473
    sget v2, Landroid/os/Build$VERSION;->PREVIEW_SDK_INT:I

    .line 474
    .line 475
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 476
    .line 477
    .line 478
    move-result-object v2

    .line 479
    const-string v3, "previewSdkInt"

    .line 480
    .line 481
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    const-string v2, "securityPatch"

    .line 485
    .line 486
    sget-object v3, Landroid/os/Build$VERSION;->SECURITY_PATCH:Ljava/lang/String;

    .line 487
    .line 488
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    const-string v2, "codename"

    .line 492
    .line 493
    sget-object v3, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    .line 494
    .line 495
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    const-string v2, "incremental"

    .line 499
    .line 500
    sget-object v3, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    .line 501
    .line 502
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    const-string v2, "release"

    .line 506
    .line 507
    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 508
    .line 509
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    const-string v2, "sdkInt"

    .line 513
    .line 514
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    const-string v1, "version"

    .line 522
    .line 523
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    .line 527
    .line 528
    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 529
    .line 530
    .line 531
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 532
    .line 533
    check-cast v1, Landroid/app/ActivityManager;

    .line 534
    .line 535
    invoke-virtual {v1, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 536
    .line 537
    .line 538
    iget-boolean v1, v0, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    .line 539
    .line 540
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    const-string v2, "isLowRamDevice"

    .line 545
    .line 546
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    iget-wide v1, v0, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 550
    .line 551
    const-wide/32 v3, 0x100000

    .line 552
    .line 553
    .line 554
    div-long/2addr v1, v3

    .line 555
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 556
    .line 557
    .line 558
    move-result-object v1

    .line 559
    const-string v2, "physicalRamSize"

    .line 560
    .line 561
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 565
    .line 566
    div-long/2addr v0, v3

    .line 567
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    const-string v1, "availableRamSize"

    .line 572
    .line 573
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    .line 575
    .line 576
    check-cast p2, LQ2/g;

    .line 577
    .line 578
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :cond_8
    check-cast p2, LQ2/g;

    .line 583
    .line 584
    invoke-virtual {p2}, LQ2/g;->b()V

    .line 585
    .line 586
    .line 587
    return-void
.end method

.method public p(Ljava/nio/ByteBuffer;Lb3/g;)V
    .locals 11

    .line 1
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LZ2/s;

    .line 8
    .line 9
    iget-object v2, p0, LB2/a;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, LB2/a;

    .line 12
    .line 13
    iget-object v3, v2, LB2/a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v3, Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, v2, LB2/a;->h:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Lk3/p;

    .line 20
    .line 21
    invoke-interface {v2, p1}, Lk3/p;->d(Ljava/nio/ByteBuffer;)Lk3/l;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p1, p1, Lk3/l;->a:Ljava/lang/String;

    .line 26
    .line 27
    const-string v4, "listen"

    .line 28
    .line 29
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const-string v5, "error"

    .line 34
    .line 35
    const-string v6, "EventChannel#"

    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    new-instance p1, Lk3/g;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Lk3/g;-><init>(LB2/a;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lk3/g;

    .line 50
    .line 51
    if-eqz v4, :cond_0

    .line 52
    .line 53
    :try_start_0
    iput-object v7, v1, LZ2/s;->g:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catch_0
    move-exception v4

    .line 57
    new-instance v8, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    const-string v9, "Failed to close existing event stream"

    .line 70
    .line 71
    invoke-static {v8, v9, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    .line 73
    .line 74
    :cond_0
    :goto_0
    :try_start_1
    iget-object v4, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v4, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    const/4 v9, 0x0

    .line 83
    :goto_1
    if-ge v9, v8, :cond_1

    .line 84
    .line 85
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    add-int/lit8 v9, v9, 0x1

    .line 90
    .line 91
    check-cast v10, Ljava/util/Map;

    .line 92
    .line 93
    invoke-virtual {p1, v10}, Lk3/g;->a(Ljava/util/Map;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 98
    .line 99
    .line 100
    iput-object p1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 101
    .line 102
    invoke-interface {v2, v7}, Lk3/p;->a(Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :catch_1
    move-exception p1

    .line 111
    invoke-virtual {v0, v7}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const-string v1, "Failed to open event stream"

    .line 127
    .line 128
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {v2, v5, p1, v7}, Lk3/p;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_2
    const-string v4, "cancel"

    .line 144
    .line 145
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_4

    .line 150
    .line 151
    invoke-virtual {v0, v7}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Lk3/g;

    .line 156
    .line 157
    if-eqz p1, :cond_3

    .line 158
    .line 159
    :try_start_2
    iput-object v7, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 160
    .line 161
    invoke-interface {v2, v7}, Lk3/p;->a(Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :catch_2
    move-exception p1

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const-string v1, "Failed to close event stream"

    .line 183
    .line 184
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-interface {v2, v5, p1, v7}, Lk3/p;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 196
    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_3
    const-string p1, "No active stream to cancel"

    .line 200
    .line 201
    invoke-interface {v2, v5, p1, v7}, Lk3/p;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 206
    .line 207
    .line 208
    :goto_2
    return-void

    .line 209
    :cond_4
    invoke-virtual {p2, v7}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public q(ILio/flutter/view/f;)V
    .locals 1

    .line 1
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/embedding/engine/FlutterJNI;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lio/flutter/embedding/engine/FlutterJNI;->dispatchSemanticsAction(ILio/flutter/view/f;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r(ILio/flutter/view/f;Ljava/io/Serializable;)V
    .locals 1

    .line 1
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/embedding/engine/FlutterJNI;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Lio/flutter/embedding/engine/FlutterJNI;->dispatchSemanticsAction(ILio/flutter/view/f;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    .locals 4

    .line 1
    new-instance v0, LL1/f;

    .line 2
    .line 3
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/HashMap;

    .line 6
    .line 7
    iget-object v2, p0, LB2/a;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/HashMap;

    .line 10
    .line 11
    iget-object v3, p0, LB2/a;->h:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v3, LI1/d;

    .line 14
    .line 15
    invoke-direct {v0, p2, v1, v2, v3}, LL1/f;-><init>(Ljava/io/ByteArrayOutputStream;Ljava/util/HashMap;Ljava/util/HashMap;LI1/d;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, LI1/d;

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-interface {p2, p1, v0}, LI1/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance p2, LI1/b;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "No encoder for "

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, LB2/a;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :sswitch_0
    invoke-virtual {p0}, LB2/a;->y()Lx1/g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lj1/j;->a(Lx1/g0;)Lx1/k0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0

    .line 24
    :sswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "DartCallback( bundle path: "

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ", library path: "

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, Lio/flutter/view/FlutterCallbackInformation;

    .line 46
    .line 47
    iget-object v2, v1, Lio/flutter/view/FlutterCallbackInformation;->callbackLibraryPath:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v2, ", function: "

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v1, v1, Lio/flutter/view/FlutterCallbackInformation;->callbackName:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, " )"

    .line 60
    .line 61
    invoke-static {v0, v1, v2}, Lr/a;->c(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    return-object v0

    .line 66
    :sswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, LB2/a;->g:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v1, LX/b;

    .line 74
    .line 75
    invoke-virtual {v1}, LX/b;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v1, ", hidden list:"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, LB2/a;->h:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    return-object v0

    .line 103
    :sswitch_data_0
    .sparse-switch
        0xe -> :sswitch_2
        0x12 -> :sswitch_1
        0x15 -> :sswitch_0
    .end sparse-switch
.end method

.method public u(II)I
    .locals 3

    .line 1
    iget-object v0, p0, LB2/a;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    :goto_0
    if-ge p2, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, LX/a;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return p1
.end method

.method public w(I)Lj1/f;
    .locals 4

    .line 1
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    if-ltz p1, :cond_2

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge p1, v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lj1/f;

    .line 18
    .line 19
    iget-object v2, v1, Lj1/f;->b:Lx1/Z;

    .line 20
    .line 21
    invoke-static {v2}, LB2/a;->L(Lx1/Z;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const-string v3, "Keyset-Entry at position "

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-boolean v1, v1, Lj1/f;->f:Z

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lj1/f;

    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string v1, " didn\'t parse correctly"

    .line 43
    .line 44
    invoke-static {p1, v3, v1}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw v0

    .line 52
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string v1, " has wrong status"

    .line 55
    .line 56
    invoke-static {p1, v3, v1}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :cond_2
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    .line 65
    .line 66
    const-string v2, "Invalid index "

    .line 67
    .line 68
    const-string v3, " for keyset of size "

    .line 69
    .line 70
    invoke-static {p1, v2, v3}, LE1/j;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw v1
.end method

.method public x()Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ld1/g;

    .line 4
    .line 5
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/google/android/gms/maps/model/CameraPosition;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 15
    .line 16
    invoke-static {v0, v1}, LZ0/r;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/google/android/gms/maps/model/CameraPosition;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catch_0
    move-exception v0

    .line 27
    new-instance v1, Le1/x;

    .line 28
    .line 29
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    throw v1
.end method

.method public y()Lx1/g0;
    .locals 6

    .line 1
    :try_start_0
    invoke-static {}, Lx1/g0;->F()Lx1/d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, LB2/a;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lj1/f;

    .line 24
    .line 25
    invoke-virtual {v2}, Lj1/f;->a()Landroid/support/v4/media/session/a;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget v4, v2, Lj1/f;->d:I

    .line 30
    .line 31
    iget-object v5, v2, Lj1/f;->b:Lx1/Z;

    .line 32
    .line 33
    invoke-static {v3, v5, v4}, LB2/a;->l(Landroid/support/v4/media/session/a;Lx1/Z;I)Lx1/f0;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 38
    .line 39
    .line 40
    iget-object v5, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 41
    .line 42
    check-cast v5, Lx1/g0;

    .line 43
    .line 44
    invoke-static {v5, v3}, Lx1/g0;->A(Lx1/g0;Lx1/f0;)V

    .line 45
    .line 46
    .line 47
    iget-boolean v2, v2, Lj1/f;->e:Z

    .line 48
    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 52
    .line 53
    .line 54
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 55
    .line 56
    check-cast v2, Lx1/g0;

    .line 57
    .line 58
    invoke-static {v2, v4}, Lx1/g0;->z(Lx1/g0;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lx1/g0;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    return-object v0

    .line 71
    :goto_1
    new-instance v1, LD1/n;

    .line 72
    .line 73
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    throw v1
.end method

.method public z(Ls3/j;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, LB2/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ld1/h;

    .line 4
    .line 5
    new-instance v1, Lc1/i;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v1, p0, p1, v2, v3}, Lc1/i;-><init>(LB2/a;Ls3/j;ZS)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1, v1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x9

    .line 20
    .line 21
    invoke-virtual {v0, p1, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p1

    .line 26
    new-instance v0, Le1/x;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw v0
.end method
