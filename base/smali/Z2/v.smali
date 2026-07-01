.class public final synthetic LZ2/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:J

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LZ2/w;LZ2/A;JLandroid/view/KeyEvent;I)V
    .locals 0

    .line 1
    iput p6, p0, LZ2/v;->e:I

    iput-object p1, p0, LZ2/v;->f:Ljava/lang/Object;

    iput-object p2, p0, LZ2/v;->g:Ljava/lang/Object;

    iput-wide p3, p0, LZ2/v;->h:J

    iput-object p5, p0, LZ2/v;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lm/x0;Le3/e;LX1/c;J)V
    .locals 1

    .line 2
    const/4 v0, 0x2

    iput v0, p0, LZ2/v;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LZ2/v;->f:Ljava/lang/Object;

    iput-object p2, p0, LZ2/v;->g:Ljava/lang/Object;

    iput-object p3, p0, LZ2/v;->i:Ljava/lang/Object;

    iput-wide p4, p0, LZ2/v;->h:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, LZ2/v;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LZ2/v;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lm/x0;

    .line 9
    .line 10
    iget-object v1, p0, LZ2/v;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Le3/e;

    .line 13
    .line 14
    iget-object v2, p0, LZ2/v;->i:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, LX1/c;

    .line 17
    .line 18
    iget-object v1, v1, Le3/e;->d:LV1/q;

    .line 19
    .line 20
    iget-object v1, v1, LV1/q;->c:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v1, Ljava/lang/String;

    .line 23
    .line 24
    sget-object v3, Ld1/d;->a:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, v0, Lm/x0;->f:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_2

    .line 39
    .line 40
    const-string v4, "FLTFireBGExecutor"

    .line 41
    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    new-instance v5, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v6, "Creating background FlutterEngine instance, with args: "

    .line 47
    .line 48
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, LX1/c;->b()[Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v6}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    new-instance v5, La3/c;

    .line 70
    .line 71
    sget-object v6, Ld1/d;->a:Landroid/content/Context;

    .line 72
    .line 73
    invoke-virtual {v2}, LX1/c;->b()[Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-direct {v5, v6, v2}, La3/c;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iput-object v5, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const-string v2, "Creating background FlutterEngine instance."

    .line 84
    .line 85
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    new-instance v2, La3/c;

    .line 89
    .line 90
    sget-object v5, Ld1/d;->a:Landroid/content/Context;

    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    invoke-direct {v2, v5, v6}, La3/c;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iput-object v2, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 97
    .line 98
    :goto_0
    iget-wide v5, p0, LZ2/v;->h:J

    .line 99
    .line 100
    invoke-static {v5, v6}, Lio/flutter/view/FlutterCallbackInformation;->lookupCallbackInformation(J)Lio/flutter/view/FlutterCallbackInformation;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    if-nez v2, :cond_1

    .line 105
    .line 106
    const-string v0, "Failed to find registered callback"

    .line 107
    .line 108
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    iget-object v4, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v4, La3/c;

    .line 115
    .line 116
    iget-object v4, v4, La3/c;->c:Lb3/b;

    .line 117
    .line 118
    new-instance v5, Lk3/o;

    .line 119
    .line 120
    const-string v6, "plugins.flutter.io/firebase_messaging_background"

    .line 121
    .line 122
    invoke-direct {v5, v4, v6}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iput-object v5, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 126
    .line 127
    invoke-virtual {v5, v0}, Lk3/o;->b(Lk3/m;)V

    .line 128
    .line 129
    .line 130
    new-instance v0, LB2/a;

    .line 131
    .line 132
    const/16 v5, 0x12

    .line 133
    .line 134
    invoke-direct {v0, v3, v1, v2, v5}, LB2/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4, v0}, Lb3/b;->a(LB2/a;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    :goto_1
    return-void

    .line 141
    :pswitch_0
    iget-object v0, p0, LZ2/v;->f:Ljava/lang/Object;

    .line 142
    .line 143
    move-object v1, v0

    .line 144
    check-cast v1, LZ2/w;

    .line 145
    .line 146
    iget-object v0, p0, LZ2/v;->g:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v0, LZ2/A;

    .line 149
    .line 150
    iget-object v2, p0, LZ2/v;->i:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v2, Landroid/view/KeyEvent;

    .line 153
    .line 154
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    iget-wide v3, v0, LZ2/A;->b:J

    .line 158
    .line 159
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    iget-wide v4, p0, LZ2/v;->h:J

    .line 164
    .line 165
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual {v2}, Landroid/view/KeyEvent;->getEventTime()J

    .line 170
    .line 171
    .line 172
    move-result-wide v5

    .line 173
    const/4 v2, 0x0

    .line 174
    invoke-virtual/range {v1 .. v6}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :pswitch_1
    iget-object v0, p0, LZ2/v;->f:Ljava/lang/Object;

    .line 179
    .line 180
    move-object v1, v0

    .line 181
    check-cast v1, LZ2/w;

    .line 182
    .line 183
    iget-object v0, p0, LZ2/v;->g:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v0, LZ2/A;

    .line 186
    .line 187
    iget-object v2, p0, LZ2/v;->i:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v2, Landroid/view/KeyEvent;

    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    iget-wide v3, v0, LZ2/A;->b:J

    .line 195
    .line 196
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    iget-wide v4, p0, LZ2/v;->h:J

    .line 201
    .line 202
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-virtual {v2}, Landroid/view/KeyEvent;->getEventTime()J

    .line 207
    .line 208
    .line 209
    move-result-wide v5

    .line 210
    const/4 v2, 0x0

    .line 211
    invoke-virtual/range {v1 .. v6}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
