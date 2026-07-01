.class public final Lio/flutter/plugin/editing/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/m;
.implements Lc1/d;
.implements Lm/i0;
.implements Ll/n;
.implements Lm/m;
.implements Ls3/p;
.implements Ls3/K0;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    iput p1, p0, Lio/flutter/plugin/editing/j;->e:I

    packed-switch p1, :pswitch_data_0

    .line 2
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p1, Ljava/util/LinkedHashMap;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    invoke-direct {p1, v1, v2, v0}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object p1, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void

    .line 4
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    .line 5
    :pswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance p1, Le1/D;

    invoke-direct {p1}, Le1/D;-><init>()V

    iput-object p1, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void

    .line 7
    :pswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance p1, Le1/l;

    .line 9
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p1, Le1/l;->l:Z

    const/4 v0, 0x0

    iput v0, p1, Le1/l;->m:F

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p1, Le1/l;->n:F

    iput v0, p1, Le1/l;->o:F

    const/4 v0, 0x0

    iput-boolean v0, p1, Le1/l;->p:Z

    .line 11
    iput-object p1, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lio/flutter/plugin/editing/j;->e:I

    iput-object p2, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lb3/b;I)V
    .locals 4

    iput p2, p0, Lio/flutter/plugin/editing/j;->e:I

    packed-switch p2, :pswitch_data_0

    .line 12
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance p2, LK0/h;

    const/16 v0, 0xe

    .line 14
    invoke-direct {p2, v0}, LK0/h;-><init>(I)V

    .line 15
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 16
    const-string v3, "flutter/backgesture"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 17
    iput-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 18
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 19
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance p2, Lj3/b;

    const/4 v0, 0x5

    invoke-direct {p2, v0, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 21
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 22
    const-string v3, "flutter/spellcheck"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 23
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 24
    :pswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance p2, Lj3/b;

    const/4 v0, 0x4

    invoke-direct {p2, v0, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 26
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 27
    const-string v3, "flutter/sensitivecontent"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 28
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 29
    :pswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance p2, Lj3/b;

    const/4 v0, 0x3

    invoke-direct {p2, v0, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 31
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/j;->a:Lk3/j;

    const/4 v2, 0x0

    .line 32
    const-string v3, "flutter/scribe"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 33
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 34
    :pswitch_4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance p2, LE/i;

    const/16 v0, 0x1d

    invoke-direct {p2, v0, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 36
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 37
    const-string v3, "flutter/mousecursor"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 38
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public constructor <init>(Lk3/f;)V
    .locals 4

    const/4 v0, 0x2

    iput v0, p0, Lio/flutter/plugin/editing/j;->e:I

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, LV1/y;

    sget-object v1, Lk3/i;->a:Lk3/i;

    const/4 v2, 0x0

    .line 41
    const-string v3, "flutter/keyevent"

    invoke-direct {v0, p1, v3, v1, v2}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 42
    iput-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm/n;)V
    .locals 1

    const/16 v0, 0xf

    iput v0, p0, Lio/flutter/plugin/editing/j;->e:I

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, LA0/c;

    invoke-direct {v0, p1}, LA0/c;-><init>(Lm/n;)V

    iput-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void
.end method

.method public static o(Landroid/window/BackEvent;)Ljava/util/HashMap;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, LD/U;->a(Landroid/window/BackEvent;)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {p0}, LD/U;->f(Landroid/window/BackEvent;)F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    filled-new-array {v1, v2}, [Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 46
    :goto_1
    const-string v2, "touchOffset"

    .line 47
    .line 48
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, LD/U;->g(Landroid/window/BackEvent;)F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "progress"

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, LD/U;->c(Landroid/window/BackEvent;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v1, "swipeEdge"

    .line 73
    .line 74
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method private final q(Lk3/l;Lk3/n;)V
    .locals 12

    .line 1
    const-string v0, "error"

    .line 2
    .line 3
    const-string v1, "No such clipboard content format: "

    .line 4
    .line 5
    iget-object v2, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, LZ2/s;

    .line 8
    .line 9
    iget-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v3, Lio/flutter/plugin/platform/m;

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    goto/16 :goto_b

    .line 16
    .line 17
    :cond_0
    iget-object v3, p1, Lk3/l;->a:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p1, p1, Lk3/l;->b:Ljava/lang/Object;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    :try_start_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/4 v6, 0x3

    .line 27
    const/4 v7, 0x4

    .line 28
    const/4 v8, 0x2

    .line 29
    const/4 v9, 0x1

    .line 30
    const/4 v10, 0x0

    .line 31
    sparse-switch v5, :sswitch_data_0

    .line 32
    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :sswitch_0
    const-string v5, "SystemChrome.setPreferredOrientations"

    .line 37
    .line 38
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    move v3, v8

    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto/16 :goto_a

    .line 49
    .line 50
    :sswitch_1
    const-string v5, "SystemChrome.setEnabledSystemUIOverlays"

    .line 51
    .line 52
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    move v3, v7

    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :sswitch_2
    const-string v5, "Clipboard.getData"

    .line 62
    .line 63
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    const/16 v3, 0xb

    .line 70
    .line 71
    goto/16 :goto_1

    .line 72
    .line 73
    :sswitch_3
    const-string v5, "SystemChrome.setSystemUIOverlayStyle"

    .line 74
    .line 75
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    const/16 v3, 0x8

    .line 82
    .line 83
    goto/16 :goto_1

    .line 84
    .line 85
    :sswitch_4
    const-string v5, "SystemChrome.setEnabledSystemUIMode"

    .line 86
    .line 87
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_1

    .line 92
    .line 93
    const/4 v3, 0x5

    .line 94
    goto/16 :goto_1

    .line 95
    .line 96
    :sswitch_5
    const-string v5, "Clipboard.hasStrings"

    .line 97
    .line 98
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_1

    .line 103
    .line 104
    const/16 v3, 0xd

    .line 105
    .line 106
    goto/16 :goto_1

    .line 107
    .line 108
    :sswitch_6
    const-string v5, "SystemChrome.restoreSystemUIOverlays"

    .line 109
    .line 110
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_1

    .line 115
    .line 116
    const/4 v3, 0x7

    .line 117
    goto :goto_1

    .line 118
    :sswitch_7
    const-string v5, "SystemSound.play"

    .line 119
    .line 120
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    if-eqz v3, :cond_1

    .line 125
    .line 126
    move v3, v10

    .line 127
    goto :goto_1

    .line 128
    :sswitch_8
    const-string v5, "HapticFeedback.vibrate"

    .line 129
    .line 130
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_1

    .line 135
    .line 136
    move v3, v9

    .line 137
    goto :goto_1

    .line 138
    :sswitch_9
    const-string v5, "SystemChrome.setApplicationSwitcherDescription"

    .line 139
    .line 140
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_1

    .line 145
    .line 146
    move v3, v6

    .line 147
    goto :goto_1

    .line 148
    :sswitch_a
    const-string v5, "SystemChrome.setSystemUIChangeListener"

    .line 149
    .line 150
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-eqz v3, :cond_1

    .line 155
    .line 156
    const/4 v3, 0x6

    .line 157
    goto :goto_1

    .line 158
    :sswitch_b
    const-string v5, "Clipboard.setData"

    .line 159
    .line 160
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    if-eqz v3, :cond_1

    .line 165
    .line 166
    const/16 v3, 0xc

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :sswitch_c
    const-string v5, "SystemNavigator.pop"

    .line 170
    .line 171
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-eqz v3, :cond_1

    .line 176
    .line 177
    const/16 v3, 0xa

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :sswitch_d
    const-string v5, "Share.invoke"

    .line 181
    .line 182
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eqz v3, :cond_1

    .line 187
    .line 188
    const/16 v3, 0xe

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :sswitch_e
    const-string v5, "SystemNavigator.setFrameworkHandlesBack"

    .line 192
    .line 193
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    if-eqz v3, :cond_1

    .line 198
    .line 199
    const/16 v3, 0x9

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_1
    :goto_0
    const/4 v3, -0x1

    .line 203
    :goto_1
    const-string v5, "text"

    .line 204
    .line 205
    const-string v11, "clipboard"

    .line 206
    .line 207
    packed-switch v3, :pswitch_data_0

    .line 208
    .line 209
    .line 210
    :try_start_1
    move-object p1, p2

    .line 211
    check-cast p1, LQ2/g;

    .line 212
    .line 213
    invoke-virtual {p1}, LQ2/g;->b()V

    .line 214
    .line 215
    .line 216
    goto/16 :goto_b

    .line 217
    .line 218
    :pswitch_0
    check-cast p1, Ljava/lang/String;

    .line 219
    .line 220
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 223
    .line 224
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 225
    .line 226
    check-cast v1, LR/j;

    .line 227
    .line 228
    new-instance v2, Landroid/content/Intent;

    .line 229
    .line 230
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 231
    .line 232
    .line 233
    const-string v3, "android.intent.action.SEND"

    .line 234
    .line 235
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 236
    .line 237
    .line 238
    const-string v3, "text/plain"

    .line 239
    .line 240
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    .line 242
    .line 243
    const-string v3, "android.intent.extra.TEXT"

    .line 244
    .line 245
    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    .line 247
    .line 248
    iget-object p1, v1, LR/j;->c:Ljava/lang/Object;

    .line 249
    .line 250
    check-cast p1, Landroid/app/Activity;

    .line 251
    .line 252
    invoke-static {v2, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {p1, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 257
    .line 258
    .line 259
    move-object p1, p2

    .line 260
    check-cast p1, LQ2/g;

    .line 261
    .line 262
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    goto/16 :goto_b

    .line 266
    .line 267
    :pswitch_1
    iget-object p1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 268
    .line 269
    check-cast p1, Lio/flutter/plugin/platform/m;

    .line 270
    .line 271
    iget-object p1, p1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 272
    .line 273
    check-cast p1, LR/j;

    .line 274
    .line 275
    iget-object p1, p1, LR/j;->c:Ljava/lang/Object;

    .line 276
    .line 277
    check-cast p1, Landroid/app/Activity;

    .line 278
    .line 279
    invoke-virtual {p1, v11}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    check-cast p1, Landroid/content/ClipboardManager;

    .line 284
    .line 285
    invoke-virtual {p1}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-nez v1, :cond_2

    .line 290
    .line 291
    goto :goto_2

    .line 292
    :cond_2
    invoke-virtual {p1}, Landroid/content/ClipboardManager;->getPrimaryClipDescription()Landroid/content/ClipDescription;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    if-nez p1, :cond_3

    .line 297
    .line 298
    goto :goto_2

    .line 299
    :cond_3
    const-string v1, "text/*"

    .line 300
    .line 301
    invoke-virtual {p1, v1}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    .line 302
    .line 303
    .line 304
    move-result v10

    .line 305
    :goto_2
    new-instance p1, Lorg/json/JSONObject;

    .line 306
    .line 307
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 308
    .line 309
    .line 310
    const-string v1, "value"

    .line 311
    .line 312
    invoke-virtual {p1, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 313
    .line 314
    .line 315
    move-object v1, p2

    .line 316
    check-cast v1, LQ2/g;

    .line 317
    .line 318
    invoke-virtual {v1, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    goto/16 :goto_b

    .line 322
    .line 323
    :pswitch_2
    check-cast p1, Lorg/json/JSONObject;

    .line 324
    .line 325
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 330
    .line 331
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 332
    .line 333
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 334
    .line 335
    check-cast v1, LR/j;

    .line 336
    .line 337
    iget-object v1, v1, LR/j;->c:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast v1, Landroid/app/Activity;

    .line 340
    .line 341
    invoke-virtual {v1, v11}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    check-cast v1, Landroid/content/ClipboardManager;

    .line 346
    .line 347
    const-string v2, "text label?"

    .line 348
    .line 349
    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    invoke-virtual {v1, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 354
    .line 355
    .line 356
    move-object p1, p2

    .line 357
    check-cast p1, LQ2/g;

    .line 358
    .line 359
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    goto/16 :goto_b

    .line 363
    .line 364
    :pswitch_3
    check-cast p1, Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 365
    .line 366
    if-eqz p1, :cond_4

    .line 367
    .line 368
    :try_start_2
    invoke-static {p1}, Lj3/c;->a(Ljava/lang/String;)Lj3/c;

    .line 369
    .line 370
    .line 371
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 372
    goto :goto_3

    .line 373
    :catch_1
    :try_start_3
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    move-object v1, p2

    .line 378
    check-cast v1, LQ2/g;

    .line 379
    .line 380
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 381
    .line 382
    .line 383
    :cond_4
    move-object p1, v4

    .line 384
    :goto_3
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 385
    .line 386
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 387
    .line 388
    invoke-virtual {v1, p1}, Lio/flutter/plugin/platform/m;->c(Lj3/c;)Ljava/lang/CharSequence;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    if-eqz p1, :cond_5

    .line 393
    .line 394
    new-instance v1, Lorg/json/JSONObject;

    .line 395
    .line 396
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v1, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 400
    .line 401
    .line 402
    move-object p1, p2

    .line 403
    check-cast p1, LQ2/g;

    .line 404
    .line 405
    invoke-virtual {p1, v1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 406
    .line 407
    .line 408
    goto/16 :goto_b

    .line 409
    .line 410
    :cond_5
    move-object p1, p2

    .line 411
    check-cast p1, LQ2/g;

    .line 412
    .line 413
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 414
    .line 415
    .line 416
    goto/16 :goto_b

    .line 417
    .line 418
    :pswitch_4
    iget-object p1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 419
    .line 420
    check-cast p1, Lio/flutter/plugin/platform/m;

    .line 421
    .line 422
    iget-object p1, p1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 423
    .line 424
    check-cast p1, LR/j;

    .line 425
    .line 426
    iget-object p1, p1, LR/j;->c:Ljava/lang/Object;

    .line 427
    .line 428
    check-cast p1, Landroid/app/Activity;

    .line 429
    .line 430
    instance-of v1, p1, Le/b;

    .line 431
    .line 432
    if-nez v1, :cond_6

    .line 433
    .line 434
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 435
    .line 436
    .line 437
    move-object p1, p2

    .line 438
    check-cast p1, LQ2/g;

    .line 439
    .line 440
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 441
    .line 442
    .line 443
    goto/16 :goto_b

    .line 444
    .line 445
    :cond_6
    check-cast p1, Le/b;

    .line 446
    .line 447
    check-cast p1, Le/a;

    .line 448
    .line 449
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 450
    .line 451
    .line 452
    throw v4

    .line 453
    :pswitch_5
    check-cast p1, Ljava/lang/Boolean;

    .line 454
    .line 455
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 460
    .line 461
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 462
    .line 463
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 464
    .line 465
    check-cast v1, LR/j;

    .line 466
    .line 467
    iget-object v1, v1, LR/j;->e:Ljava/lang/Object;

    .line 468
    .line 469
    check-cast v1, LZ2/g;

    .line 470
    .line 471
    if-eqz v1, :cond_7

    .line 472
    .line 473
    check-cast v1, LZ2/d;

    .line 474
    .line 475
    invoke-virtual {v1, p1}, LZ2/d;->i(Z)V

    .line 476
    .line 477
    .line 478
    :cond_7
    move-object p1, p2

    .line 479
    check-cast p1, LQ2/g;

    .line 480
    .line 481
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 482
    .line 483
    .line 484
    goto/16 :goto_b

    .line 485
    .line 486
    :pswitch_6
    :try_start_4
    check-cast p1, Lorg/json/JSONObject;

    .line 487
    .line 488
    invoke-static {v2, p1}, LZ2/s;->t(LZ2/s;Lorg/json/JSONObject;)LD1/b;

    .line 489
    .line 490
    .line 491
    move-result-object p1

    .line 492
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 493
    .line 494
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 495
    .line 496
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 497
    .line 498
    check-cast v1, LR/j;

    .line 499
    .line 500
    invoke-virtual {v1, p1}, LR/j;->i(LD1/b;)V

    .line 501
    .line 502
    .line 503
    move-object p1, p2

    .line 504
    check-cast p1, LQ2/g;

    .line 505
    .line 506
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_2

    .line 507
    .line 508
    .line 509
    goto/16 :goto_b

    .line 510
    .line 511
    :catch_2
    move-exception p1

    .line 512
    goto :goto_4

    .line 513
    :catch_3
    move-exception p1

    .line 514
    :goto_4
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object p1

    .line 518
    move-object v1, p2

    .line 519
    check-cast v1, LQ2/g;

    .line 520
    .line 521
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 522
    .line 523
    .line 524
    goto/16 :goto_b

    .line 525
    .line 526
    :pswitch_7
    iget-object p1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 527
    .line 528
    check-cast p1, Lio/flutter/plugin/platform/m;

    .line 529
    .line 530
    iget-object p1, p1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 531
    .line 532
    check-cast p1, LR/j;

    .line 533
    .line 534
    invoke-virtual {p1}, LR/j;->j()V

    .line 535
    .line 536
    .line 537
    move-object p1, p2

    .line 538
    check-cast p1, LQ2/g;

    .line 539
    .line 540
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 541
    .line 542
    .line 543
    goto/16 :goto_b

    .line 544
    .line 545
    :pswitch_8
    iget-object p1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 546
    .line 547
    check-cast p1, Lio/flutter/plugin/platform/m;

    .line 548
    .line 549
    iget-object p1, p1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 550
    .line 551
    check-cast p1, LR/j;

    .line 552
    .line 553
    iget-object v1, p1, LR/j;->c:Ljava/lang/Object;

    .line 554
    .line 555
    check-cast v1, Landroid/app/Activity;

    .line 556
    .line 557
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 558
    .line 559
    .line 560
    move-result-object v1

    .line 561
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    new-instance v2, Lio/flutter/plugin/platform/d;

    .line 566
    .line 567
    invoke-direct {v2, p1, v1}, Lio/flutter/plugin/platform/d;-><init>(LR/j;Landroid/view/View;)V

    .line 568
    .line 569
    .line 570
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 571
    .line 572
    .line 573
    move-object p1, p2

    .line 574
    check-cast p1, LQ2/g;

    .line 575
    .line 576
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    .line 577
    .line 578
    .line 579
    goto/16 :goto_b

    .line 580
    .line 581
    :pswitch_9
    :try_start_6
    check-cast p1, Ljava/lang/String;

    .line 582
    .line 583
    invoke-static {v2, p1}, LZ2/s;->s(LZ2/s;Ljava/lang/String;)I

    .line 584
    .line 585
    .line 586
    move-result p1

    .line 587
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 588
    .line 589
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 590
    .line 591
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 592
    .line 593
    check-cast v1, LR/j;

    .line 594
    .line 595
    if-ne p1, v9, :cond_8

    .line 596
    .line 597
    const/16 p1, 0x706

    .line 598
    .line 599
    goto :goto_5

    .line 600
    :cond_8
    if-ne p1, v8, :cond_9

    .line 601
    .line 602
    const/16 p1, 0xf06

    .line 603
    .line 604
    goto :goto_5

    .line 605
    :cond_9
    if-ne p1, v6, :cond_a

    .line 606
    .line 607
    const/16 p1, 0x1706

    .line 608
    .line 609
    goto :goto_5

    .line 610
    :cond_a
    if-ne p1, v7, :cond_b

    .line 611
    .line 612
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 613
    .line 614
    const/16 v2, 0x1d

    .line 615
    .line 616
    if-lt p1, v2, :cond_b

    .line 617
    .line 618
    const/16 p1, 0x700

    .line 619
    .line 620
    :goto_5
    iput p1, v1, LR/j;->b:I

    .line 621
    .line 622
    invoke-virtual {v1}, LR/j;->j()V

    .line 623
    .line 624
    .line 625
    :cond_b
    move-object p1, p2

    .line 626
    check-cast p1, LQ2/g;

    .line 627
    .line 628
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_6} :catch_4

    .line 629
    .line 630
    .line 631
    goto/16 :goto_b

    .line 632
    .line 633
    :catch_4
    move-exception p1

    .line 634
    goto :goto_6

    .line 635
    :catch_5
    move-exception p1

    .line 636
    :goto_6
    :try_start_7
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object p1

    .line 640
    move-object v1, p2

    .line 641
    check-cast v1, LQ2/g;

    .line 642
    .line 643
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    .line 644
    .line 645
    .line 646
    goto/16 :goto_b

    .line 647
    .line 648
    :pswitch_a
    :try_start_8
    check-cast p1, Lorg/json/JSONArray;

    .line 649
    .line 650
    invoke-static {v2, p1}, LZ2/s;->r(LZ2/s;Lorg/json/JSONArray;)Ljava/util/ArrayList;

    .line 651
    .line 652
    .line 653
    move-result-object p1

    .line 654
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 655
    .line 656
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 657
    .line 658
    invoke-virtual {v1, p1}, Lio/flutter/plugin/platform/m;->g(Ljava/util/ArrayList;)V

    .line 659
    .line 660
    .line 661
    move-object p1, p2

    .line 662
    check-cast p1, LQ2/g;

    .line 663
    .line 664
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_7
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_8} :catch_6

    .line 665
    .line 666
    .line 667
    goto/16 :goto_b

    .line 668
    .line 669
    :catch_6
    move-exception p1

    .line 670
    goto :goto_7

    .line 671
    :catch_7
    move-exception p1

    .line 672
    :goto_7
    :try_start_9
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object p1

    .line 676
    move-object v1, p2

    .line 677
    check-cast v1, LQ2/g;

    .line 678
    .line 679
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    .line 680
    .line 681
    .line 682
    goto/16 :goto_b

    .line 683
    .line 684
    :pswitch_b
    :try_start_a
    check-cast p1, Lorg/json/JSONObject;

    .line 685
    .line 686
    const-string v1, "primaryColor"

    .line 687
    .line 688
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    move-result v1

    .line 692
    if-eqz v1, :cond_c

    .line 693
    .line 694
    const/high16 v3, -0x1000000

    .line 695
    .line 696
    or-int/2addr v1, v3

    .line 697
    :cond_c
    const-string v3, "label"

    .line 698
    .line 699
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object p1

    .line 703
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 704
    .line 705
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 706
    .line 707
    iget-object v2, v2, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 708
    .line 709
    check-cast v2, LR/j;

    .line 710
    .line 711
    iget-object v2, v2, LR/j;->c:Ljava/lang/Object;

    .line 712
    .line 713
    check-cast v2, Landroid/app/Activity;

    .line 714
    .line 715
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 716
    .line 717
    const/16 v5, 0x1c

    .line 718
    .line 719
    if-ge v3, v5, :cond_d

    .line 720
    .line 721
    new-instance v3, Landroid/app/ActivityManager$TaskDescription;

    .line 722
    .line 723
    invoke-direct {v3, p1, v4, v1}, Landroid/app/ActivityManager$TaskDescription;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    .line 724
    .line 725
    .line 726
    invoke-virtual {v2, v3}, Landroid/app/Activity;->setTaskDescription(Landroid/app/ActivityManager$TaskDescription;)V

    .line 727
    .line 728
    .line 729
    goto :goto_8

    .line 730
    :cond_d
    new-instance v3, Landroid/app/ActivityManager$TaskDescription;

    .line 731
    .line 732
    invoke-static {p1, v1}, LQ2/a;->b(Ljava/lang/String;I)Landroid/app/ActivityManager$TaskDescription;

    .line 733
    .line 734
    .line 735
    move-result-object p1

    .line 736
    invoke-virtual {v2, p1}, Landroid/app/Activity;->setTaskDescription(Landroid/app/ActivityManager$TaskDescription;)V

    .line 737
    .line 738
    .line 739
    :goto_8
    move-object p1, p2

    .line 740
    check-cast p1, LQ2/g;

    .line 741
    .line 742
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_8

    .line 743
    .line 744
    .line 745
    goto/16 :goto_b

    .line 746
    .line 747
    :catch_8
    move-exception p1

    .line 748
    :try_start_b
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 749
    .line 750
    .line 751
    move-result-object p1

    .line 752
    move-object v1, p2

    .line 753
    check-cast v1, LQ2/g;

    .line 754
    .line 755
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_0

    .line 756
    .line 757
    .line 758
    goto/16 :goto_b

    .line 759
    .line 760
    :pswitch_c
    :try_start_c
    check-cast p1, Lorg/json/JSONArray;

    .line 761
    .line 762
    invoke-static {v2, p1}, LZ2/s;->q(LZ2/s;Lorg/json/JSONArray;)I

    .line 763
    .line 764
    .line 765
    move-result p1

    .line 766
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 767
    .line 768
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 769
    .line 770
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 771
    .line 772
    check-cast v1, LR/j;

    .line 773
    .line 774
    iget-object v1, v1, LR/j;->c:Ljava/lang/Object;

    .line 775
    .line 776
    check-cast v1, Landroid/app/Activity;

    .line 777
    .line 778
    invoke-virtual {v1, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 779
    .line 780
    .line 781
    move-object p1, p2

    .line 782
    check-cast p1, LQ2/g;

    .line 783
    .line 784
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_c .. :try_end_c} :catch_9

    .line 785
    .line 786
    .line 787
    goto/16 :goto_b

    .line 788
    .line 789
    :catch_9
    move-exception p1

    .line 790
    goto :goto_9

    .line 791
    :catch_a
    move-exception p1

    .line 792
    :goto_9
    :try_start_d
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object p1

    .line 796
    move-object v1, p2

    .line 797
    check-cast v1, LQ2/g;

    .line 798
    .line 799
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_0

    .line 800
    .line 801
    .line 802
    goto :goto_b

    .line 803
    :pswitch_d
    :try_start_e
    check-cast p1, Ljava/lang/String;

    .line 804
    .line 805
    invoke-static {p1}, LE1/j;->c(Ljava/lang/String;)I

    .line 806
    .line 807
    .line 808
    move-result p1

    .line 809
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 810
    .line 811
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 812
    .line 813
    invoke-virtual {v1, p1}, Lio/flutter/plugin/platform/m;->h(I)V

    .line 814
    .line 815
    .line 816
    move-object p1, p2

    .line 817
    check-cast p1, LQ2/g;

    .line 818
    .line 819
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_e .. :try_end_e} :catch_b
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_0

    .line 820
    .line 821
    .line 822
    goto :goto_b

    .line 823
    :catch_b
    move-exception p1

    .line 824
    :try_start_f
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 825
    .line 826
    .line 827
    move-result-object p1

    .line 828
    move-object v1, p2

    .line 829
    check-cast v1, LQ2/g;

    .line 830
    .line 831
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_0

    .line 832
    .line 833
    .line 834
    goto :goto_b

    .line 835
    :pswitch_e
    :try_start_10
    check-cast p1, Ljava/lang/String;

    .line 836
    .line 837
    invoke-static {p1}, LE1/j;->d(Ljava/lang/String;)I

    .line 838
    .line 839
    .line 840
    move-result p1

    .line 841
    iget-object v1, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 842
    .line 843
    check-cast v1, Lio/flutter/plugin/platform/m;

    .line 844
    .line 845
    iget-object v1, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 846
    .line 847
    check-cast v1, LR/j;

    .line 848
    .line 849
    if-ne p1, v9, :cond_e

    .line 850
    .line 851
    iget-object p1, v1, LR/j;->c:Ljava/lang/Object;

    .line 852
    .line 853
    check-cast p1, Landroid/app/Activity;

    .line 854
    .line 855
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 856
    .line 857
    .line 858
    move-result-object p1

    .line 859
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 860
    .line 861
    .line 862
    move-result-object p1

    .line 863
    invoke-virtual {p1, v10}, Landroid/view/View;->playSoundEffect(I)V

    .line 864
    .line 865
    .line 866
    :cond_e
    move-object p1, p2

    .line 867
    check-cast p1, LQ2/g;

    .line 868
    .line 869
    invoke-virtual {p1, v4}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_10
    .catch Ljava/lang/NoSuchFieldException; {:try_start_10 .. :try_end_10} :catch_c
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_0

    .line 870
    .line 871
    .line 872
    goto :goto_b

    .line 873
    :catch_c
    move-exception p1

    .line 874
    :try_start_11
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 875
    .line 876
    .line 877
    move-result-object p1

    .line 878
    move-object v1, p2

    .line 879
    check-cast v1, LQ2/g;

    .line 880
    .line 881
    invoke-virtual {v1, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_0

    .line 882
    .line 883
    .line 884
    goto :goto_b

    .line 885
    :goto_a
    new-instance v1, Ljava/lang/StringBuilder;

    .line 886
    .line 887
    const-string v2, "JSON error: "

    .line 888
    .line 889
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 890
    .line 891
    .line 892
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 893
    .line 894
    .line 895
    move-result-object p1

    .line 896
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 897
    .line 898
    .line 899
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 900
    .line 901
    .line 902
    move-result-object p1

    .line 903
    check-cast p2, LQ2/g;

    .line 904
    .line 905
    invoke-virtual {p2, v0, p1, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 906
    .line 907
    .line 908
    :goto_b
    return-void

    .line 909
    :sswitch_data_0
    .sparse-switch
        -0x59804db0 -> :sswitch_e
        -0x3789da79 -> :sswitch_d
        -0x2dad73d5 -> :sswitch_c
        -0x2af4a94c -> :sswitch_b
        -0x2267c49c -> :sswitch_a
        -0x20b0f718 -> :sswitch_9
        -0xebc6f23 -> :sswitch_8
        -0xcd4cf9e -> :sswitch_7
        0xe6a45af -> :sswitch_6
        0x3436a200 -> :sswitch_5
        0x4341194a -> :sswitch_4
        0x52e10221 -> :sswitch_3
        0x5a408fa8 -> :sswitch_2
        0x63cbfa4a -> :sswitch_1
        0x7e576127 -> :sswitch_0
    .end sparse-switch

    .line 910
    .line 911
    .line 912
    .line 913
    .line 914
    .line 915
    .line 916
    .line 917
    .line 918
    .line 919
    .line 920
    .line 921
    .line 922
    .line 923
    .line 924
    .line 925
    .line 926
    .line 927
    .line 928
    .line 929
    .line 930
    .line 931
    .line 932
    .line 933
    .line 934
    .line 935
    .line 936
    .line 937
    .line 938
    .line 939
    .line 940
    .line 941
    .line 942
    .line 943
    .line 944
    .line 945
    .line 946
    .line 947
    .line 948
    .line 949
    .line 950
    .line 951
    .line 952
    .line 953
    .line 954
    .line 955
    .line 956
    .line 957
    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static r(I)Lio/flutter/plugin/editing/j;
    .locals 2

    .line 1
    new-instance v0, Lio/flutter/plugin/editing/j;

    .line 2
    .line 3
    invoke-static {p0}, Ls1/I;->a(I)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lz1/a;->a([B)Lz1/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v1, 0x17

    .line 12
    .line 13
    invoke-direct {v0, v1, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/j;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Le1/D;

    .line 9
    .line 10
    iput p1, v0, Le1/D;->g:F

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Le1/l;

    .line 16
    .line 17
    iput p1, v0, Le1/l;->k:F

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public b(F)V
    .locals 3

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/j;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Le1/D;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    cmpl-float v1, p1, v1

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-ltz v1, :cond_0

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpg-float v1, p1, v1

    .line 19
    .line 20
    if-gtz v1, :cond_0

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    :cond_0
    const-string v1, "Transparency must be in the range [0..1]"

    .line 24
    .line 25
    invoke-static {v1, v2}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    iput p1, v0, Le1/D;->i:F

    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Le1/l;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    cmpl-float v1, p1, v1

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-ltz v1, :cond_1

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    cmpg-float v1, p1, v1

    .line 44
    .line 45
    if-gtz v1, :cond_1

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    :cond_1
    const-string v1, "Transparency must be in the range [0..1]"

    .line 49
    .line 50
    invoke-static {v1, v2}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    iput p1, v0, Le1/l;->m:F

    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public c(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    iput p1, v0, Le1/l;->n:F

    .line 6
    .line 7
    iput p2, v0, Le1/l;->o:F

    .line 8
    .line 9
    return-void
.end method

.method public d(Ll/i;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, Ll/s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/s;

    .line 7
    .line 8
    iget-object v0, v0, Ll/s;->v:Ll/i;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/i;->j()Ll/i;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Ll/i;->c(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Lm/j;

    .line 21
    .line 22
    iget-object v0, v0, Lm/j;->i:Ll/n;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, p1, p2}, Ll/n;->d(Ll/i;Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public e(Le1/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    iput-object p1, v0, Le1/l;->e:Le1/c;

    .line 6
    .line 7
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    iput-boolean p1, v0, Le1/l;->p:Z

    .line 6
    .line 7
    return-void
.end method

.method public g(Lcom/google/android/gms/maps/model/LatLng;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    const-string v1, "Width must be non-negative"

    .line 6
    .line 7
    const-string v2, "Position has already been set using positionFromBounds"

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v5, 0x0

    .line 12
    if-eqz p3, :cond_3

    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    iget-object v6, v0, Le1/l;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 23
    .line 24
    if-nez v6, :cond_0

    .line 25
    .line 26
    move v6, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v6, v4

    .line 29
    :goto_0
    invoke-static {v2, v6}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    cmpl-float v2, p2, v5

    .line 33
    .line 34
    if-ltz v2, :cond_1

    .line 35
    .line 36
    move v2, v3

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v2, v4

    .line 39
    :goto_1
    invoke-static {v1, v2}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    cmpl-float v1, p3, v5

    .line 43
    .line 44
    if-ltz v1, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v3, v4

    .line 48
    :goto_2
    const-string v1, "Height must be non-negative"

    .line 49
    .line 50
    invoke-static {v1, v3}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    iput-object p1, v0, Le1/l;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 54
    .line 55
    iput p2, v0, Le1/l;->g:F

    .line 56
    .line 57
    iput p3, v0, Le1/l;->h:F

    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iget-object p3, v0, Le1/l;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 65
    .line 66
    if-nez p3, :cond_4

    .line 67
    .line 68
    move p3, v3

    .line 69
    goto :goto_3

    .line 70
    :cond_4
    move p3, v4

    .line 71
    :goto_3
    invoke-static {v2, p3}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 72
    .line 73
    .line 74
    cmpl-float p3, p2, v5

    .line 75
    .line 76
    if-ltz p3, :cond_5

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_5
    move v3, v4

    .line 80
    :goto_4
    invoke-static {v1, v3}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    iput-object p1, v0, Le1/l;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 84
    .line 85
    iput p2, v0, Le1/l;->g:F

    .line 86
    .line 87
    const/high16 p1, -0x40800000    # -1.0f

    .line 88
    .line 89
    iput p1, v0, Le1/l;->h:F

    .line 90
    .line 91
    return-void
.end method

.method public h(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/D;

    .line 4
    .line 5
    iput-boolean p1, v0, Le1/D;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public i(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    iget-object v1, v0, Le1/l;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    const-string v3, "Position has already been set using position: "

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v2, v1}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    iput-object p1, v0, Le1/l;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 26
    .line 27
    return-void
.end method

.method public j(Ll/i;Ll/j;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/f;

    .line 4
    .line 5
    iget-object v1, v0, Ll/f;->j:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Ll/f;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    const/4 v5, -0x1

    .line 19
    if-ge v4, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    check-cast v6, Ll/e;

    .line 26
    .line 27
    iget-object v6, v6, Ll/e;->b:Ll/i;

    .line 28
    .line 29
    if-ne p1, v6, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v5

    .line 36
    :goto_1
    if-ne v4, v5, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v4, v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    move-object v2, v0

    .line 52
    check-cast v2, Ll/e;

    .line 53
    .line 54
    :cond_3
    move-object v5, v2

    .line 55
    new-instance v3, LV2/l;

    .line 56
    .line 57
    const/4 v8, 0x1

    .line 58
    move-object v4, p0

    .line 59
    move-object v7, p1

    .line 60
    move-object v6, p2

    .line 61
    invoke-direct/range {v3 .. v8}, LV2/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide p1

    .line 68
    const-wide/16 v4, 0xc8

    .line 69
    .line 70
    add-long/2addr p1, v4

    .line 71
    invoke-virtual {v1, v3, v7, p1, p2}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public k(Ll/i;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lm/j;

    .line 4
    .line 5
    iget-object v1, v0, Lm/j;->g:Ll/i;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    move-object v1, p1

    .line 12
    check-cast v1, Ll/s;

    .line 13
    .line 14
    iget-object v1, v1, Ll/s;->w:Ll/j;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, Lm/j;->i:Ll/n;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, p1}, Ll/n;->k(Ll/i;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    return p1

    .line 31
    :cond_1
    return v2
.end method

.method public l(Ll/i;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ll/f;

    .line 4
    .line 5
    iget-object p2, p2, Ll/f;->j:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Le1/l;

    .line 4
    .line 5
    const/high16 v1, 0x43b40000    # 360.0f

    .line 6
    .line 7
    rem-float/2addr p1, v1

    .line 8
    add-float/2addr p1, v1

    .line 9
    rem-float/2addr p1, v1

    .line 10
    iput p1, v0, Le1/l;->j:F

    .line 11
    .line 12
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LZ2/s;

    .line 4
    .line 5
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lm3/a;

    .line 8
    .line 9
    const/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, LZ2/s;->i:LZ2/z;

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    new-instance v2, LZ2/z;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    const/16 v3, 0x3f2

    .line 25
    .line 26
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const-string v4, "alias"

    .line 31
    .line 32
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    const/16 v3, 0x3f5

    .line 36
    .line 37
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "allScroll"

    .line 42
    .line 43
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    const-string v4, "basic"

    .line 47
    .line 48
    invoke-virtual {v2, v4, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const/16 v4, 0x3ee

    .line 52
    .line 53
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "cell"

    .line 58
    .line 59
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    const/16 v4, 0x3ea

    .line 63
    .line 64
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    const-string v5, "click"

    .line 69
    .line 70
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    const/16 v4, 0x3e9

    .line 74
    .line 75
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    const-string v5, "contextMenu"

    .line 80
    .line 81
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    const/16 v4, 0x3f3

    .line 85
    .line 86
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    const-string v5, "copy"

    .line 91
    .line 92
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    const/16 v4, 0x3f4

    .line 96
    .line 97
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    const-string v5, "forbidden"

    .line 102
    .line 103
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    const/16 v5, 0x3fc

    .line 107
    .line 108
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    const-string v6, "grab"

    .line 113
    .line 114
    invoke-virtual {v2, v6, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    const/16 v5, 0x3fd

    .line 118
    .line 119
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    const-string v6, "grabbing"

    .line 124
    .line 125
    invoke-virtual {v2, v6, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    const/16 v5, 0x3eb

    .line 129
    .line 130
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    const-string v6, "help"

    .line 135
    .line 136
    invoke-virtual {v2, v6, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    const-string v5, "move"

    .line 140
    .line 141
    invoke-virtual {v2, v5, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    const/4 v3, 0x0

    .line 145
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    const-string v5, "none"

    .line 150
    .line 151
    invoke-virtual {v2, v5, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    const-string v3, "noDrop"

    .line 155
    .line 156
    invoke-virtual {v2, v3, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    const/16 v3, 0x3ef

    .line 160
    .line 161
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    const-string v4, "precise"

    .line 166
    .line 167
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    const/16 v3, 0x3f0

    .line 171
    .line 172
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    const-string v4, "text"

    .line 177
    .line 178
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    const/16 v3, 0x3f6

    .line 182
    .line 183
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    const-string v4, "resizeColumn"

    .line 188
    .line 189
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    const/16 v4, 0x3f7

    .line 193
    .line 194
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    const-string v5, "resizeDown"

    .line 199
    .line 200
    invoke-virtual {v2, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    const/16 v5, 0x3f8

    .line 204
    .line 205
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    const-string v6, "resizeUpLeft"

    .line 210
    .line 211
    invoke-virtual {v2, v6, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    const/16 v7, 0x3f9

    .line 215
    .line 216
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    const-string v8, "resizeDownRight"

    .line 221
    .line 222
    invoke-virtual {v2, v8, v7}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    const-string v8, "resizeLeft"

    .line 226
    .line 227
    invoke-virtual {v2, v8, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    const-string v8, "resizeLeftRight"

    .line 231
    .line 232
    invoke-virtual {v2, v8, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    const-string v8, "resizeRight"

    .line 236
    .line 237
    invoke-virtual {v2, v8, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    const-string v3, "resizeRow"

    .line 241
    .line 242
    invoke-virtual {v2, v3, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    const-string v3, "resizeUp"

    .line 246
    .line 247
    invoke-virtual {v2, v3, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    const-string v3, "resizeUpDown"

    .line 251
    .line 252
    invoke-virtual {v2, v3, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v2, v6, v7}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    const-string v3, "resizeUpRight"

    .line 259
    .line 260
    invoke-virtual {v2, v3, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    const-string v3, "resizeUpLeftDownRight"

    .line 264
    .line 265
    invoke-virtual {v2, v3, v7}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    const-string v3, "resizeUpRightDownLeft"

    .line 269
    .line 270
    invoke-virtual {v2, v3, v5}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    const/16 v3, 0x3f1

    .line 274
    .line 275
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    const-string v4, "verticalText"

    .line 280
    .line 281
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    const/16 v3, 0x3ec

    .line 285
    .line 286
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    const-string v4, "wait"

    .line 291
    .line 292
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    const/16 v3, 0x3fa

    .line 296
    .line 297
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    const-string v4, "zoomIn"

    .line 302
    .line 303
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    const/16 v3, 0x3fb

    .line 307
    .line 308
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    const-string v4, "zoomOut"

    .line 313
    .line 314
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    sput-object v2, LZ2/s;->i:LZ2/z;

    .line 318
    .line 319
    :cond_0
    sget-object v2, LZ2/s;->i:LZ2/z;

    .line 320
    .line 321
    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    check-cast p1, Ljava/lang/Integer;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    move-object v1, v0

    .line 332
    check-cast v1, LZ2/p;

    .line 333
    .line 334
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-static {v1, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    invoke-interface {v0, p1}, Lm3/a;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 343
    .line 344
    .line 345
    return-void
.end method

.method public onMethodCall(Lk3/l;Lk3/n;)V
    .locals 38

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget v2, v1, Lio/flutter/plugin/editing/j;->e:I

    .line 6
    .line 7
    const/16 v3, 0xb

    .line 8
    .line 9
    const/16 v8, 0x8

    .line 10
    .line 11
    const-string v9, "error"

    .line 12
    .line 13
    const/4 v10, 0x2

    .line 14
    const/4 v11, 0x0

    .line 15
    const/4 v12, 0x0

    .line 16
    const/4 v13, 0x3

    .line 17
    const/4 v14, 0x4

    .line 18
    const/4 v15, 0x1

    .line 19
    const/4 v7, 0x5

    .line 20
    packed-switch v2, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    :pswitch_0
    const-string v2, "data"

    .line 24
    .line 25
    iget-object v4, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v4, LZ2/s;

    .line 28
    .line 29
    iget-object v5, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v5, Lio/flutter/plugin/editing/j;

    .line 32
    .line 33
    if-nez v5, :cond_0

    .line 34
    .line 35
    goto/16 :goto_d

    .line 36
    .line 37
    :cond_0
    iget-object v5, v0, Lk3/l;->a:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v19

    .line 48
    sparse-switch v19, :sswitch_data_0

    .line 49
    .line 50
    .line 51
    :goto_0
    const/16 v16, -0x1

    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :sswitch_0
    const-string v6, "TextInput.requestAutofill"

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-nez v5, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/16 v16, 0x9

    .line 65
    .line 66
    goto/16 :goto_1

    .line 67
    .line 68
    :sswitch_1
    const-string v6, "TextInput.clearClient"

    .line 69
    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-nez v5, :cond_2

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    move/from16 v16, v8

    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :sswitch_2
    const-string v6, "TextInput.finishAutofillContext"

    .line 82
    .line 83
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-nez v5, :cond_3

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    const/16 v16, 0x7

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :sswitch_3
    const-string v6, "TextInput.setEditableSizeAndTransform"

    .line 94
    .line 95
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-nez v5, :cond_4

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    const/16 v16, 0x6

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :sswitch_4
    const-string v6, "TextInput.sendAppPrivateCommand"

    .line 106
    .line 107
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-nez v5, :cond_5

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    move/from16 v16, v7

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :sswitch_5
    const-string v6, "TextInput.show"

    .line 118
    .line 119
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_6

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_6
    move/from16 v16, v14

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :sswitch_6
    const-string v6, "TextInput.hide"

    .line 130
    .line 131
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    if-nez v5, :cond_7

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_7
    move/from16 v16, v13

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :sswitch_7
    const-string v6, "TextInput.setClient"

    .line 142
    .line 143
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-nez v5, :cond_8

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_8
    move/from16 v16, v10

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :sswitch_8
    const-string v6, "TextInput.setEditingState"

    .line 154
    .line 155
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    if-nez v5, :cond_9

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_9
    move/from16 v16, v15

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :sswitch_9
    const-string v6, "TextInput.setPlatformViewClient"

    .line 166
    .line 167
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    if-nez v5, :cond_a

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_a
    move/from16 v16, v12

    .line 175
    .line 176
    :goto_1
    const/16 v5, 0x1a

    .line 177
    .line 178
    packed-switch v16, :pswitch_data_1

    .line 179
    .line 180
    .line 181
    move-object/from16 v0, p2

    .line 182
    .line 183
    check-cast v0, LQ2/g;

    .line 184
    .line 185
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 186
    .line 187
    .line 188
    goto/16 :goto_d

    .line 189
    .line 190
    :pswitch_1
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 191
    .line 192
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 193
    .line 194
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 195
    .line 196
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 197
    .line 198
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 199
    .line 200
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 201
    .line 202
    if-lt v3, v5, :cond_b

    .line 203
    .line 204
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->c:Landroid/view/autofill/AutofillManager;

    .line 205
    .line 206
    if-eqz v3, :cond_b

    .line 207
    .line 208
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->g:Landroid/util/SparseArray;

    .line 209
    .line 210
    if-eqz v3, :cond_b

    .line 211
    .line 212
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->f:Lj3/m;

    .line 213
    .line 214
    iget-object v3, v3, Lj3/m;->j:LV1/y;

    .line 215
    .line 216
    iget-object v3, v3, LV1/y;->f:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v3, Ljava/lang/String;

    .line 219
    .line 220
    new-array v4, v10, [I

    .line 221
    .line 222
    invoke-virtual {v2, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 223
    .line 224
    .line 225
    new-instance v5, Landroid/graphics/Rect;

    .line 226
    .line 227
    iget-object v6, v0, Lio/flutter/plugin/editing/k;->m:Landroid/graphics/Rect;

    .line 228
    .line 229
    invoke-direct {v5, v6}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 230
    .line 231
    .line 232
    aget v6, v4, v12

    .line 233
    .line 234
    aget v4, v4, v15

    .line 235
    .line 236
    invoke-virtual {v5, v6, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 237
    .line 238
    .line 239
    iget-object v0, v0, Lio/flutter/plugin/editing/k;->c:Landroid/view/autofill/AutofillManager;

    .line 240
    .line 241
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    invoke-static {v0, v2, v3, v5}, Lcom/dexterous/flutterlocalnotifications/a;->v(Landroid/view/autofill/AutofillManager;Landroid/view/View;ILandroid/graphics/Rect;)V

    .line 246
    .line 247
    .line 248
    :cond_b
    move-object/from16 v0, p2

    .line 249
    .line 250
    check-cast v0, LQ2/g;

    .line 251
    .line 252
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_d

    .line 256
    .line 257
    :pswitch_2
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 258
    .line 259
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 260
    .line 261
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 262
    .line 263
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 264
    .line 265
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 266
    .line 267
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 268
    .line 269
    iget v3, v3, LB2/e;->b:I

    .line 270
    .line 271
    if-ne v3, v13, :cond_c

    .line 272
    .line 273
    goto :goto_2

    .line 274
    :cond_c
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->h:Lio/flutter/plugin/editing/f;

    .line 275
    .line 276
    invoke-virtual {v3, v0}, Lio/flutter/plugin/editing/f;->e(Lio/flutter/plugin/editing/e;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0}, Lio/flutter/plugin/editing/k;->d()V

    .line 280
    .line 281
    .line 282
    iput-object v11, v0, Lio/flutter/plugin/editing/k;->f:Lj3/m;

    .line 283
    .line 284
    invoke-virtual {v0, v11}, Lio/flutter/plugin/editing/k;->e(Lj3/m;)V

    .line 285
    .line 286
    .line 287
    new-instance v3, LB2/e;

    .line 288
    .line 289
    invoke-direct {v3, v15, v12, v7}, LB2/e;-><init>(III)V

    .line 290
    .line 291
    .line 292
    iput-object v3, v0, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 293
    .line 294
    iput-object v11, v0, Lio/flutter/plugin/editing/k;->m:Landroid/graphics/Rect;

    .line 295
    .line 296
    sget-object v3, LD/z;->a:Ljava/lang/reflect/Field;

    .line 297
    .line 298
    invoke-static {v2}, LD/u;->a(Landroid/view/View;)LD/W;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    if-eqz v3, :cond_d

    .line 303
    .line 304
    iget-object v3, v3, LD/W;->a:LD/S;

    .line 305
    .line 306
    invoke-virtual {v3, v8}, LD/S;->n(I)Z

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    if-nez v3, :cond_d

    .line 311
    .line 312
    iget-object v0, v0, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 313
    .line 314
    invoke-virtual {v0, v2}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 315
    .line 316
    .line 317
    :cond_d
    :goto_2
    move-object/from16 v0, p2

    .line 318
    .line 319
    check-cast v0, LQ2/g;

    .line 320
    .line 321
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    goto/16 :goto_d

    .line 325
    .line 326
    :pswitch_3
    iget-object v2, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 327
    .line 328
    check-cast v2, Lio/flutter/plugin/editing/j;

    .line 329
    .line 330
    check-cast v0, Ljava/lang/Boolean;

    .line 331
    .line 332
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 337
    .line 338
    if-lt v3, v5, :cond_10

    .line 339
    .line 340
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 341
    .line 342
    check-cast v2, Lio/flutter/plugin/editing/k;

    .line 343
    .line 344
    iget-object v2, v2, Lio/flutter/plugin/editing/k;->c:Landroid/view/autofill/AutofillManager;

    .line 345
    .line 346
    if-nez v2, :cond_e

    .line 347
    .line 348
    goto :goto_3

    .line 349
    :cond_e
    if-eqz v0, :cond_f

    .line 350
    .line 351
    invoke-static {v2}, Lio/flutter/plugin/editing/i;->o(Landroid/view/autofill/AutofillManager;)V

    .line 352
    .line 353
    .line 354
    goto :goto_3

    .line 355
    :cond_f
    invoke-static {v2}, Lio/flutter/plugin/editing/i;->s(Landroid/view/autofill/AutofillManager;)V

    .line 356
    .line 357
    .line 358
    goto :goto_3

    .line 359
    :cond_10
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 360
    .line 361
    .line 362
    :goto_3
    move-object/from16 v0, p2

    .line 363
    .line 364
    check-cast v0, LQ2/g;

    .line 365
    .line 366
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 367
    .line 368
    .line 369
    goto/16 :goto_d

    .line 370
    .line 371
    :pswitch_4
    :try_start_0
    check-cast v0, Lorg/json/JSONObject;

    .line 372
    .line 373
    const-string v2, "width"

    .line 374
    .line 375
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 376
    .line 377
    .line 378
    move-result-wide v14

    .line 379
    const-string v2, "height"

    .line 380
    .line 381
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 382
    .line 383
    .line 384
    move-result-wide v16

    .line 385
    const-string v2, "transform"

    .line 386
    .line 387
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    const/16 v2, 0x10

    .line 392
    .line 393
    new-array v3, v2, [D

    .line 394
    .line 395
    :goto_4
    if-ge v12, v2, :cond_11

    .line 396
    .line 397
    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getDouble(I)D

    .line 398
    .line 399
    .line 400
    move-result-wide v5

    .line 401
    aput-wide v5, v3, v12

    .line 402
    .line 403
    add-int/lit8 v12, v12, 0x1

    .line 404
    .line 405
    goto :goto_4

    .line 406
    :catch_0
    move-exception v0

    .line 407
    goto :goto_5

    .line 408
    :cond_11
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 409
    .line 410
    move-object v13, v0

    .line 411
    check-cast v13, Lio/flutter/plugin/editing/j;

    .line 412
    .line 413
    move-object/from16 v18, v3

    .line 414
    .line 415
    invoke-virtual/range {v13 .. v18}, Lio/flutter/plugin/editing/j;->t(DD[D)V

    .line 416
    .line 417
    .line 418
    move-object/from16 v0, p2

    .line 419
    .line 420
    check-cast v0, LQ2/g;

    .line 421
    .line 422
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 423
    .line 424
    .line 425
    goto/16 :goto_d

    .line 426
    .line 427
    :goto_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    move-object/from16 v2, p2

    .line 432
    .line 433
    check-cast v2, LQ2/g;

    .line 434
    .line 435
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 436
    .line 437
    .line 438
    goto/16 :goto_d

    .line 439
    .line 440
    :pswitch_5
    :try_start_1
    check-cast v0, Lorg/json/JSONObject;

    .line 441
    .line 442
    const-string v3, "action"

    .line 443
    .line 444
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    if-eqz v0, :cond_12

    .line 453
    .line 454
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 455
    .line 456
    .line 457
    move-result v5

    .line 458
    if-nez v5, :cond_12

    .line 459
    .line 460
    new-instance v5, Landroid/os/Bundle;

    .line 461
    .line 462
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v5, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    goto :goto_6

    .line 469
    :catch_1
    move-exception v0

    .line 470
    goto :goto_7

    .line 471
    :cond_12
    move-object v5, v11

    .line 472
    :goto_6
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 473
    .line 474
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 475
    .line 476
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 477
    .line 478
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 479
    .line 480
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 481
    .line 482
    iget-object v0, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 483
    .line 484
    invoke-virtual {v2, v0, v3, v5}, Landroid/view/inputmethod/InputMethodManager;->sendAppPrivateCommand(Landroid/view/View;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 485
    .line 486
    .line 487
    move-object/from16 v0, p2

    .line 488
    .line 489
    check-cast v0, LQ2/g;

    .line 490
    .line 491
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 492
    .line 493
    .line 494
    goto/16 :goto_d

    .line 495
    .line 496
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    move-object/from16 v2, p2

    .line 501
    .line 502
    check-cast v2, LQ2/g;

    .line 503
    .line 504
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 505
    .line 506
    .line 507
    goto/16 :goto_d

    .line 508
    .line 509
    :pswitch_6
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 510
    .line 511
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 512
    .line 513
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 514
    .line 515
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 516
    .line 517
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 518
    .line 519
    iget-object v4, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 520
    .line 521
    iget-object v5, v0, Lio/flutter/plugin/editing/k;->f:Lj3/m;

    .line 522
    .line 523
    if-eqz v5, :cond_14

    .line 524
    .line 525
    iget-object v5, v5, Lj3/m;->g:Lj3/n;

    .line 526
    .line 527
    iget v5, v5, Lj3/n;->a:I

    .line 528
    .line 529
    if-eq v5, v3, :cond_13

    .line 530
    .line 531
    goto :goto_8

    .line 532
    :cond_13
    invoke-virtual {v0}, Lio/flutter/plugin/editing/k;->d()V

    .line 533
    .line 534
    .line 535
    invoke-virtual {v4}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    .line 536
    .line 537
    .line 538
    move-result-object v0

    .line 539
    invoke-virtual {v2, v0, v12}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 540
    .line 541
    .line 542
    goto :goto_9

    .line 543
    :cond_14
    :goto_8
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 544
    .line 545
    .line 546
    invoke-virtual {v2, v4, v12}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 547
    .line 548
    .line 549
    :goto_9
    move-object/from16 v0, p2

    .line 550
    .line 551
    check-cast v0, LQ2/g;

    .line 552
    .line 553
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 554
    .line 555
    .line 556
    goto/16 :goto_d

    .line 557
    .line 558
    :pswitch_7
    iget-object v0, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 559
    .line 560
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 561
    .line 562
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 563
    .line 564
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 565
    .line 566
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 567
    .line 568
    iget v2, v2, LB2/e;->b:I

    .line 569
    .line 570
    if-ne v2, v14, :cond_15

    .line 571
    .line 572
    invoke-virtual {v0}, Lio/flutter/plugin/editing/k;->d()V

    .line 573
    .line 574
    .line 575
    goto :goto_a

    .line 576
    :cond_15
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 577
    .line 578
    invoke-virtual {v0}, Lio/flutter/plugin/editing/k;->d()V

    .line 579
    .line 580
    .line 581
    iget-object v0, v0, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 582
    .line 583
    invoke-virtual {v2}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    .line 584
    .line 585
    .line 586
    move-result-object v2

    .line 587
    invoke-virtual {v0, v2, v12}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 588
    .line 589
    .line 590
    :goto_a
    move-object/from16 v0, p2

    .line 591
    .line 592
    check-cast v0, LQ2/g;

    .line 593
    .line 594
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 595
    .line 596
    .line 597
    goto/16 :goto_d

    .line 598
    .line 599
    :pswitch_8
    :try_start_2
    check-cast v0, Lorg/json/JSONArray;

    .line 600
    .line 601
    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getInt(I)I

    .line 602
    .line 603
    .line 604
    move-result v2

    .line 605
    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    iget-object v3, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 610
    .line 611
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 612
    .line 613
    invoke-static {v0}, Lj3/m;->a(Lorg/json/JSONObject;)Lj3/m;

    .line 614
    .line 615
    .line 616
    move-result-object v0

    .line 617
    invoke-virtual {v3, v2, v0}, Lio/flutter/plugin/editing/j;->s(ILj3/m;)V

    .line 618
    .line 619
    .line 620
    move-object/from16 v0, p2

    .line 621
    .line 622
    check-cast v0, LQ2/g;

    .line 623
    .line 624
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_2

    .line 625
    .line 626
    .line 627
    goto/16 :goto_d

    .line 628
    .line 629
    :catch_2
    move-exception v0

    .line 630
    goto :goto_b

    .line 631
    :catch_3
    move-exception v0

    .line 632
    :goto_b
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    move-object/from16 v2, p2

    .line 637
    .line 638
    check-cast v2, LQ2/g;

    .line 639
    .line 640
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 641
    .line 642
    .line 643
    goto :goto_d

    .line 644
    :pswitch_9
    :try_start_3
    check-cast v0, Lorg/json/JSONObject;

    .line 645
    .line 646
    iget-object v2, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 647
    .line 648
    check-cast v2, Lio/flutter/plugin/editing/j;

    .line 649
    .line 650
    invoke-static {v0}, Lj3/o;->a(Lorg/json/JSONObject;)Lj3/o;

    .line 651
    .line 652
    .line 653
    move-result-object v0

    .line 654
    invoke-virtual {v2, v0}, Lio/flutter/plugin/editing/j;->u(Lj3/o;)V

    .line 655
    .line 656
    .line 657
    move-object/from16 v0, p2

    .line 658
    .line 659
    check-cast v0, LQ2/g;

    .line 660
    .line 661
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_4

    .line 662
    .line 663
    .line 664
    goto :goto_d

    .line 665
    :catch_4
    move-exception v0

    .line 666
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    move-object/from16 v2, p2

    .line 671
    .line 672
    check-cast v2, LQ2/g;

    .line 673
    .line 674
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 675
    .line 676
    .line 677
    goto :goto_d

    .line 678
    :pswitch_a
    :try_start_4
    check-cast v0, Lorg/json/JSONObject;

    .line 679
    .line 680
    const-string v2, "platformViewId"

    .line 681
    .line 682
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 683
    .line 684
    .line 685
    move-result v2

    .line 686
    const-string v3, "usesVirtualDisplay"

    .line 687
    .line 688
    invoke-virtual {v0, v3, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 689
    .line 690
    .line 691
    move-result v0

    .line 692
    iget-object v3, v4, LZ2/s;->g:Ljava/lang/Object;

    .line 693
    .line 694
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 695
    .line 696
    iget-object v3, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 697
    .line 698
    check-cast v3, Lio/flutter/plugin/editing/k;

    .line 699
    .line 700
    iget-object v4, v3, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 701
    .line 702
    if-eqz v0, :cond_16

    .line 703
    .line 704
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 705
    .line 706
    .line 707
    new-instance v0, LB2/e;

    .line 708
    .line 709
    invoke-direct {v0, v13, v2, v7}, LB2/e;-><init>(III)V

    .line 710
    .line 711
    .line 712
    iput-object v0, v3, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 713
    .line 714
    iget-object v0, v3, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 715
    .line 716
    invoke-virtual {v0, v4}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 717
    .line 718
    .line 719
    iput-boolean v12, v3, Lio/flutter/plugin/editing/k;->i:Z

    .line 720
    .line 721
    goto :goto_c

    .line 722
    :cond_16
    new-instance v0, LB2/e;

    .line 723
    .line 724
    invoke-direct {v0, v14, v2, v7}, LB2/e;-><init>(III)V

    .line 725
    .line 726
    .line 727
    iput-object v0, v3, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 728
    .line 729
    iput-object v11, v3, Lio/flutter/plugin/editing/k;->j:Landroid/view/inputmethod/InputConnection;

    .line 730
    .line 731
    :goto_c
    move-object/from16 v0, p2

    .line 732
    .line 733
    check-cast v0, LQ2/g;

    .line 734
    .line 735
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_5

    .line 736
    .line 737
    .line 738
    goto :goto_d

    .line 739
    :catch_5
    move-exception v0

    .line 740
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    move-object/from16 v2, p2

    .line 745
    .line 746
    check-cast v2, LQ2/g;

    .line 747
    .line 748
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 749
    .line 750
    .line 751
    :goto_d
    return-void

    .line 752
    :pswitch_b
    iget-object v2, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 753
    .line 754
    check-cast v2, Lj3/j;

    .line 755
    .line 756
    iget-object v3, v0, Lk3/l;->a:Ljava/lang/String;

    .line 757
    .line 758
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 759
    .line 760
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 761
    .line 762
    .line 763
    const-string v4, "get"

    .line 764
    .line 765
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 766
    .line 767
    .line 768
    move-result v4

    .line 769
    if-nez v4, :cond_18

    .line 770
    .line 771
    const-string v4, "put"

    .line 772
    .line 773
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 774
    .line 775
    .line 776
    move-result v3

    .line 777
    if-nez v3, :cond_17

    .line 778
    .line 779
    move-object/from16 v0, p2

    .line 780
    .line 781
    check-cast v0, LQ2/g;

    .line 782
    .line 783
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 784
    .line 785
    .line 786
    goto :goto_f

    .line 787
    :cond_17
    check-cast v0, [B

    .line 788
    .line 789
    iput-object v0, v2, Lj3/j;->b:[B

    .line 790
    .line 791
    move-object/from16 v0, p2

    .line 792
    .line 793
    check-cast v0, LQ2/g;

    .line 794
    .line 795
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 796
    .line 797
    .line 798
    goto :goto_f

    .line 799
    :cond_18
    iput-boolean v15, v2, Lj3/j;->f:Z

    .line 800
    .line 801
    iget-boolean v0, v2, Lj3/j;->e:Z

    .line 802
    .line 803
    if-nez v0, :cond_1a

    .line 804
    .line 805
    iget-boolean v0, v2, Lj3/j;->a:Z

    .line 806
    .line 807
    if-nez v0, :cond_19

    .line 808
    .line 809
    goto :goto_e

    .line 810
    :cond_19
    move-object/from16 v0, p2

    .line 811
    .line 812
    check-cast v0, LQ2/g;

    .line 813
    .line 814
    iput-object v0, v2, Lj3/j;->d:LQ2/g;

    .line 815
    .line 816
    goto :goto_f

    .line 817
    :cond_1a
    :goto_e
    iget-object v0, v2, Lj3/j;->b:[B

    .line 818
    .line 819
    invoke-static {v0}, Lj3/j;->a([B)Ljava/util/HashMap;

    .line 820
    .line 821
    .line 822
    move-result-object v0

    .line 823
    move-object/from16 v2, p2

    .line 824
    .line 825
    check-cast v2, LQ2/g;

    .line 826
    .line 827
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 828
    .line 829
    .line 830
    :goto_f
    return-void

    .line 831
    :pswitch_c
    iget-object v2, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 832
    .line 833
    check-cast v2, LZ2/s;

    .line 834
    .line 835
    iget-object v4, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 836
    .line 837
    check-cast v4, Lio/flutter/plugin/platform/m;

    .line 838
    .line 839
    if-nez v4, :cond_1b

    .line 840
    .line 841
    goto/16 :goto_15

    .line 842
    .line 843
    :cond_1b
    iget-object v4, v0, Lk3/l;->a:Ljava/lang/String;

    .line 844
    .line 845
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 846
    .line 847
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 848
    .line 849
    .line 850
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 851
    .line 852
    .line 853
    move-result v5

    .line 854
    sparse-switch v5, :sswitch_data_1

    .line 855
    .line 856
    .line 857
    :goto_10
    const/16 v16, -0x1

    .line 858
    .line 859
    goto :goto_11

    .line 860
    :sswitch_a
    const-string v5, "dispose"

    .line 861
    .line 862
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 863
    .line 864
    .line 865
    move-result v4

    .line 866
    if-nez v4, :cond_1c

    .line 867
    .line 868
    goto :goto_10

    .line 869
    :cond_1c
    move/from16 v16, v7

    .line 870
    .line 871
    goto :goto_11

    .line 872
    :sswitch_b
    const-string v5, "isSurfaceControlEnabled"

    .line 873
    .line 874
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 875
    .line 876
    .line 877
    move-result v4

    .line 878
    if-nez v4, :cond_1d

    .line 879
    .line 880
    goto :goto_10

    .line 881
    :cond_1d
    move/from16 v16, v14

    .line 882
    .line 883
    goto :goto_11

    .line 884
    :sswitch_c
    const-string v5, "setDirection"

    .line 885
    .line 886
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 887
    .line 888
    .line 889
    move-result v4

    .line 890
    if-nez v4, :cond_1e

    .line 891
    .line 892
    goto :goto_10

    .line 893
    :cond_1e
    move/from16 v16, v13

    .line 894
    .line 895
    goto :goto_11

    .line 896
    :sswitch_d
    const-string v5, "touch"

    .line 897
    .line 898
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 899
    .line 900
    .line 901
    move-result v4

    .line 902
    if-nez v4, :cond_1f

    .line 903
    .line 904
    goto :goto_10

    .line 905
    :cond_1f
    move/from16 v16, v10

    .line 906
    .line 907
    goto :goto_11

    .line 908
    :sswitch_e
    const-string v5, "clearFocus"

    .line 909
    .line 910
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 911
    .line 912
    .line 913
    move-result v4

    .line 914
    if-nez v4, :cond_20

    .line 915
    .line 916
    goto :goto_10

    .line 917
    :cond_20
    move/from16 v16, v15

    .line 918
    .line 919
    goto :goto_11

    .line 920
    :sswitch_f
    const-string v5, "create"

    .line 921
    .line 922
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 923
    .line 924
    .line 925
    move-result v4

    .line 926
    if-nez v4, :cond_21

    .line 927
    .line 928
    goto :goto_10

    .line 929
    :cond_21
    move/from16 v16, v12

    .line 930
    .line 931
    :goto_11
    const-string v4, "direction"

    .line 932
    .line 933
    const-string v5, "id"

    .line 934
    .line 935
    packed-switch v16, :pswitch_data_2

    .line 936
    .line 937
    .line 938
    move-object/from16 v0, p2

    .line 939
    .line 940
    check-cast v0, LQ2/g;

    .line 941
    .line 942
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 943
    .line 944
    .line 945
    goto/16 :goto_15

    .line 946
    .line 947
    :pswitch_d
    check-cast v0, Ljava/util/Map;

    .line 948
    .line 949
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    .line 951
    .line 952
    move-result-object v0

    .line 953
    check-cast v0, Ljava/lang/Integer;

    .line 954
    .line 955
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 956
    .line 957
    .line 958
    move-result v0

    .line 959
    :try_start_5
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 960
    .line 961
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 962
    .line 963
    invoke-virtual {v2, v0}, Lio/flutter/plugin/platform/m;->n(I)V

    .line 964
    .line 965
    .line 966
    move-object/from16 v0, p2

    .line 967
    .line 968
    check-cast v0, LQ2/g;

    .line 969
    .line 970
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_6

    .line 971
    .line 972
    .line 973
    goto/16 :goto_15

    .line 974
    .line 975
    :catch_6
    move-exception v0

    .line 976
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    move-object/from16 v2, p2

    .line 981
    .line 982
    check-cast v2, LQ2/g;

    .line 983
    .line 984
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 985
    .line 986
    .line 987
    goto/16 :goto_15

    .line 988
    .line 989
    :pswitch_e
    iget-object v0, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 990
    .line 991
    check-cast v0, Lio/flutter/plugin/platform/m;

    .line 992
    .line 993
    iget-object v0, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 994
    .line 995
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 996
    .line 997
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 998
    .line 999
    if-nez v0, :cond_22

    .line 1000
    .line 1001
    goto :goto_12

    .line 1002
    :cond_22
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->IsSurfaceControlEnabled()Z

    .line 1003
    .line 1004
    .line 1005
    move-result v12

    .line 1006
    :goto_12
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1007
    .line 1008
    .line 1009
    move-result-object v0

    .line 1010
    move-object/from16 v2, p2

    .line 1011
    .line 1012
    check-cast v2, LQ2/g;

    .line 1013
    .line 1014
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1015
    .line 1016
    .line 1017
    goto/16 :goto_15

    .line 1018
    .line 1019
    :pswitch_f
    check-cast v0, Ljava/util/Map;

    .line 1020
    .line 1021
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v3

    .line 1025
    check-cast v3, Ljava/lang/Integer;

    .line 1026
    .line 1027
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1028
    .line 1029
    .line 1030
    move-result v3

    .line 1031
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v0

    .line 1035
    check-cast v0, Ljava/lang/Integer;

    .line 1036
    .line 1037
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1038
    .line 1039
    .line 1040
    move-result v0

    .line 1041
    :try_start_6
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1042
    .line 1043
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 1044
    .line 1045
    invoke-virtual {v2, v3, v0}, Lio/flutter/plugin/platform/m;->e(II)V

    .line 1046
    .line 1047
    .line 1048
    move-object/from16 v0, p2

    .line 1049
    .line 1050
    check-cast v0, LQ2/g;

    .line 1051
    .line 1052
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_7

    .line 1053
    .line 1054
    .line 1055
    goto/16 :goto_15

    .line 1056
    .line 1057
    :catch_7
    move-exception v0

    .line 1058
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v0

    .line 1062
    move-object/from16 v2, p2

    .line 1063
    .line 1064
    check-cast v2, LQ2/g;

    .line 1065
    .line 1066
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1067
    .line 1068
    .line 1069
    goto/16 :goto_15

    .line 1070
    .line 1071
    :pswitch_10
    check-cast v0, Ljava/util/List;

    .line 1072
    .line 1073
    new-instance v20, Lj3/f;

    .line 1074
    .line 1075
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1076
    .line 1077
    .line 1078
    move-result-object v4

    .line 1079
    check-cast v4, Ljava/lang/Integer;

    .line 1080
    .line 1081
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1082
    .line 1083
    .line 1084
    move-result v21

    .line 1085
    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v4

    .line 1089
    move-object/from16 v22, v4

    .line 1090
    .line 1091
    check-cast v22, Ljava/lang/Number;

    .line 1092
    .line 1093
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v4

    .line 1097
    move-object/from16 v23, v4

    .line 1098
    .line 1099
    check-cast v23, Ljava/lang/Number;

    .line 1100
    .line 1101
    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v4

    .line 1105
    check-cast v4, Ljava/lang/Integer;

    .line 1106
    .line 1107
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1108
    .line 1109
    .line 1110
    move-result v24

    .line 1111
    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v4

    .line 1115
    check-cast v4, Ljava/lang/Integer;

    .line 1116
    .line 1117
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1118
    .line 1119
    .line 1120
    move-result v25

    .line 1121
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1122
    .line 1123
    .line 1124
    move-result-object v26

    .line 1125
    const/4 v4, 0x6

    .line 1126
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v27

    .line 1130
    const/4 v4, 0x7

    .line 1131
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v4

    .line 1135
    check-cast v4, Ljava/lang/Integer;

    .line 1136
    .line 1137
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1138
    .line 1139
    .line 1140
    move-result v28

    .line 1141
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v4

    .line 1145
    check-cast v4, Ljava/lang/Integer;

    .line 1146
    .line 1147
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1148
    .line 1149
    .line 1150
    move-result v29

    .line 1151
    const/16 v4, 0x9

    .line 1152
    .line 1153
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v4

    .line 1157
    check-cast v4, Ljava/lang/Double;

    .line 1158
    .line 1159
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 1160
    .line 1161
    .line 1162
    move-result-wide v4

    .line 1163
    double-to-float v4, v4

    .line 1164
    const/16 v5, 0xa

    .line 1165
    .line 1166
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1167
    .line 1168
    .line 1169
    move-result-object v5

    .line 1170
    check-cast v5, Ljava/lang/Double;

    .line 1171
    .line 1172
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    .line 1173
    .line 1174
    .line 1175
    move-result-wide v5

    .line 1176
    double-to-float v5, v5

    .line 1177
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v3

    .line 1181
    check-cast v3, Ljava/lang/Integer;

    .line 1182
    .line 1183
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1184
    .line 1185
    .line 1186
    move-result v32

    .line 1187
    const/16 v3, 0xc

    .line 1188
    .line 1189
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v3

    .line 1193
    check-cast v3, Ljava/lang/Integer;

    .line 1194
    .line 1195
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1196
    .line 1197
    .line 1198
    move-result v33

    .line 1199
    const/16 v3, 0xd

    .line 1200
    .line 1201
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1202
    .line 1203
    .line 1204
    move-result-object v3

    .line 1205
    check-cast v3, Ljava/lang/Integer;

    .line 1206
    .line 1207
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1208
    .line 1209
    .line 1210
    move-result v34

    .line 1211
    const/16 v3, 0xe

    .line 1212
    .line 1213
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v3

    .line 1217
    check-cast v3, Ljava/lang/Integer;

    .line 1218
    .line 1219
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1220
    .line 1221
    .line 1222
    move-result v35

    .line 1223
    const/16 v3, 0xf

    .line 1224
    .line 1225
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1226
    .line 1227
    .line 1228
    move-result-object v0

    .line 1229
    check-cast v0, Ljava/lang/Number;

    .line 1230
    .line 1231
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 1232
    .line 1233
    .line 1234
    move-result-wide v36

    .line 1235
    move/from16 v30, v4

    .line 1236
    .line 1237
    move/from16 v31, v5

    .line 1238
    .line 1239
    invoke-direct/range {v20 .. v37}, Lj3/f;-><init>(ILjava/lang/Number;Ljava/lang/Number;IILjava/lang/Object;Ljava/lang/Object;IIFFIIIIJ)V

    .line 1240
    .line 1241
    .line 1242
    move-object/from16 v0, v20

    .line 1243
    .line 1244
    :try_start_7
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1245
    .line 1246
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 1247
    .line 1248
    invoke-virtual {v2, v0}, Lio/flutter/plugin/platform/m;->m(Lj3/f;)V

    .line 1249
    .line 1250
    .line 1251
    move-object/from16 v0, p2

    .line 1252
    .line 1253
    check-cast v0, LQ2/g;

    .line 1254
    .line 1255
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_8

    .line 1256
    .line 1257
    .line 1258
    goto/16 :goto_15

    .line 1259
    .line 1260
    :catch_8
    move-exception v0

    .line 1261
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1262
    .line 1263
    .line 1264
    move-result-object v0

    .line 1265
    move-object/from16 v2, p2

    .line 1266
    .line 1267
    check-cast v2, LQ2/g;

    .line 1268
    .line 1269
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1270
    .line 1271
    .line 1272
    goto/16 :goto_15

    .line 1273
    .line 1274
    :pswitch_11
    check-cast v0, Ljava/lang/Integer;

    .line 1275
    .line 1276
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1277
    .line 1278
    .line 1279
    move-result v0

    .line 1280
    :try_start_8
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1281
    .line 1282
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 1283
    .line 1284
    invoke-virtual {v2, v0}, Lio/flutter/plugin/platform/m;->j(I)V

    .line 1285
    .line 1286
    .line 1287
    move-object/from16 v0, p2

    .line 1288
    .line 1289
    check-cast v0, LQ2/g;

    .line 1290
    .line 1291
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_9

    .line 1292
    .line 1293
    .line 1294
    goto/16 :goto_15

    .line 1295
    .line 1296
    :catch_9
    move-exception v0

    .line 1297
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1298
    .line 1299
    .line 1300
    move-result-object v0

    .line 1301
    move-object/from16 v2, p2

    .line 1302
    .line 1303
    check-cast v2, LQ2/g;

    .line 1304
    .line 1305
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1306
    .line 1307
    .line 1308
    goto/16 :goto_15

    .line 1309
    .line 1310
    :pswitch_12
    check-cast v0, Ljava/util/Map;

    .line 1311
    .line 1312
    const-string v3, "params"

    .line 1313
    .line 1314
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1315
    .line 1316
    .line 1317
    move-result v6

    .line 1318
    if-eqz v6, :cond_23

    .line 1319
    .line 1320
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1321
    .line 1322
    .line 1323
    move-result-object v3

    .line 1324
    check-cast v3, [B

    .line 1325
    .line 1326
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v3

    .line 1330
    goto :goto_13

    .line 1331
    :cond_23
    move-object v3, v11

    .line 1332
    :goto_13
    :try_start_9
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v5

    .line 1336
    check-cast v5, Ljava/lang/Integer;

    .line 1337
    .line 1338
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 1339
    .line 1340
    .line 1341
    move-result v5

    .line 1342
    const-string v6, "viewType"

    .line 1343
    .line 1344
    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1345
    .line 1346
    .line 1347
    move-result-object v6

    .line 1348
    check-cast v6, Ljava/lang/String;

    .line 1349
    .line 1350
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1351
    .line 1352
    .line 1353
    move-result-object v0

    .line 1354
    check-cast v0, Ljava/lang/Integer;

    .line 1355
    .line 1356
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1357
    .line 1358
    .line 1359
    move-result v0

    .line 1360
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1361
    .line 1362
    check-cast v2, Lio/flutter/plugin/platform/m;

    .line 1363
    .line 1364
    iget-object v2, v2, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 1365
    .line 1366
    check-cast v2, Lio/flutter/plugin/platform/o;

    .line 1367
    .line 1368
    iget-object v4, v2, Lio/flutter/plugin/platform/o;->e:Lio/flutter/plugin/platform/m;

    .line 1369
    .line 1370
    iget-object v4, v4, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 1371
    .line 1372
    check-cast v4, Ljava/util/HashMap;

    .line 1373
    .line 1374
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1375
    .line 1376
    .line 1377
    move-result-object v4

    .line 1378
    check-cast v4, Lio/flutter/plugin/platform/f;

    .line 1379
    .line 1380
    if-eqz v4, :cond_26

    .line 1381
    .line 1382
    if-eqz v3, :cond_24

    .line 1383
    .line 1384
    iget-object v6, v4, Lio/flutter/plugin/platform/f;->a:Lk3/u;

    .line 1385
    .line 1386
    invoke-virtual {v6, v3}, Lk3/u;->b(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v3

    .line 1390
    goto :goto_14

    .line 1391
    :cond_24
    move-object v3, v11

    .line 1392
    :goto_14
    iget-object v6, v2, Lio/flutter/plugin/platform/o;->g:LZ2/d;

    .line 1393
    .line 1394
    invoke-virtual {v4, v6, v5, v3}, Lio/flutter/plugin/platform/f;->a(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/e;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v3

    .line 1398
    invoke-interface {v3}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v4

    .line 1402
    if-eqz v4, :cond_25

    .line 1403
    .line 1404
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutDirection(I)V

    .line 1405
    .line 1406
    .line 1407
    iget-object v0, v2, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 1408
    .line 1409
    invoke-virtual {v0, v5, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1410
    .line 1411
    .line 1412
    move-object/from16 v0, p2

    .line 1413
    .line 1414
    check-cast v0, LQ2/g;

    .line 1415
    .line 1416
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1417
    .line 1418
    .line 1419
    goto :goto_15

    .line 1420
    :cond_25
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1421
    .line 1422
    const-string v2, "PlatformView#getView() returned null, but an Android view reference was expected."

    .line 1423
    .line 1424
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1425
    .line 1426
    .line 1427
    throw v0

    .line 1428
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1429
    .line 1430
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1431
    .line 1432
    const-string v3, "Trying to create a platform view of unregistered type: "

    .line 1433
    .line 1434
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1435
    .line 1436
    .line 1437
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1438
    .line 1439
    .line 1440
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1441
    .line 1442
    .line 1443
    move-result-object v2

    .line 1444
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1445
    .line 1446
    .line 1447
    throw v0
    :try_end_9
    .catch Ljava/lang/IllegalStateException; {:try_start_9 .. :try_end_9} :catch_a

    .line 1448
    :catch_a
    move-exception v0

    .line 1449
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1450
    .line 1451
    .line 1452
    move-result-object v0

    .line 1453
    move-object/from16 v2, p2

    .line 1454
    .line 1455
    check-cast v2, LQ2/g;

    .line 1456
    .line 1457
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1458
    .line 1459
    .line 1460
    :goto_15
    return-void

    .line 1461
    :pswitch_13
    invoke-direct/range {p0 .. p2}, Lio/flutter/plugin/editing/j;->q(Lk3/l;Lk3/n;)V

    .line 1462
    .line 1463
    .line 1464
    return-void

    .line 1465
    :pswitch_14
    const-string v2, "locale"

    .line 1466
    .line 1467
    iget-object v3, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 1468
    .line 1469
    check-cast v3, LZ2/s;

    .line 1470
    .line 1471
    iget-object v4, v3, LZ2/s;->g:Ljava/lang/Object;

    .line 1472
    .line 1473
    check-cast v4, Lj3/b;

    .line 1474
    .line 1475
    if-nez v4, :cond_27

    .line 1476
    .line 1477
    goto :goto_18

    .line 1478
    :cond_27
    iget-object v4, v0, Lk3/l;->a:Ljava/lang/String;

    .line 1479
    .line 1480
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1481
    .line 1482
    .line 1483
    const-string v5, "Localization.getStringResource"

    .line 1484
    .line 1485
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1486
    .line 1487
    .line 1488
    move-result v4

    .line 1489
    if-nez v4, :cond_28

    .line 1490
    .line 1491
    move-object/from16 v0, p2

    .line 1492
    .line 1493
    check-cast v0, LQ2/g;

    .line 1494
    .line 1495
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 1496
    .line 1497
    .line 1498
    goto :goto_18

    .line 1499
    :cond_28
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 1500
    .line 1501
    check-cast v0, Lorg/json/JSONObject;

    .line 1502
    .line 1503
    :try_start_a
    const-string v4, "key"

    .line 1504
    .line 1505
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 1506
    .line 1507
    .line 1508
    move-result-object v4

    .line 1509
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 1510
    .line 1511
    .line 1512
    move-result v5

    .line 1513
    if-eqz v5, :cond_29

    .line 1514
    .line 1515
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 1516
    .line 1517
    .line 1518
    move-result-object v0

    .line 1519
    goto :goto_16

    .line 1520
    :catch_b
    move-exception v0

    .line 1521
    goto :goto_17

    .line 1522
    :cond_29
    move-object v0, v11

    .line 1523
    :goto_16
    iget-object v2, v3, LZ2/s;->g:Ljava/lang/Object;

    .line 1524
    .line 1525
    check-cast v2, Lj3/b;

    .line 1526
    .line 1527
    invoke-virtual {v2, v4, v0}, Lj3/b;->p(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1528
    .line 1529
    .line 1530
    move-result-object v0

    .line 1531
    move-object/from16 v2, p2

    .line 1532
    .line 1533
    check-cast v2, LQ2/g;

    .line 1534
    .line 1535
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_b

    .line 1536
    .line 1537
    .line 1538
    goto :goto_18

    .line 1539
    :goto_17
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1540
    .line 1541
    .line 1542
    move-result-object v0

    .line 1543
    move-object/from16 v2, p2

    .line 1544
    .line 1545
    check-cast v2, LQ2/g;

    .line 1546
    .line 1547
    invoke-virtual {v2, v9, v0, v11}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1548
    .line 1549
    .line 1550
    :goto_18
    return-void

    .line 1551
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_14
        :pswitch_0
        :pswitch_13
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 1552
    .line 1553
    .line 1554
    .line 1555
    .line 1556
    .line 1557
    .line 1558
    .line 1559
    .line 1560
    .line 1561
    .line 1562
    .line 1563
    .line 1564
    .line 1565
    :sswitch_data_0
    .sparse-switch
        -0x6a0a6d0c -> :sswitch_9
        -0x3c861a16 -> :sswitch_8
        -0x23d2364 -> :sswitch_7
        0x101f2613 -> :sswitch_6
        0x102423ce -> :sswitch_5
        0x26b1e570 -> :sswitch_4
        0x47cf0f0b -> :sswitch_3
        0x66f8a3d9 -> :sswitch_2
        0x71834287 -> :sswitch_1
        0x7df775f0 -> :sswitch_0
    .end sparse-switch

    .line 1566
    .line 1567
    .line 1568
    .line 1569
    .line 1570
    .line 1571
    .line 1572
    .line 1573
    .line 1574
    .line 1575
    .line 1576
    .line 1577
    .line 1578
    .line 1579
    .line 1580
    .line 1581
    .line 1582
    .line 1583
    .line 1584
    .line 1585
    .line 1586
    .line 1587
    .line 1588
    .line 1589
    .line 1590
    .line 1591
    .line 1592
    .line 1593
    .line 1594
    .line 1595
    .line 1596
    .line 1597
    .line 1598
    .line 1599
    .line 1600
    .line 1601
    .line 1602
    .line 1603
    .line 1604
    .line 1605
    .line 1606
    .line 1607
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 1608
    .line 1609
    .line 1610
    .line 1611
    .line 1612
    .line 1613
    .line 1614
    .line 1615
    .line 1616
    .line 1617
    .line 1618
    .line 1619
    .line 1620
    .line 1621
    .line 1622
    .line 1623
    .line 1624
    .line 1625
    .line 1626
    .line 1627
    .line 1628
    .line 1629
    .line 1630
    .line 1631
    :sswitch_data_1
    .sparse-switch
        -0x509a5f04 -> :sswitch_f
        -0x2d106975 -> :sswitch_e
        0x696df3f -> :sswitch_d
        0x2261393d -> :sswitch_c
        0x2cc8f227 -> :sswitch_b
        0x63a5261f -> :sswitch_a
    .end sparse-switch

    .line 1632
    .line 1633
    .line 1634
    .line 1635
    .line 1636
    .line 1637
    .line 1638
    .line 1639
    .line 1640
    .line 1641
    .line 1642
    .line 1643
    .line 1644
    .line 1645
    .line 1646
    .line 1647
    .line 1648
    .line 1649
    .line 1650
    .line 1651
    .line 1652
    .line 1653
    .line 1654
    .line 1655
    .line 1656
    .line 1657
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch
.end method

.method public p(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/text/method/NumberKeyListener;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, LA0/c;

    .line 8
    .line 9
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LA/c;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    instance-of v0, p1, LP/e;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    if-nez p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    return-object p1

    .line 25
    :cond_1
    instance-of v0, p1, Landroid/text/method/NumberKeyListener;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_2
    new-instance v0, LP/e;

    .line 31
    .line 32
    invoke-direct {v0, p1}, LP/e;-><init>(Landroid/text/method/KeyListener;)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_3
    return-object p1
.end method

.method public s(ILj3/m;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 4
    .line 5
    invoke-virtual {v0}, Lio/flutter/plugin/editing/k;->d()V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, Lio/flutter/plugin/editing/k;->f:Lj3/m;

    .line 9
    .line 10
    new-instance v1, LB2/e;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x5

    .line 14
    invoke-direct {v1, v2, p1, v3}, LB2/e;-><init>(III)V

    .line 15
    .line 16
    .line 17
    iput-object v1, v0, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 18
    .line 19
    iget-object p1, v0, Lio/flutter/plugin/editing/k;->h:Lio/flutter/plugin/editing/f;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lio/flutter/plugin/editing/f;->e(Lio/flutter/plugin/editing/e;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lio/flutter/plugin/editing/f;

    .line 25
    .line 26
    iget-object v1, p2, Lj3/m;->j:LV1/y;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, v1, LV1/y;->h:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Lj3/o;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v1, v2

    .line 37
    :goto_0
    iget-object v3, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 38
    .line 39
    invoke-direct {p1, v1, v3}, Lio/flutter/plugin/editing/f;-><init>(Lj3/o;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, v0, Lio/flutter/plugin/editing/k;->h:Lio/flutter/plugin/editing/f;

    .line 43
    .line 44
    invoke-virtual {v0, p2}, Lio/flutter/plugin/editing/k;->e(Lj3/m;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, v0, Lio/flutter/plugin/editing/k;->i:Z

    .line 49
    .line 50
    iget-object p1, v0, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 51
    .line 52
    iget p1, p1, LB2/e;->b:I

    .line 53
    .line 54
    const/4 p2, 0x3

    .line 55
    if-ne p1, p2, :cond_1

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    iput-boolean p1, v0, Lio/flutter/plugin/editing/k;->p:Z

    .line 59
    .line 60
    :cond_1
    iput-object v2, v0, Lio/flutter/plugin/editing/k;->m:Landroid/graphics/Rect;

    .line 61
    .line 62
    iget-object p1, v0, Lio/flutter/plugin/editing/k;->h:Lio/flutter/plugin/editing/f;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lio/flutter/plugin/editing/f;->a(Lio/flutter/plugin/editing/e;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public setVisible(Z)V
    .locals 1

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/j;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Le1/D;

    .line 9
    .line 10
    iput-boolean p1, v0, Le1/D;->f:Z

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Le1/l;

    .line 16
    .line 17
    iput-boolean p1, v0, Le1/l;->l:Z

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public t(DD[D)V
    .locals 19

    .line 1
    move-wide/from16 v0, p1

    .line 2
    .line 3
    move-wide/from16 v2, p3

    .line 4
    .line 5
    move-object/from16 v4, p0

    .line 6
    .line 7
    move-object/from16 v5, p5

    .line 8
    .line 9
    iget-object v6, v4, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v6, Lio/flutter/plugin/editing/k;

    .line 12
    .line 13
    const/4 v7, 0x4

    .line 14
    new-array v7, v7, [D

    .line 15
    .line 16
    const/4 v8, 0x3

    .line 17
    aget-wide v9, v5, v8

    .line 18
    .line 19
    const-wide/16 v11, 0x0

    .line 20
    .line 21
    cmpl-double v9, v9, v11

    .line 22
    .line 23
    const/16 v10, 0xf

    .line 24
    .line 25
    const/4 v13, 0x0

    .line 26
    const/4 v14, 0x1

    .line 27
    if-nez v9, :cond_0

    .line 28
    .line 29
    const/4 v9, 0x7

    .line 30
    aget-wide v15, v5, v9

    .line 31
    .line 32
    cmpl-double v9, v15, v11

    .line 33
    .line 34
    if-nez v9, :cond_0

    .line 35
    .line 36
    aget-wide v15, v5, v10

    .line 37
    .line 38
    const-wide/high16 v17, 0x3ff0000000000000L    # 1.0

    .line 39
    .line 40
    cmpl-double v9, v15, v17

    .line 41
    .line 42
    if-nez v9, :cond_0

    .line 43
    .line 44
    move v9, v14

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v9, v13

    .line 47
    :goto_0
    const/16 v15, 0xc

    .line 48
    .line 49
    aget-wide v15, v5, v15

    .line 50
    .line 51
    aget-wide v17, v5, v10

    .line 52
    .line 53
    div-double v15, v15, v17

    .line 54
    .line 55
    aput-wide v15, v7, v14

    .line 56
    .line 57
    aput-wide v15, v7, v13

    .line 58
    .line 59
    const/16 v10, 0xd

    .line 60
    .line 61
    aget-wide v15, v5, v10

    .line 62
    .line 63
    div-double v15, v15, v17

    .line 64
    .line 65
    aput-wide v15, v7, v8

    .line 66
    .line 67
    const/4 v10, 0x2

    .line 68
    aput-wide v15, v7, v10

    .line 69
    .line 70
    new-instance v15, LM0/t;

    .line 71
    .line 72
    invoke-direct {v15, v9, v5, v7}, LM0/t;-><init>(Z[D[D)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v15, v0, v1, v11, v12}, LM0/t;->b(DD)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v15, v0, v1, v2, v3}, LM0/t;->b(DD)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v15, v11, v12, v2, v3}, LM0/t;->b(DD)V

    .line 82
    .line 83
    .line 84
    iget-object v0, v6, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 99
    .line 100
    new-instance v1, Landroid/graphics/Rect;

    .line 101
    .line 102
    aget-wide v2, v7, v13

    .line 103
    .line 104
    float-to-double v11, v0

    .line 105
    mul-double/2addr v2, v11

    .line 106
    double-to-int v0, v2

    .line 107
    aget-wide v2, v7, v10

    .line 108
    .line 109
    mul-double/2addr v2, v11

    .line 110
    double-to-int v2, v2

    .line 111
    aget-wide v9, v7, v14

    .line 112
    .line 113
    mul-double/2addr v9, v11

    .line 114
    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    .line 115
    .line 116
    .line 117
    move-result-wide v9

    .line 118
    double-to-int v3, v9

    .line 119
    aget-wide v8, v7, v8

    .line 120
    .line 121
    mul-double/2addr v8, v11

    .line 122
    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    .line 123
    .line 124
    .line 125
    move-result-wide v7

    .line 126
    double-to-int v5, v7

    .line 127
    invoke-direct {v1, v0, v2, v3, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 128
    .line 129
    .line 130
    iput-object v1, v6, Lio/flutter/plugin/editing/k;->m:Landroid/graphics/Rect;

    .line 131
    .line 132
    return-void
.end method

.method public u(Lj3/o;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/editing/k;

    .line 4
    .line 5
    iget-object v1, v0, Lio/flutter/plugin/editing/k;->a:Landroid/view/View;

    .line 6
    .line 7
    iget-boolean v2, v0, Lio/flutter/plugin/editing/k;->i:Z

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_3

    .line 11
    .line 12
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->o:Lj3/o;

    .line 13
    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    iget v4, v2, Lj3/o;->d:I

    .line 17
    .line 18
    if-ltz v4, :cond_3

    .line 19
    .line 20
    iget v5, v2, Lj3/o;->e:I

    .line 21
    .line 22
    if-le v5, v4, :cond_3

    .line 23
    .line 24
    sub-int/2addr v5, v4

    .line 25
    iget v6, p1, Lj3/o;->e:I

    .line 26
    .line 27
    iget v7, p1, Lj3/o;->d:I

    .line 28
    .line 29
    sub-int/2addr v6, v7

    .line 30
    const/4 v8, 0x1

    .line 31
    if-eq v5, v6, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    move v6, v3

    .line 35
    :goto_0
    if-ge v6, v5, :cond_2

    .line 36
    .line 37
    iget-object v9, v2, Lj3/o;->a:Ljava/lang/String;

    .line 38
    .line 39
    add-int v10, v6, v4

    .line 40
    .line 41
    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    iget-object v10, p1, Lj3/o;->a:Ljava/lang/String;

    .line 46
    .line 47
    add-int v11, v6, v7

    .line 48
    .line 49
    invoke-virtual {v10, v11}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    if-eq v9, v10, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    move v8, v3

    .line 60
    :goto_1
    iput-boolean v8, v0, Lio/flutter/plugin/editing/k;->i:Z

    .line 61
    .line 62
    :cond_3
    iput-object p1, v0, Lio/flutter/plugin/editing/k;->o:Lj3/o;

    .line 63
    .line 64
    iget-object v2, v0, Lio/flutter/plugin/editing/k;->h:Lio/flutter/plugin/editing/f;

    .line 65
    .line 66
    invoke-virtual {v2, p1}, Lio/flutter/plugin/editing/f;->f(Lj3/o;)V

    .line 67
    .line 68
    .line 69
    iget-boolean p1, v0, Lio/flutter/plugin/editing/k;->i:Z

    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    iget-object p1, v0, Lio/flutter/plugin/editing/k;->b:Landroid/view/inputmethod/InputMethodManager;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    iput-boolean v3, v0, Lio/flutter/plugin/editing/k;->i:Z

    .line 79
    .line 80
    :cond_4
    return-void
.end method

.method public v(Le1/o;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lk2/j;

    .line 4
    .line 5
    iget-object v1, v0, Lk2/j;->q:Ls3/j;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lk2/j;->j:Lk2/e;

    .line 10
    .line 11
    iget-object v0, v0, Lk2/e;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ls3/t;

    .line 18
    .line 19
    iget-object v0, v1, Ls3/j;->w:Ls3/w;

    .line 20
    .line 21
    iget-object p1, p1, Ls3/t;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ls3/w;->b(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    return p1

    .line 31
    :cond_0
    const/4 p1, 0x0

    .line 32
    return p1
.end method

.method public w(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LA0/c;

    .line 4
    .line 5
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, LA/c;

    .line 8
    .line 9
    iget-object v0, v0, LA/c;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LP/i;

    .line 12
    .line 13
    iget-boolean v1, v0, LP/i;->g:Z

    .line 14
    .line 15
    if-eq v1, p1, :cond_1

    .line 16
    .line 17
    iget-object v1, v0, LP/i;->f:LP/h;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, LN/j;->a()LN/j;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, v0, LP/i;->f:LP/h;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const-string v3, "initCallback cannot be null"

    .line 31
    .line 32
    invoke-static {v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v3, v1, LN/j;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 42
    .line 43
    .line 44
    :try_start_0
    iget-object v1, v1, LN/j;->b:Lp/f;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lp/f;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p1

    .line 58
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :cond_0
    :goto_0
    iput-boolean p1, v0, LP/i;->g:Z

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, v0, LP/i;->e:Lm/n;

    .line 71
    .line 72
    invoke-static {}, LN/j;->a()LN/j;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, LN/j;->b()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {p1, v0}, LP/i;->a(Landroid/widget/EditText;I)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method
