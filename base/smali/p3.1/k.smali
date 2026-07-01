.class public final synthetic Lp3/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/b;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lp3/l;


# direct methods
.method public synthetic constructor <init>(Lp3/l;I)V
    .locals 0

    .line 1
    iput p2, p0, Lp3/k;->e:I

    iput-object p1, p0, Lp3/k;->f:Lp3/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 5

    .line 1
    iget v0, p0, Lp3/k;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lp3/i;

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    invoke-direct {v0, p1, p2, v1}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lp3/k;->f:Lp3/l;

    .line 18
    .line 19
    check-cast p1, Lp3/d;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    new-instance p2, Li1/i;

    .line 25
    .line 26
    invoke-direct {p2}, Li1/i;-><init>()V

    .line 27
    .line 28
    .line 29
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 30
    .line 31
    new-instance v2, Lp3/b;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-direct {v2, p1, p2, v3}, Lp3/b;-><init>(Lp3/d;Li1/i;I)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, LD1/a;

    .line 41
    .line 42
    const/16 v1, 0xd

    .line 43
    .line 44
    invoke-direct {p1, v1, v0}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p2, Li1/i;->a:Li1/p;

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Li1/p;->f(Li1/c;)Li1/p;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_0
    new-instance p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    new-instance v0, Lp3/i;

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    invoke-direct {v0, p1, p2, v1}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lp3/k;->f:Lp3/l;

    .line 65
    .line 66
    check-cast p1, Lp3/d;

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    new-instance p2, Li1/i;

    .line 72
    .line 73
    invoke-direct {p2}, Li1/i;-><init>()V

    .line 74
    .line 75
    .line 76
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 77
    .line 78
    new-instance v2, Lp3/b;

    .line 79
    .line 80
    const/4 v3, 0x1

    .line 81
    invoke-direct {v2, p1, p2, v3}, Lp3/b;-><init>(Lp3/d;Li1/i;I)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    new-instance p1, LD1/a;

    .line 88
    .line 89
    const/16 v1, 0xd

    .line 90
    .line 91
    invoke-direct {p1, v1, v0}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p2, Li1/i;->a:Li1/p;

    .line 95
    .line 96
    invoke-virtual {p2, p1}, Li1/p;->f(Li1/c;)Li1/p;

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :pswitch_1
    new-instance v0, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    check-cast p1, Ljava/util/ArrayList;

    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Ljava/lang/String;

    .line 113
    .line 114
    const/4 v2, 0x1

    .line 115
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Lp3/f;

    .line 120
    .line 121
    new-instance v2, Lp3/i;

    .line 122
    .line 123
    const/4 v3, 0x3

    .line 124
    invoke-direct {v2, v0, p2, v3}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lp3/k;->f:Lp3/l;

    .line 128
    .line 129
    check-cast p2, Lp3/d;

    .line 130
    .line 131
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    new-instance v0, Li1/i;

    .line 135
    .line 136
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 137
    .line 138
    .line 139
    sget-object v3, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 140
    .line 141
    new-instance v4, LQ2/f;

    .line 142
    .line 143
    invoke-direct {v4, p2, p1, v1, v0}, LQ2/f;-><init>(Lp3/d;Lp3/f;Ljava/lang/String;Li1/i;)V

    .line 144
    .line 145
    .line 146
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    new-instance p1, LD1/a;

    .line 150
    .line 151
    const/16 p2, 0xd

    .line 152
    .line 153
    invoke-direct {p1, p2, v2}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    iget-object p2, v0, Li1/i;->a:Li1/p;

    .line 157
    .line 158
    invoke-virtual {p2, p1}, Li1/p;->f(Li1/c;)Li1/p;

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    nop

    .line 163
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
