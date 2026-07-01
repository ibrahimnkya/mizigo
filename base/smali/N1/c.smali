.class public final synthetic LN1/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:LN1/d;


# direct methods
.method public synthetic constructor <init>(LN1/d;I)V
    .locals 0

    .line 1
    iput p2, p0, LN1/c;->a:I

    iput-object p1, p0, LN1/c;->b:LN1/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, LN1/c;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LN1/c;->b:LN1/d;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, v0, LN1/d;->a:LD1/r;

    .line 10
    .line 11
    invoke-virtual {v1}, LD1/r;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, LN1/l;

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    iget-object v4, v0, LN1/d;->c:LP1/a;

    .line 22
    .line 23
    invoke-interface {v4}, LP1/a;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, LX1/b;

    .line 28
    .line 29
    invoke-virtual {v4}, LX1/b;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :try_start_1
    invoke-virtual {v1, v2, v3}, LN1/l;->b(J)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v4}, LV0/g;->D(Ljava/lang/String;)LM/d;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v5, v1, LN1/l;->a:LF1/h;

    .line 43
    .line 44
    new-instance v6, LN1/h;

    .line 45
    .line 46
    invoke-direct {v6, v1, v2, v4, v3}, LN1/h;-><init>(LN1/l;Ljava/lang/String;Ljava/lang/String;LM/d;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, v6}, LF1/h;->a(LH3/l;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50
    .line 51
    .line 52
    :try_start_2
    monitor-exit v1

    .line 53
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    const/4 v0, 0x0

    .line 55
    return-object v0

    .line 56
    :catchall_0
    move-exception v1

    .line 57
    goto :goto_0

    .line 58
    :catchall_1
    move-exception v2

    .line 59
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    :try_start_4
    throw v2

    .line 61
    :goto_0
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    throw v1

    .line 63
    :pswitch_0
    iget-object v0, p0, LN1/c;->b:LN1/d;

    .line 64
    .line 65
    monitor-enter v0

    .line 66
    :try_start_5
    iget-object v1, v0, LN1/d;->a:LD1/r;

    .line 67
    .line 68
    invoke-virtual {v1}, LD1/r;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, LN1/l;

    .line 73
    .line 74
    invoke-virtual {v1}, LN1/l;->a()Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    monitor-enter v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 79
    :try_start_6
    iget-object v3, v1, LN1/l;->a:LF1/h;

    .line 80
    .line 81
    new-instance v4, LN1/i;

    .line 82
    .line 83
    invoke-direct {v4, v1}, LN1/i;-><init>(LN1/l;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3, v4}, LF1/h;->a(LH3/l;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 87
    .line 88
    .line 89
    :try_start_7
    monitor-exit v1

    .line 90
    new-instance v1, Lorg/json/JSONArray;

    .line 91
    .line 92
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 93
    .line 94
    .line 95
    const/4 v3, 0x0

    .line 96
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-ge v3, v4, :cond_0

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, LN1/a;

    .line 107
    .line 108
    new-instance v5, Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v6, "agent"

    .line 114
    .line 115
    iget-object v7, v4, LN1/a;->a:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    const-string v6, "dates"

    .line 121
    .line 122
    new-instance v7, Lorg/json/JSONArray;

    .line 123
    .line 124
    iget-object v4, v4, LN1/a;->b:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {v7, v4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 133
    .line 134
    .line 135
    add-int/lit8 v3, v3, 0x1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :catchall_2
    move-exception v1

    .line 139
    goto :goto_5

    .line 140
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    .line 141
    .line 142
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v3, "heartbeats"

    .line 146
    .line 147
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 148
    .line 149
    .line 150
    const-string v1, "version"

    .line 151
    .line 152
    const-string v3, "2"

    .line 153
    .line 154
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 158
    .line 159
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 160
    .line 161
    .line 162
    new-instance v3, Landroid/util/Base64OutputStream;

    .line 163
    .line 164
    const/16 v4, 0xb

    .line 165
    .line 166
    invoke-direct {v3, v1, v4}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 167
    .line 168
    .line 169
    :try_start_8
    new-instance v4, Ljava/util/zip/GZIPOutputStream;

    .line 170
    .line 171
    invoke-direct {v4, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 172
    .line 173
    .line 174
    :try_start_9
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const-string v5, "UTF-8"

    .line 179
    .line 180
    invoke-virtual {v2, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v4, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 185
    .line 186
    .line 187
    :try_start_a
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 188
    .line 189
    .line 190
    :try_start_b
    invoke-virtual {v3}, Landroid/util/Base64OutputStream;->close()V

    .line 191
    .line 192
    .line 193
    const-string v2, "UTF-8"

    .line 194
    .line 195
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 200
    return-object v1

    .line 201
    :catchall_3
    move-exception v1

    .line 202
    goto :goto_3

    .line 203
    :catchall_4
    move-exception v1

    .line 204
    :try_start_c
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :catchall_5
    move-exception v2

    .line 209
    :try_start_d
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    :goto_2
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 213
    :goto_3
    :try_start_e
    invoke-virtual {v3}, Landroid/util/Base64OutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 214
    .line 215
    .line 216
    goto :goto_4

    .line 217
    :catchall_6
    move-exception v2

    .line 218
    :try_start_f
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 219
    .line 220
    .line 221
    :goto_4
    throw v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 222
    :catchall_7
    move-exception v2

    .line 223
    :try_start_10
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 224
    :try_start_11
    throw v2

    .line 225
    :goto_5
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 226
    throw v1

    .line 227
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
