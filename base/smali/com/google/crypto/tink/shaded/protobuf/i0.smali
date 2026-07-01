.class public final Lcom/google/crypto/tink/shaded/protobuf/i0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:J

.field public static c:Ljava/lang/reflect/Method;

.field public static d:Ljava/lang/reflect/Method;

.field public static e:Ljava/lang/reflect/Method;

.field public static f:Ld1/a;

.field public static g:LZ0/u;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/crypto/tink/shaded/protobuf/i0;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static A(Landroid/os/Parcel;I)Z
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static B(Landroid/os/Parcel;I)B
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-byte p0, p0

    .line 10
    return p0
.end method

.method public static C(Landroid/os/Parcel;I)F
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readFloat()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static D(Landroid/os/Parcel;I)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->V(Landroid/os/Parcel;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/os/Parcel;->readFloat()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static E(Landroid/os/Parcel;I)Landroid/os/IBinder;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static F(Landroid/os/Parcel;I)I
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static G(Landroid/os/Parcel;I)I
    .locals 2

    .line 1
    const/high16 v0, -0x10000

    .line 2
    .line 3
    and-int v1, p1, v0

    .line 4
    .line 5
    if-eq v1, v0, :cond_0

    .line 6
    .line 7
    shr-int/lit8 p0, p1, 0x10

    .line 8
    .line 9
    int-to-char p0, p0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static H(La3/c;)V
    .locals 3

    .line 1
    :try_start_0
    const-class v0, Lio/flutter/plugins/GeneratedPluginRegistrant;

    .line 2
    .line 3
    const-string v1, "registerWith"

    .line 4
    .line 5
    const-class v2, La3/c;

    .line 6
    .line 7
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception v0

    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Tried to automatically register plugins with FlutterEngine ("

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p0, ") but could not find or invoke the GeneratedPluginRegistrant."

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v1, "GeneratedPluginsRegister"

    .line 45
    .line 46
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const-string p0, "Received exception while registering"

    .line 50
    .line 51
    invoke-static {v1, p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static I(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object p1, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 22
    .line 23
    const-string v1, "androidx.core.view.inputmethod.EditorInfoCompat.CONTENT_SURROUNDING_TEXT"

    .line 24
    .line 25
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 29
    .line 30
    const-string v0, "androidx.core.view.inputmethod.EditorInfoCompat.CONTENT_SELECTION_HEAD"

    .line 31
    .line 32
    invoke-virtual {p1, v0, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 36
    .line 37
    const-string p1, "androidx.core.view.inputmethod.EditorInfoCompat.CONTENT_SELECTION_END"

    .line 38
    .line 39
    invoke-virtual {p0, p1, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static J(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr v0, p1

    .line 10
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static K(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/location/Address;

    .line 25
    .line 26
    new-instance v2, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v1, v3}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const/4 v5, 0x0

    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-eqz v6, :cond_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    new-instance v6, Ljava/util/StringTokenizer;

    .line 47
    .line 48
    const-string v7, ","

    .line 49
    .line 50
    invoke-direct {v6, v4, v7, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    :cond_1
    :goto_1
    const-string v3, "name"

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    const-string v3, "street"

    .line 73
    .line 74
    invoke-virtual {v2, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    const-string v3, "isoCountryCode"

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    const-string v3, "country"

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    const-string v3, "thoroughfare"

    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/location/Address;->getThoroughfare()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    const-string v3, "subThoroughfare"

    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    const-string v3, "postalCode"

    .line 114
    .line 115
    invoke-virtual {v1}, Landroid/location/Address;->getPostalCode()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    const-string v3, "administrativeArea"

    .line 123
    .line 124
    invoke-virtual {v1}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    const-string v3, "subAdministrativeArea"

    .line 132
    .line 133
    invoke-virtual {v1}, Landroid/location/Address;->getSubAdminArea()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    const-string v3, "locality"

    .line 141
    .line 142
    invoke-virtual {v1}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    const-string v3, "subLocality"

    .line 150
    .line 151
    invoke-virtual {v1}, Landroid/location/Address;->getSubLocality()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_2
    return-object v0
.end method

.method public static L([BJI)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x4

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    add-int v1, p3, v0

    .line 6
    .line 7
    const-wide/16 v2, 0xff

    .line 8
    .line 9
    and-long/2addr v2, p1

    .line 10
    long-to-int v2, v2

    .line 11
    int-to-byte v2, v2

    .line 12
    aput-byte v2, p0, v1

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    shr-long/2addr p1, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public static M(LV1/d;)[B
    .locals 10

    .line 1
    new-instance v0, Ljava/util/ArrayDeque;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x2

    .line 14
    mul-int/2addr v2, v3

    .line 15
    const/16 v4, 0x80

    .line 16
    .line 17
    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/16 v4, 0x2000

    .line 22
    .line 23
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    move v4, v1

    .line 28
    :goto_0
    const/4 v5, -0x1

    .line 29
    const v6, 0x7ffffff7

    .line 30
    .line 31
    .line 32
    if-ge v4, v6, :cond_5

    .line 33
    .line 34
    sub-int/2addr v6, v4

    .line 35
    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    new-array v7, v6, [B

    .line 40
    .line 41
    invoke-virtual {v0, v7}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move v8, v1

    .line 45
    :goto_1
    if-ge v8, v6, :cond_1

    .line 46
    .line 47
    sub-int v9, v6, v8

    .line 48
    .line 49
    invoke-virtual {p0, v7, v8, v9}, LV1/d;->read([BII)I

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    if-ne v9, v5, :cond_0

    .line 54
    .line 55
    invoke-static {v0, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->c(Ljava/util/ArrayDeque;I)[B

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_0
    add-int/2addr v8, v9

    .line 61
    add-int/2addr v4, v9

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    int-to-long v5, v2

    .line 64
    const/16 v7, 0x1000

    .line 65
    .line 66
    if-ge v2, v7, :cond_2

    .line 67
    .line 68
    const/4 v2, 0x4

    .line 69
    goto :goto_2

    .line 70
    :cond_2
    move v2, v3

    .line 71
    :goto_2
    int-to-long v7, v2

    .line 72
    mul-long/2addr v5, v7

    .line 73
    const-wide/32 v7, 0x7fffffff

    .line 74
    .line 75
    .line 76
    cmp-long v2, v5, v7

    .line 77
    .line 78
    if-lez v2, :cond_3

    .line 79
    .line 80
    const v2, 0x7fffffff

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const-wide/32 v7, -0x80000000

    .line 85
    .line 86
    .line 87
    cmp-long v2, v5, v7

    .line 88
    .line 89
    if-gez v2, :cond_4

    .line 90
    .line 91
    const/high16 v2, -0x80000000

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_4
    long-to-int v2, v5

    .line 95
    goto :goto_0

    .line 96
    :cond_5
    invoke-virtual {p0}, LV1/d;->read()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-ne p0, v5, :cond_6

    .line 101
    .line 102
    invoke-static {v0, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->c(Ljava/util/ArrayDeque;I)[B

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0

    .line 107
    :cond_6
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 108
    .line 109
    const-string v0, "input is too large to fit in a byte array"

    .line 110
    .line 111
    invoke-direct {p0, v0}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw p0
.end method

.method public static N(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x7f

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static O(J[BII)I
    .locals 2

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p4, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p4, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p2, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p0, v0

    .line 16
    invoke-static {p2, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p3, p4, p0}, Lcom/google/crypto/tink/shaded/protobuf/k0;->d(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    invoke-static {p2, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p3, p0}, Lcom/google/crypto/tink/shaded/protobuf/k0;->c(II)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    sget-object p0, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 41
    .line 42
    const/16 p0, -0xc

    .line 43
    .line 44
    if-le p3, p0, :cond_3

    .line 45
    .line 46
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_3
    return p3
.end method

.method public static P(Landroid/os/Parcel;)I
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-char v2, v0

    .line 10
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/16 v4, 0x4f45

    .line 15
    .line 16
    if-ne v2, v4, :cond_1

    .line 17
    .line 18
    add-int/2addr v1, v3

    .line 19
    if-lt v1, v3, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/os/Parcel;->dataSize()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-gt v1, v0, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    new-instance v0, LD1/n;

    .line 29
    .line 30
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    add-int/lit8 v2, v2, 0x20

    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    new-instance v5, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    add-int/2addr v2, v4

    .line 51
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 52
    .line 53
    .line 54
    const-string v2, "Size read is invalid start="

    .line 55
    .line 56
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v2, " end="

    .line 63
    .line 64
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-direct {v0, v1, p0}, LD1/n;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 75
    .line 76
    .line 77
    throw v0

    .line 78
    :cond_1
    new-instance v1, LD1/n;

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v2, "Expected object header. Got 0x"

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {v1, v0, p0}, LD1/n;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 95
    .line 96
    .line 97
    throw v1
.end method

.method public static final Q(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V
    .locals 3

    .line 1
    if-ltz p3, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt v0, p3, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lt v0, p3, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lt v0, p3, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-ge v0, p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    xor-int/2addr v1, v2

    .line 33
    int-to-byte v1, v1

    .line 34
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 42
    .line 43
    const-string p1, "That combination of buffers, offsets and length to xor result in out-of-bond accesses."

    .line 44
    .line 45
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw p0
.end method

.method public static final R([BI[BI)[B
    .locals 4

    .line 1
    if-ltz p3, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    sub-int/2addr v0, p3

    .line 5
    if-lt v0, p1, :cond_1

    .line 6
    .line 7
    array-length v0, p2

    .line 8
    sub-int/2addr v0, p3

    .line 9
    if-ltz v0, :cond_1

    .line 10
    .line 11
    new-array v0, p3, [B

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    if-ge v1, p3, :cond_0

    .line 15
    .line 16
    add-int v2, v1, p1

    .line 17
    .line 18
    aget-byte v2, p0, v2

    .line 19
    .line 20
    aget-byte v3, p2, v1

    .line 21
    .line 22
    xor-int/2addr v2, v3

    .line 23
    int-to-byte v2, v2

    .line 24
    aput-byte v2, v0, v1

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object v0

    .line 30
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 31
    .line 32
    const-string p1, "That combination of buffers, offsets and length to xor result in out-of-bond accesses."

    .line 33
    .line 34
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p0
.end method

.method public static final S([B[B)[B
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    array-length v1, p1

    .line 3
    if-ne v0, v1, :cond_0

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, v1, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->R([BI[BI)[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 13
    .line 14
    const-string p1, "The lengths of x and y should match."

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public static T(Landroid/os/Parcel;II)V
    .locals 5

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, LD1/n;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    add-int/lit8 v2, v2, 0x13

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    add-int/2addr v2, v3

    .line 37
    add-int/lit8 v2, v2, 0x4

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v3, v2

    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 49
    .line 50
    .line 51
    const-string v3, "Expected size "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p2, " got "

    .line 60
    .line 61
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p1, " (0x"

    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p1, ")"

    .line 76
    .line 77
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {v0, p1, p0}, LD1/n;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 85
    .line 86
    .line 87
    throw v0
.end method

.method public static U()Ld1/a;
    .locals 2

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/i0;->f:Ld1/a;

    .line 2
    .line 3
    const-string v1, "CameraUpdateFactory is not initialized"

    .line 4
    .line 5
    invoke-static {v0, v1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static V(Landroid/os/Parcel;I)V
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    new-instance v1, LD1/n;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    add-int/lit8 v3, v3, 0x13

    .line 24
    .line 25
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    add-int/2addr v3, v4

    .line 34
    add-int/2addr v3, v0

    .line 35
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr v0, v3

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 45
    .line 46
    .line 47
    const-string v0, "Expected size 4 got "

    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, " (0x"

    .line 56
    .line 57
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, ")"

    .line 64
    .line 65
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {v1, p1, p0}, LD1/n;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 73
    .line 74
    .line 75
    throw v1
.end method

.method public static a(Ljava/lang/String;F)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    const-string v0, " must not be infinite"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p1

    .line 26
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 27
    .line 28
    const-string v0, " must not be NaN"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p1
.end method

.method public static b(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    throw p0
.end method

.method public static c(Ljava/util/ArrayDeque;I)[B
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-array p0, v1, [B

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [B

    .line 16
    .line 17
    array-length v2, v0

    .line 18
    if-ne v2, p1, :cond_1

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    array-length v2, v0

    .line 22
    sub-int v2, p1, v2

    .line 23
    .line 24
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    if-lez v2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, [B

    .line 35
    .line 36
    array-length v4, v3

    .line 37
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    sub-int v5, p1, v2

    .line 42
    .line 43
    invoke-static {v3, v1, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    sub-int/2addr v2, v4

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-object v0
.end method

.method public static d([B[B)[B
    .locals 59

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    const/16 v3, 0x20

    .line 7
    .line 8
    if-ne v2, v3, :cond_2

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v2, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    const-wide/32 v6, 0x3ffffff

    .line 16
    .line 17
    .line 18
    and-long/2addr v4, v6

    .line 19
    const/4 v8, 0x3

    .line 20
    invoke-static {v8, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 21
    .line 22
    .line 23
    move-result-wide v9

    .line 24
    const/4 v11, 0x2

    .line 25
    shr-long/2addr v9, v11

    .line 26
    const-wide/32 v12, 0x3ffff03

    .line 27
    .line 28
    .line 29
    and-long/2addr v9, v12

    .line 30
    const/4 v12, 0x6

    .line 31
    invoke-static {v12, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 32
    .line 33
    .line 34
    move-result-wide v13

    .line 35
    const/4 v15, 0x4

    .line 36
    shr-long/2addr v13, v15

    .line 37
    const-wide/32 v16, 0x3ffc0ff

    .line 38
    .line 39
    .line 40
    and-long v13, v13, v16

    .line 41
    .line 42
    move/from16 v16, v3

    .line 43
    .line 44
    const/16 v3, 0x9

    .line 45
    .line 46
    invoke-static {v3, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 47
    .line 48
    .line 49
    move-result-wide v17

    .line 50
    shr-long v17, v17, v12

    .line 51
    .line 52
    const-wide/32 v19, 0x3f03fff

    .line 53
    .line 54
    .line 55
    and-long v17, v17, v19

    .line 56
    .line 57
    move-wide/from16 v19, v6

    .line 58
    .line 59
    const/16 v6, 0xc

    .line 60
    .line 61
    invoke-static {v6, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 62
    .line 63
    .line 64
    move-result-wide v21

    .line 65
    const/16 v7, 0x8

    .line 66
    .line 67
    shr-long v21, v21, v7

    .line 68
    .line 69
    const-wide/32 v23, 0xfffff

    .line 70
    .line 71
    .line 72
    and-long v21, v21, v23

    .line 73
    .line 74
    const-wide/16 v23, 0x5

    .line 75
    .line 76
    mul-long v25, v9, v23

    .line 77
    .line 78
    mul-long v27, v13, v23

    .line 79
    .line 80
    mul-long v29, v17, v23

    .line 81
    .line 82
    mul-long v31, v21, v23

    .line 83
    .line 84
    move/from16 v33, v11

    .line 85
    .line 86
    const/16 v11, 0x11

    .line 87
    .line 88
    move/from16 v34, v7

    .line 89
    .line 90
    new-array v7, v11, [B

    .line 91
    .line 92
    const-wide/16 v35, 0x0

    .line 93
    .line 94
    move/from16 v45, v15

    .line 95
    .line 96
    move-wide/from16 v37, v35

    .line 97
    .line 98
    move-wide/from16 v39, v37

    .line 99
    .line 100
    move-wide/from16 v41, v39

    .line 101
    .line 102
    move-wide/from16 v43, v41

    .line 103
    .line 104
    move v15, v2

    .line 105
    :goto_0
    array-length v6, v1

    .line 106
    const/16 v47, 0x18

    .line 107
    .line 108
    const/16 v3, 0x10

    .line 109
    .line 110
    const/16 v48, 0x1a

    .line 111
    .line 112
    if-ge v15, v6, :cond_1

    .line 113
    .line 114
    array-length v6, v1

    .line 115
    sub-int/2addr v6, v15

    .line 116
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    invoke-static {v1, v15, v7, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 121
    .line 122
    .line 123
    const/16 v49, 0x1

    .line 124
    .line 125
    aput-byte v49, v7, v6

    .line 126
    .line 127
    if-eq v6, v3, :cond_0

    .line 128
    .line 129
    add-int/lit8 v6, v6, 0x1

    .line 130
    .line 131
    invoke-static {v7, v6, v11, v2}, Ljava/util/Arrays;->fill([BIIB)V

    .line 132
    .line 133
    .line 134
    :cond_0
    invoke-static {v2, v7}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 135
    .line 136
    .line 137
    move-result-wide v49

    .line 138
    and-long v49, v49, v19

    .line 139
    .line 140
    add-long v43, v43, v49

    .line 141
    .line 142
    invoke-static {v8, v7}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 143
    .line 144
    .line 145
    move-result-wide v49

    .line 146
    shr-long v49, v49, v33

    .line 147
    .line 148
    and-long v49, v49, v19

    .line 149
    .line 150
    add-long v35, v35, v49

    .line 151
    .line 152
    invoke-static {v12, v7}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 153
    .line 154
    .line 155
    move-result-wide v49

    .line 156
    shr-long v49, v49, v45

    .line 157
    .line 158
    and-long v49, v49, v19

    .line 159
    .line 160
    add-long v37, v37, v49

    .line 161
    .line 162
    const/16 v6, 0x9

    .line 163
    .line 164
    invoke-static {v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 165
    .line 166
    .line 167
    move-result-wide v49

    .line 168
    shr-long v49, v49, v12

    .line 169
    .line 170
    and-long v49, v49, v19

    .line 171
    .line 172
    add-long v39, v39, v49

    .line 173
    .line 174
    const/16 v6, 0xc

    .line 175
    .line 176
    invoke-static {v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 177
    .line 178
    .line 179
    move-result-wide v49

    .line 180
    shr-long v49, v49, v34

    .line 181
    .line 182
    and-long v49, v49, v19

    .line 183
    .line 184
    aget-byte v3, v7, v3

    .line 185
    .line 186
    shl-int/lit8 v3, v3, 0x18

    .line 187
    .line 188
    move-wide/from16 v51, v9

    .line 189
    .line 190
    int-to-long v8, v3

    .line 191
    or-long v8, v49, v8

    .line 192
    .line 193
    add-long v41, v41, v8

    .line 194
    .line 195
    mul-long v8, v43, v4

    .line 196
    .line 197
    mul-long v49, v35, v31

    .line 198
    .line 199
    add-long v49, v49, v8

    .line 200
    .line 201
    mul-long v8, v37, v29

    .line 202
    .line 203
    add-long v8, v8, v49

    .line 204
    .line 205
    mul-long v49, v39, v27

    .line 206
    .line 207
    add-long v49, v49, v8

    .line 208
    .line 209
    mul-long v8, v41, v25

    .line 210
    .line 211
    add-long v8, v8, v49

    .line 212
    .line 213
    mul-long v49, v43, v51

    .line 214
    .line 215
    mul-long v53, v35, v4

    .line 216
    .line 217
    add-long v53, v53, v49

    .line 218
    .line 219
    mul-long v49, v37, v31

    .line 220
    .line 221
    add-long v49, v49, v53

    .line 222
    .line 223
    mul-long v53, v39, v29

    .line 224
    .line 225
    add-long v53, v53, v49

    .line 226
    .line 227
    mul-long v49, v41, v27

    .line 228
    .line 229
    add-long v49, v49, v53

    .line 230
    .line 231
    mul-long v53, v43, v13

    .line 232
    .line 233
    mul-long v55, v35, v51

    .line 234
    .line 235
    add-long v55, v55, v53

    .line 236
    .line 237
    mul-long v53, v37, v4

    .line 238
    .line 239
    add-long v53, v53, v55

    .line 240
    .line 241
    mul-long v55, v39, v31

    .line 242
    .line 243
    add-long v55, v55, v53

    .line 244
    .line 245
    mul-long v53, v41, v29

    .line 246
    .line 247
    add-long v53, v53, v55

    .line 248
    .line 249
    mul-long v55, v43, v17

    .line 250
    .line 251
    mul-long v57, v35, v13

    .line 252
    .line 253
    add-long v57, v57, v55

    .line 254
    .line 255
    mul-long v55, v37, v51

    .line 256
    .line 257
    add-long v55, v55, v57

    .line 258
    .line 259
    mul-long v57, v39, v4

    .line 260
    .line 261
    add-long v57, v57, v55

    .line 262
    .line 263
    mul-long v55, v41, v31

    .line 264
    .line 265
    add-long v55, v55, v57

    .line 266
    .line 267
    mul-long v43, v43, v21

    .line 268
    .line 269
    mul-long v35, v35, v17

    .line 270
    .line 271
    add-long v35, v35, v43

    .line 272
    .line 273
    mul-long v37, v37, v13

    .line 274
    .line 275
    add-long v37, v37, v35

    .line 276
    .line 277
    mul-long v39, v39, v51

    .line 278
    .line 279
    add-long v39, v39, v37

    .line 280
    .line 281
    mul-long v41, v41, v4

    .line 282
    .line 283
    add-long v41, v41, v39

    .line 284
    .line 285
    shr-long v35, v8, v48

    .line 286
    .line 287
    and-long v8, v8, v19

    .line 288
    .line 289
    add-long v49, v49, v35

    .line 290
    .line 291
    shr-long v35, v49, v48

    .line 292
    .line 293
    and-long v37, v49, v19

    .line 294
    .line 295
    add-long v53, v53, v35

    .line 296
    .line 297
    shr-long v35, v53, v48

    .line 298
    .line 299
    and-long v39, v53, v19

    .line 300
    .line 301
    add-long v55, v55, v35

    .line 302
    .line 303
    shr-long v35, v55, v48

    .line 304
    .line 305
    and-long v43, v55, v19

    .line 306
    .line 307
    add-long v41, v41, v35

    .line 308
    .line 309
    shr-long v35, v41, v48

    .line 310
    .line 311
    and-long v41, v41, v19

    .line 312
    .line 313
    mul-long v35, v35, v23

    .line 314
    .line 315
    add-long v35, v35, v8

    .line 316
    .line 317
    shr-long v8, v35, v48

    .line 318
    .line 319
    and-long v35, v35, v19

    .line 320
    .line 321
    add-long v8, v37, v8

    .line 322
    .line 323
    add-int/lit8 v15, v15, 0x10

    .line 324
    .line 325
    move-wide/from16 v37, v39

    .line 326
    .line 327
    move-wide/from16 v39, v43

    .line 328
    .line 329
    const/16 v3, 0x9

    .line 330
    .line 331
    move-wide/from16 v43, v35

    .line 332
    .line 333
    move-wide/from16 v35, v8

    .line 334
    .line 335
    move-wide/from16 v9, v51

    .line 336
    .line 337
    const/4 v8, 0x3

    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :cond_1
    shr-long v4, v35, v48

    .line 341
    .line 342
    and-long v6, v35, v19

    .line 343
    .line 344
    add-long v37, v37, v4

    .line 345
    .line 346
    shr-long v4, v37, v48

    .line 347
    .line 348
    and-long v8, v37, v19

    .line 349
    .line 350
    add-long v39, v39, v4

    .line 351
    .line 352
    shr-long v4, v39, v48

    .line 353
    .line 354
    and-long v10, v39, v19

    .line 355
    .line 356
    add-long v41, v41, v4

    .line 357
    .line 358
    shr-long v4, v41, v48

    .line 359
    .line 360
    and-long v13, v41, v19

    .line 361
    .line 362
    mul-long v4, v4, v23

    .line 363
    .line 364
    add-long v4, v4, v43

    .line 365
    .line 366
    shr-long v17, v4, v48

    .line 367
    .line 368
    and-long v4, v4, v19

    .line 369
    .line 370
    add-long v6, v6, v17

    .line 371
    .line 372
    add-long v23, v4, v23

    .line 373
    .line 374
    shr-long v17, v23, v48

    .line 375
    .line 376
    and-long v21, v23, v19

    .line 377
    .line 378
    add-long v17, v6, v17

    .line 379
    .line 380
    shr-long v23, v17, v48

    .line 381
    .line 382
    and-long v17, v17, v19

    .line 383
    .line 384
    add-long v23, v8, v23

    .line 385
    .line 386
    shr-long v25, v23, v48

    .line 387
    .line 388
    and-long v23, v23, v19

    .line 389
    .line 390
    add-long v25, v10, v25

    .line 391
    .line 392
    shr-long v27, v25, v48

    .line 393
    .line 394
    and-long v19, v25, v19

    .line 395
    .line 396
    add-long v27, v13, v27

    .line 397
    .line 398
    const-wide/32 v25, 0x4000000

    .line 399
    .line 400
    .line 401
    sub-long v27, v27, v25

    .line 402
    .line 403
    const/16 v1, 0x3f

    .line 404
    .line 405
    move v15, v12

    .line 406
    move-wide/from16 v25, v13

    .line 407
    .line 408
    shr-long v12, v27, v1

    .line 409
    .line 410
    and-long/2addr v4, v12

    .line 411
    and-long/2addr v6, v12

    .line 412
    and-long/2addr v8, v12

    .line 413
    and-long/2addr v10, v12

    .line 414
    and-long v25, v25, v12

    .line 415
    .line 416
    not-long v12, v12

    .line 417
    and-long v21, v21, v12

    .line 418
    .line 419
    or-long v4, v4, v21

    .line 420
    .line 421
    and-long v17, v17, v12

    .line 422
    .line 423
    or-long v6, v6, v17

    .line 424
    .line 425
    and-long v17, v23, v12

    .line 426
    .line 427
    or-long v8, v8, v17

    .line 428
    .line 429
    and-long v17, v19, v12

    .line 430
    .line 431
    or-long v10, v10, v17

    .line 432
    .line 433
    and-long v12, v27, v12

    .line 434
    .line 435
    or-long v12, v25, v12

    .line 436
    .line 437
    shl-long v17, v6, v48

    .line 438
    .line 439
    or-long v4, v4, v17

    .line 440
    .line 441
    const-wide v17, 0xffffffffL

    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    and-long v4, v4, v17

    .line 447
    .line 448
    shr-long/2addr v6, v15

    .line 449
    const/16 v1, 0x14

    .line 450
    .line 451
    shl-long v14, v8, v1

    .line 452
    .line 453
    or-long/2addr v6, v14

    .line 454
    and-long v6, v6, v17

    .line 455
    .line 456
    const/16 v46, 0xc

    .line 457
    .line 458
    shr-long v8, v8, v46

    .line 459
    .line 460
    const/16 v14, 0xe

    .line 461
    .line 462
    shl-long v14, v10, v14

    .line 463
    .line 464
    or-long/2addr v8, v14

    .line 465
    and-long v8, v8, v17

    .line 466
    .line 467
    const/16 v14, 0x12

    .line 468
    .line 469
    shr-long/2addr v10, v14

    .line 470
    shl-long v12, v12, v34

    .line 471
    .line 472
    or-long/2addr v10, v12

    .line 473
    and-long v10, v10, v17

    .line 474
    .line 475
    invoke-static {v3, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 476
    .line 477
    .line 478
    move-result-wide v12

    .line 479
    add-long/2addr v12, v4

    .line 480
    and-long v4, v12, v17

    .line 481
    .line 482
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 483
    .line 484
    .line 485
    move-result-wide v14

    .line 486
    add-long/2addr v14, v6

    .line 487
    shr-long v6, v12, v16

    .line 488
    .line 489
    add-long/2addr v14, v6

    .line 490
    and-long v6, v14, v17

    .line 491
    .line 492
    move/from16 v1, v47

    .line 493
    .line 494
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 495
    .line 496
    .line 497
    move-result-wide v12

    .line 498
    add-long/2addr v12, v8

    .line 499
    shr-long v8, v14, v16

    .line 500
    .line 501
    add-long/2addr v12, v8

    .line 502
    and-long v8, v12, v17

    .line 503
    .line 504
    const/16 v1, 0x1c

    .line 505
    .line 506
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->x(I[B)J

    .line 507
    .line 508
    .line 509
    move-result-wide v0

    .line 510
    add-long/2addr v0, v10

    .line 511
    shr-long v10, v12, v16

    .line 512
    .line 513
    add-long/2addr v0, v10

    .line 514
    and-long v0, v0, v17

    .line 515
    .line 516
    new-array v3, v3, [B

    .line 517
    .line 518
    invoke-static {v3, v4, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->L([BJI)V

    .line 519
    .line 520
    .line 521
    move/from16 v2, v45

    .line 522
    .line 523
    invoke-static {v3, v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->L([BJI)V

    .line 524
    .line 525
    .line 526
    move/from16 v2, v34

    .line 527
    .line 528
    invoke-static {v3, v8, v9, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->L([BJI)V

    .line 529
    .line 530
    .line 531
    const/16 v6, 0xc

    .line 532
    .line 533
    invoke-static {v3, v0, v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->L([BJI)V

    .line 534
    .line 535
    .line 536
    return-object v3

    .line 537
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 538
    .line 539
    const-string v1, "The key length in bytes must be 32."

    .line 540
    .line 541
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    throw v0
.end method

.method public static varargs e([[B)[B
    .locals 7

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    if-ge v2, v0, :cond_1

    .line 6
    .line 7
    aget-object v4, p0, v2

    .line 8
    .line 9
    const v5, 0x7fffffff

    .line 10
    .line 11
    .line 12
    array-length v6, v4

    .line 13
    sub-int/2addr v5, v6

    .line 14
    if-gt v3, v5, :cond_0

    .line 15
    .line 16
    array-length v4, v4

    .line 17
    add-int/2addr v3, v4

    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 22
    .line 23
    const-string v0, "exceeded size limit"

    .line 24
    .line 25
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :cond_1
    new-array v0, v3, [B

    .line 30
    .line 31
    array-length v2, p0

    .line 32
    move v3, v1

    .line 33
    move v4, v3

    .line 34
    :goto_1
    if-ge v3, v2, :cond_2

    .line 35
    .line 36
    aget-object v5, p0, v3

    .line 37
    .line 38
    array-length v6, v5

    .line 39
    invoke-static {v5, v1, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    array-length v5, v5

    .line 43
    add-int/2addr v4, v5

    .line 44
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    return-object v0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;)LD1/c;
    .locals 9

    .line 1
    new-instance v0, LX1/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LX1/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v8, Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 19
    .line 20
    .line 21
    const-class v1, LX1/a;

    .line 22
    .line 23
    invoke-static {v1}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v7, LD1/a;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {v7, v1, v0}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, LD1/c;

    .line 37
    .line 38
    new-instance v3, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-direct {v3, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 41
    .line 42
    .line 43
    new-instance v4, Ljava/util/HashSet;

    .line 44
    .line 45
    invoke-direct {v4, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 46
    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    const/4 v5, 0x0

    .line 50
    const/4 v6, 0x1

    .line 51
    invoke-direct/range {v1 .. v8}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 52
    .line 53
    .line 54
    return-object v1
.end method

.method public static g(Landroid/os/Parcel;I)Landroid/os/Bundle;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-interface {p2, p0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Landroid/os/Parcelable;

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 21
    .line 22
    .line 23
    return-object p2
.end method

.method public static i(Landroid/os/Parcel;I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method public static k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method public static l([B)[B
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    if-ne v0, v1, :cond_2

    .line 5
    .line 6
    new-array v0, v1, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    move v3, v2

    .line 10
    :goto_0
    const/16 v4, 0xf

    .line 11
    .line 12
    if-ge v3, v1, :cond_1

    .line 13
    .line 14
    aget-byte v5, p0, v3

    .line 15
    .line 16
    shl-int/lit8 v5, v5, 0x1

    .line 17
    .line 18
    and-int/lit16 v5, v5, 0xfe

    .line 19
    .line 20
    int-to-byte v5, v5

    .line 21
    aput-byte v5, v0, v3

    .line 22
    .line 23
    if-ge v3, v4, :cond_0

    .line 24
    .line 25
    add-int/lit8 v4, v3, 0x1

    .line 26
    .line 27
    aget-byte v4, p0, v4

    .line 28
    .line 29
    shr-int/lit8 v4, v4, 0x7

    .line 30
    .line 31
    and-int/lit8 v4, v4, 0x1

    .line 32
    .line 33
    int-to-byte v4, v4

    .line 34
    or-int/2addr v4, v5

    .line 35
    int-to-byte v4, v4

    .line 36
    aput-byte v4, v0, v3

    .line 37
    .line 38
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    aget-byte v1, v0, v4

    .line 42
    .line 43
    aget-byte p0, p0, v2

    .line 44
    .line 45
    shr-int/lit8 p0, p0, 0x7

    .line 46
    .line 47
    and-int/lit16 p0, p0, 0x87

    .line 48
    .line 49
    int-to-byte p0, p0

    .line 50
    xor-int/2addr p0, v1

    .line 51
    int-to-byte p0, p0

    .line 52
    aput-byte p0, v0, v4

    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 56
    .line 57
    const-string v0, "value must be a block."

    .line 58
    .line 59
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0
.end method

.method public static final n(LI/i;LH3/p;LC3/g;)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, LM/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, LM/h;-><init>(LH3/p;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-interface {p0, v0, p2}, LI/i;->e(LH3/p;LC3/g;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static p(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, LD1/n;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1a

    .line 21
    .line 22
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 23
    .line 24
    .line 25
    const-string v1, "Overread allowed size end="

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {v0, p1, p0}, LD1/n;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 38
    .line 39
    .line 40
    throw v0
.end method

.method public static q(Ljava/lang/String;)Le1/c;
    .locals 3

    .line 1
    const-string v0, "assetName must not be null"

    .line 2
    .line 3
    invoke-static {p0, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Le1/c;

    .line 7
    .line 8
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/i0;->g:LZ0/u;

    .line 9
    .line 10
    const-string v2, "IBitmapDescriptorFactory is not initialized"

    .line 11
    .line 12
    invoke-static {v1, v2}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast v1, LZ0/s;

    .line 16
    .line 17
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x2

    .line 25
    invoke-virtual {v1, v2, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 38
    .line 39
    .line 40
    invoke-direct {v0, v1}, Le1/c;-><init>(LU0/a;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    new-instance v0, Le1/x;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public static r(Landroid/graphics/Bitmap;)Le1/c;
    .locals 3

    .line 1
    const-string v0, "image must not be null"

    .line 2
    .line 3
    invoke-static {p0, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Le1/c;

    .line 7
    .line 8
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/i0;->g:LZ0/u;

    .line 9
    .line 10
    const-string v2, "IBitmapDescriptorFactory is not initialized"

    .line 11
    .line 12
    invoke-static {v1, v2}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast v1, LZ0/s;

    .line 16
    .line 17
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2, p0}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x6

    .line 25
    invoke-virtual {v1, v2, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 38
    .line 39
    .line 40
    invoke-direct {v0, v1}, Le1/c;-><init>(LU0/a;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    new-instance v0, Le1/x;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public static s(Ljava/lang/String;LA1/h;)LD1/c;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Class;

    .line 3
    .line 4
    new-instance v1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v2, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v10, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    const-class v3, LX1/a;

    .line 20
    .line 21
    invoke-static {v3}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    array-length v3, v0

    .line 29
    const/4 v7, 0x0

    .line 30
    move v4, v7

    .line 31
    :goto_0
    if-ge v4, v3, :cond_0

    .line 32
    .line 33
    aget-object v5, v0, v4

    .line 34
    .line 35
    const-string v6, "Null interface"

    .line 36
    .line 37
    invoke-static {v5, v6}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v5}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-class v0, Landroid/content/Context;

    .line 51
    .line 52
    invoke-static {v0}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v3, v0, LD1/l;->a:LD1/v;

    .line 57
    .line 58
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_1

    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v9, LE0/j;

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-direct {v9, v0, p0, p1}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    new-instance v3, LD1/c;

    .line 74
    .line 75
    new-instance v5, Ljava/util/HashSet;

    .line 76
    .line 77
    invoke-direct {v5, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 78
    .line 79
    .line 80
    new-instance v6, Ljava/util/HashSet;

    .line 81
    .line 82
    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 83
    .line 84
    .line 85
    const/4 v4, 0x0

    .line 86
    const/4 v8, 0x1

    .line 87
    invoke-direct/range {v3 .. v10}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 88
    .line 89
    .line 90
    return-object v3

    .line 91
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 92
    .line 93
    const-string p1, "Components are not allowed to depend on interfaces they themselves provide."

    .line 94
    .line 95
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    throw p0
.end method

.method public static t(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, p0, v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    .line 5
    .line 6
    .line 7
    const/16 p0, 0x100

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setKeySize(I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "GCM"

    .line 14
    .line 15
    filled-new-array {v0}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setBlockModes([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "NoPadding"

    .line 24
    .line 25
    filled-new-array {v0}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "AES"

    .line 38
    .line 39
    const-string v1, "AndroidKeyStore"

    .line 40
    .line 41
    invoke-static {v0, v1}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p0}, Ljavax/crypto/KeyGenerator;->init(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static final u(LK3/b;)Ljava/lang/Class;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p0, LI3/d;

    .line 7
    .line 8
    invoke-interface {p0}, LI3/d;->a()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sparse-switch v1, :sswitch_data_0

    .line 29
    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :sswitch_0
    const-string v1, "short"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-class p0, Ljava/lang/Short;

    .line 43
    .line 44
    return-object p0

    .line 45
    :sswitch_1
    const-string v1, "float"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const-class p0, Ljava/lang/Float;

    .line 55
    .line 56
    return-object p0

    .line 57
    :sswitch_2
    const-string v1, "boolean"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    const-class p0, Ljava/lang/Boolean;

    .line 67
    .line 68
    return-object p0

    .line 69
    :sswitch_3
    const-string v1, "void"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_4

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    const-class p0, Ljava/lang/Void;

    .line 79
    .line 80
    return-object p0

    .line 81
    :sswitch_4
    const-string v1, "long"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    const-class p0, Ljava/lang/Long;

    .line 91
    .line 92
    return-object p0

    .line 93
    :sswitch_5
    const-string v1, "char"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    const-class p0, Ljava/lang/Character;

    .line 103
    .line 104
    return-object p0

    .line 105
    :sswitch_6
    const-string v1, "byte"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_7

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    const-class p0, Ljava/lang/Byte;

    .line 115
    .line 116
    return-object p0

    .line 117
    :sswitch_7
    const-string v1, "int"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_8

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_8
    const-class p0, Ljava/lang/Integer;

    .line 127
    .line 128
    return-object p0

    .line 129
    :sswitch_8
    const-string v1, "double"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_9

    .line 136
    .line 137
    :goto_0
    return-object p0

    .line 138
    :cond_9
    const-class p0, Ljava/lang/Double;

    .line 139
    .line 140
    return-object p0

    .line 141
    :sswitch_data_0
    .sparse-switch
        -0x4f08842f -> :sswitch_8
        0x197ef -> :sswitch_7
        0x2e6108 -> :sswitch_6
        0x2e9356 -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x375194 -> :sswitch_3
        0x3db6c28 -> :sswitch_2
        0x5d0225c -> :sswitch_1
        0x685847c -> :sswitch_0
    .end sparse-switch
.end method

.method public static v(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, LE/f;->a(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-class p1, Landroid/graphics/drawable/Icon;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    instance-of v0, p1, Ljava/lang/reflect/InvocationTargetException;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of p1, p0, Ljava/lang/RuntimeException;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast p0, Ljava/lang/RuntimeException;

    .line 14
    .line 15
    throw p0

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    throw p1

    .line 22
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "Unable to call "

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, " via reflection"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "Trace"

    .line 42
    .line 43
    invoke-static {v0, p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static x(I[B)J
    .locals 2

    .line 1
    aget-byte v0, p1, p0

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    add-int/lit8 v1, p0, 0x1

    .line 6
    .line 7
    aget-byte v1, p1, v1

    .line 8
    .line 9
    and-int/lit16 v1, v1, 0xff

    .line 10
    .line 11
    shl-int/lit8 v1, v1, 0x8

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    add-int/lit8 v1, p0, 0x2

    .line 15
    .line 16
    aget-byte v1, p1, v1

    .line 17
    .line 18
    and-int/lit16 v1, v1, 0xff

    .line 19
    .line 20
    shl-int/lit8 v1, v1, 0x10

    .line 21
    .line 22
    or-int/2addr v0, v1

    .line 23
    add-int/lit8 p0, p0, 0x3

    .line 24
    .line 25
    aget-byte p0, p1, p0

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    shl-int/lit8 p0, p0, 0x18

    .line 30
    .line 31
    or-int/2addr p0, v0

    .line 32
    int-to-long p0, p0

    .line 33
    const-wide v0, 0xffffffffL

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    and-long/2addr p0, v0

    .line 39
    return-wide p0
.end method

.method public static y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    if-ltz v0, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-gt v0, v1, :cond_2

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v2, v1

    .line 26
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-le v2, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 65
    .line 66
    const-string p1, "Invalid input received"

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0
.end method


# virtual methods
.method public final m([BII)Ljava/lang/String;
    .locals 10

    .line 1
    iget v0, p0, Lcom/google/crypto/tink/shaded/protobuf/i0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/String;

    .line 7
    .line 8
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2, p3, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 11
    .line 12
    .line 13
    const v2, 0xfffd

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-gez v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    add-int/2addr p3, p2

    .line 28
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {v1, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    :goto_0
    return-object v0

    .line 39
    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    throw p1

    .line 44
    :pswitch_0
    or-int v0, p2, p3

    .line 45
    .line 46
    array-length v1, p1

    .line 47
    sub-int/2addr v1, p2

    .line 48
    sub-int/2addr v1, p3

    .line 49
    or-int/2addr v0, v1

    .line 50
    if-ltz v0, :cond_10

    .line 51
    .line 52
    add-int v0, p2, p3

    .line 53
    .line 54
    new-array p3, p3, [C

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    move v2, v1

    .line 58
    :goto_1
    if-ge p2, v0, :cond_2

    .line 59
    .line 60
    aget-byte v3, p1, p2

    .line 61
    .line 62
    if-ltz v3, :cond_2

    .line 63
    .line 64
    add-int/lit8 p2, p2, 0x1

    .line 65
    .line 66
    add-int/lit8 v4, v2, 0x1

    .line 67
    .line 68
    int-to-char v3, v3

    .line 69
    aput-char v3, p3, v2

    .line 70
    .line 71
    move v2, v4

    .line 72
    goto :goto_1

    .line 73
    :cond_2
    :goto_2
    if-ge p2, v0, :cond_f

    .line 74
    .line 75
    add-int/lit8 v3, p2, 0x1

    .line 76
    .line 77
    aget-byte v4, p1, p2

    .line 78
    .line 79
    if-ltz v4, :cond_4

    .line 80
    .line 81
    add-int/lit8 p2, v2, 0x1

    .line 82
    .line 83
    int-to-char v4, v4

    .line 84
    aput-char v4, p3, v2

    .line 85
    .line 86
    :goto_3
    if-ge v3, v0, :cond_3

    .line 87
    .line 88
    aget-byte v2, p1, v3

    .line 89
    .line 90
    if-ltz v2, :cond_3

    .line 91
    .line 92
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    add-int/lit8 v4, p2, 0x1

    .line 95
    .line 96
    int-to-char v2, v2

    .line 97
    aput-char v2, p3, p2

    .line 98
    .line 99
    move p2, v4

    .line 100
    goto :goto_3

    .line 101
    :cond_3
    move v2, p2

    .line 102
    move p2, v3

    .line 103
    goto :goto_2

    .line 104
    :cond_4
    const/16 v5, -0x20

    .line 105
    .line 106
    if-ge v4, v5, :cond_7

    .line 107
    .line 108
    if-ge v3, v0, :cond_6

    .line 109
    .line 110
    add-int/lit8 p2, p2, 0x2

    .line 111
    .line 112
    aget-byte v3, p1, v3

    .line 113
    .line 114
    add-int/lit8 v5, v2, 0x1

    .line 115
    .line 116
    const/16 v6, -0x3e

    .line 117
    .line 118
    if-lt v4, v6, :cond_5

    .line 119
    .line 120
    invoke-static {v3}, LV0/g;->u(B)Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    if-nez v6, :cond_5

    .line 125
    .line 126
    and-int/lit8 v4, v4, 0x1f

    .line 127
    .line 128
    shl-int/lit8 v4, v4, 0x6

    .line 129
    .line 130
    and-int/lit8 v3, v3, 0x3f

    .line 131
    .line 132
    or-int/2addr v3, v4

    .line 133
    int-to-char v3, v3

    .line 134
    aput-char v3, p3, v2

    .line 135
    .line 136
    move v2, v5

    .line 137
    goto :goto_2

    .line 138
    :cond_5
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    throw p1

    .line 143
    :cond_6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    throw p1

    .line 148
    :cond_7
    const/16 v6, -0x10

    .line 149
    .line 150
    if-ge v4, v6, :cond_c

    .line 151
    .line 152
    add-int/lit8 v6, v0, -0x1

    .line 153
    .line 154
    if-ge v3, v6, :cond_b

    .line 155
    .line 156
    add-int/lit8 v6, p2, 0x2

    .line 157
    .line 158
    aget-byte v3, p1, v3

    .line 159
    .line 160
    add-int/lit8 p2, p2, 0x3

    .line 161
    .line 162
    aget-byte v6, p1, v6

    .line 163
    .line 164
    add-int/lit8 v7, v2, 0x1

    .line 165
    .line 166
    invoke-static {v3}, LV0/g;->u(B)Z

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    if-nez v8, :cond_a

    .line 171
    .line 172
    const/16 v8, -0x60

    .line 173
    .line 174
    if-ne v4, v5, :cond_8

    .line 175
    .line 176
    if-lt v3, v8, :cond_a

    .line 177
    .line 178
    :cond_8
    const/16 v5, -0x13

    .line 179
    .line 180
    if-ne v4, v5, :cond_9

    .line 181
    .line 182
    if-ge v3, v8, :cond_a

    .line 183
    .line 184
    :cond_9
    invoke-static {v6}, LV0/g;->u(B)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-nez v5, :cond_a

    .line 189
    .line 190
    and-int/lit8 v4, v4, 0xf

    .line 191
    .line 192
    shl-int/lit8 v4, v4, 0xc

    .line 193
    .line 194
    and-int/lit8 v3, v3, 0x3f

    .line 195
    .line 196
    shl-int/lit8 v3, v3, 0x6

    .line 197
    .line 198
    or-int/2addr v3, v4

    .line 199
    and-int/lit8 v4, v6, 0x3f

    .line 200
    .line 201
    or-int/2addr v3, v4

    .line 202
    int-to-char v3, v3

    .line 203
    aput-char v3, p3, v2

    .line 204
    .line 205
    move v2, v7

    .line 206
    goto/16 :goto_2

    .line 207
    .line 208
    :cond_a
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    throw p1

    .line 213
    :cond_b
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    throw p1

    .line 218
    :cond_c
    add-int/lit8 v5, v0, -0x2

    .line 219
    .line 220
    if-ge v3, v5, :cond_e

    .line 221
    .line 222
    add-int/lit8 v5, p2, 0x2

    .line 223
    .line 224
    aget-byte v3, p1, v3

    .line 225
    .line 226
    add-int/lit8 v6, p2, 0x3

    .line 227
    .line 228
    aget-byte v5, p1, v5

    .line 229
    .line 230
    add-int/lit8 p2, p2, 0x4

    .line 231
    .line 232
    aget-byte v6, p1, v6

    .line 233
    .line 234
    add-int/lit8 v7, v2, 0x1

    .line 235
    .line 236
    invoke-static {v3}, LV0/g;->u(B)Z

    .line 237
    .line 238
    .line 239
    move-result v8

    .line 240
    if-nez v8, :cond_d

    .line 241
    .line 242
    shl-int/lit8 v8, v4, 0x1c

    .line 243
    .line 244
    add-int/lit8 v9, v3, 0x70

    .line 245
    .line 246
    add-int/2addr v9, v8

    .line 247
    shr-int/lit8 v8, v9, 0x1e

    .line 248
    .line 249
    if-nez v8, :cond_d

    .line 250
    .line 251
    invoke-static {v5}, LV0/g;->u(B)Z

    .line 252
    .line 253
    .line 254
    move-result v8

    .line 255
    if-nez v8, :cond_d

    .line 256
    .line 257
    invoke-static {v6}, LV0/g;->u(B)Z

    .line 258
    .line 259
    .line 260
    move-result v8

    .line 261
    if-nez v8, :cond_d

    .line 262
    .line 263
    and-int/lit8 v4, v4, 0x7

    .line 264
    .line 265
    shl-int/lit8 v4, v4, 0x12

    .line 266
    .line 267
    and-int/lit8 v3, v3, 0x3f

    .line 268
    .line 269
    shl-int/lit8 v3, v3, 0xc

    .line 270
    .line 271
    or-int/2addr v3, v4

    .line 272
    and-int/lit8 v4, v5, 0x3f

    .line 273
    .line 274
    shl-int/lit8 v4, v4, 0x6

    .line 275
    .line 276
    or-int/2addr v3, v4

    .line 277
    and-int/lit8 v4, v6, 0x3f

    .line 278
    .line 279
    or-int/2addr v3, v4

    .line 280
    ushr-int/lit8 v4, v3, 0xa

    .line 281
    .line 282
    const v5, 0xd7c0

    .line 283
    .line 284
    .line 285
    add-int/2addr v4, v5

    .line 286
    int-to-char v4, v4

    .line 287
    aput-char v4, p3, v2

    .line 288
    .line 289
    and-int/lit16 v3, v3, 0x3ff

    .line 290
    .line 291
    const v4, 0xdc00

    .line 292
    .line 293
    .line 294
    add-int/2addr v3, v4

    .line 295
    int-to-char v3, v3

    .line 296
    aput-char v3, p3, v7

    .line 297
    .line 298
    add-int/lit8 v2, v2, 0x2

    .line 299
    .line 300
    goto/16 :goto_2

    .line 301
    .line 302
    :cond_d
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    throw p1

    .line 307
    :cond_e
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    throw p1

    .line 312
    :cond_f
    new-instance p1, Ljava/lang/String;

    .line 313
    .line 314
    invoke-direct {p1, p3, v1, v2}, Ljava/lang/String;-><init>([CII)V

    .line 315
    .line 316
    .line 317
    return-object p1

    .line 318
    :cond_10
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 319
    .line 320
    array-length p1, p1

    .line 321
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 326
    .line 327
    .line 328
    move-result-object p2

    .line 329
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 330
    .line 331
    .line 332
    move-result-object p3

    .line 333
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    const-string p2, "buffer length=%d, index=%d, size=%d"

    .line 338
    .line 339
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    throw v0

    .line 347
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final o(Ljava/lang/String;[BII)I
    .locals 24

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p0

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    iget v5, v3, Lcom/google/crypto/tink/shaded/protobuf/i0;->a:I

    .line 12
    .line 13
    packed-switch v5, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    int-to-long v5, v2

    .line 17
    int-to-long v7, v4

    .line 18
    add-long/2addr v7, v5

    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v9

    .line 23
    const-string v10, " at index "

    .line 24
    .line 25
    const-string v11, "Failed writing "

    .line 26
    .line 27
    if-gt v9, v4, :cond_c

    .line 28
    .line 29
    array-length v12, v1

    .line 30
    sub-int/2addr v12, v4

    .line 31
    if-lt v12, v2, :cond_c

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    const-wide/16 v12, 0x1

    .line 35
    .line 36
    const/16 v4, 0x80

    .line 37
    .line 38
    if-ge v2, v9, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v14

    .line 44
    if-ge v14, v4, :cond_0

    .line 45
    .line 46
    add-long/2addr v12, v5

    .line 47
    int-to-byte v4, v14

    .line 48
    invoke-static {v1, v5, v6, v4}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    move-wide v5, v12

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    if-ne v2, v9, :cond_1

    .line 56
    .line 57
    long-to-int v0, v5

    .line 58
    goto/16 :goto_5

    .line 59
    .line 60
    :cond_1
    :goto_1
    if-ge v2, v9, :cond_b

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v14

    .line 66
    if-ge v14, v4, :cond_2

    .line 67
    .line 68
    cmp-long v15, v5, v7

    .line 69
    .line 70
    if-gez v15, :cond_2

    .line 71
    .line 72
    add-long v15, v5, v12

    .line 73
    .line 74
    int-to-byte v14, v14

    .line 75
    invoke-static {v1, v5, v6, v14}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 76
    .line 77
    .line 78
    move v6, v4

    .line 79
    move-wide/from16 p3, v12

    .line 80
    .line 81
    move-wide v12, v15

    .line 82
    goto/16 :goto_4

    .line 83
    .line 84
    :cond_2
    const/16 v15, 0x800

    .line 85
    .line 86
    const-wide/16 v16, 0x2

    .line 87
    .line 88
    if-ge v14, v15, :cond_3

    .line 89
    .line 90
    sub-long v18, v7, v16

    .line 91
    .line 92
    cmp-long v15, v5, v18

    .line 93
    .line 94
    if-gtz v15, :cond_3

    .line 95
    .line 96
    move-wide/from16 p3, v12

    .line 97
    .line 98
    add-long v12, v5, p3

    .line 99
    .line 100
    ushr-int/lit8 v15, v14, 0x6

    .line 101
    .line 102
    or-int/lit16 v15, v15, 0x3c0

    .line 103
    .line 104
    int-to-byte v15, v15

    .line 105
    invoke-static {v1, v5, v6, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 106
    .line 107
    .line 108
    add-long v5, v5, v16

    .line 109
    .line 110
    and-int/lit8 v14, v14, 0x3f

    .line 111
    .line 112
    or-int/2addr v14, v4

    .line 113
    int-to-byte v14, v14

    .line 114
    invoke-static {v1, v12, v13, v14}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 115
    .line 116
    .line 117
    move-wide v12, v5

    .line 118
    move v6, v4

    .line 119
    goto/16 :goto_4

    .line 120
    .line 121
    :cond_3
    move-wide/from16 p3, v12

    .line 122
    .line 123
    const v12, 0xdfff

    .line 124
    .line 125
    .line 126
    const v13, 0xd800

    .line 127
    .line 128
    .line 129
    const-wide/16 v18, 0x3

    .line 130
    .line 131
    if-lt v14, v13, :cond_5

    .line 132
    .line 133
    if-ge v12, v14, :cond_4

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    move-wide/from16 v20, v5

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_5
    :goto_2
    sub-long v20, v7, v18

    .line 140
    .line 141
    cmp-long v15, v5, v20

    .line 142
    .line 143
    if-gtz v15, :cond_4

    .line 144
    .line 145
    add-long v12, v5, p3

    .line 146
    .line 147
    ushr-int/lit8 v15, v14, 0xc

    .line 148
    .line 149
    or-int/lit16 v15, v15, 0x1e0

    .line 150
    .line 151
    int-to-byte v15, v15

    .line 152
    invoke-static {v1, v5, v6, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 153
    .line 154
    .line 155
    move-wide/from16 v20, v5

    .line 156
    .line 157
    add-long v4, v20, v16

    .line 158
    .line 159
    ushr-int/lit8 v6, v14, 0x6

    .line 160
    .line 161
    and-int/lit8 v6, v6, 0x3f

    .line 162
    .line 163
    const/16 v15, 0x80

    .line 164
    .line 165
    or-int/2addr v6, v15

    .line 166
    int-to-byte v6, v6

    .line 167
    invoke-static {v1, v12, v13, v6}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 168
    .line 169
    .line 170
    add-long v12, v20, v18

    .line 171
    .line 172
    and-int/lit8 v6, v14, 0x3f

    .line 173
    .line 174
    or-int/2addr v6, v15

    .line 175
    int-to-byte v6, v6

    .line 176
    invoke-static {v1, v4, v5, v6}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 177
    .line 178
    .line 179
    const/16 v6, 0x80

    .line 180
    .line 181
    goto :goto_4

    .line 182
    :goto_3
    const-wide/16 v4, 0x4

    .line 183
    .line 184
    sub-long v22, v7, v4

    .line 185
    .line 186
    cmp-long v6, v20, v22

    .line 187
    .line 188
    if-gtz v6, :cond_8

    .line 189
    .line 190
    add-int/lit8 v6, v2, 0x1

    .line 191
    .line 192
    if-eq v6, v9, :cond_7

    .line 193
    .line 194
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    invoke-static {v14, v2}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 199
    .line 200
    .line 201
    move-result v12

    .line 202
    if-eqz v12, :cond_6

    .line 203
    .line 204
    invoke-static {v14, v2}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    add-long v12, v20, p3

    .line 209
    .line 210
    ushr-int/lit8 v14, v2, 0x12

    .line 211
    .line 212
    or-int/lit16 v14, v14, 0xf0

    .line 213
    .line 214
    int-to-byte v14, v14

    .line 215
    move-wide/from16 v22, v4

    .line 216
    .line 217
    move-wide/from16 v4, v20

    .line 218
    .line 219
    invoke-static {v1, v4, v5, v14}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 220
    .line 221
    .line 222
    move v14, v2

    .line 223
    add-long v2, v4, v16

    .line 224
    .line 225
    ushr-int/lit8 v16, v14, 0xc

    .line 226
    .line 227
    and-int/lit8 v15, v16, 0x3f

    .line 228
    .line 229
    move/from16 v16, v6

    .line 230
    .line 231
    const/16 v6, 0x80

    .line 232
    .line 233
    or-int/2addr v15, v6

    .line 234
    int-to-byte v15, v15

    .line 235
    invoke-static {v1, v12, v13, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 236
    .line 237
    .line 238
    add-long v12, v4, v18

    .line 239
    .line 240
    ushr-int/lit8 v15, v14, 0x6

    .line 241
    .line 242
    and-int/lit8 v15, v15, 0x3f

    .line 243
    .line 244
    or-int/2addr v15, v6

    .line 245
    int-to-byte v15, v15

    .line 246
    invoke-static {v1, v2, v3, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 247
    .line 248
    .line 249
    add-long v2, v4, v22

    .line 250
    .line 251
    and-int/lit8 v4, v14, 0x3f

    .line 252
    .line 253
    or-int/2addr v4, v6

    .line 254
    int-to-byte v4, v4

    .line 255
    invoke-static {v1, v12, v13, v4}, Lcom/google/crypto/tink/shaded/protobuf/h0;->k([BJB)V

    .line 256
    .line 257
    .line 258
    move-wide v12, v2

    .line 259
    move/from16 v2, v16

    .line 260
    .line 261
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 262
    .line 263
    move-object/from16 v3, p0

    .line 264
    .line 265
    move v4, v6

    .line 266
    move-wide v5, v12

    .line 267
    move-wide/from16 v12, p3

    .line 268
    .line 269
    goto/16 :goto_1

    .line 270
    .line 271
    :cond_6
    move/from16 v16, v6

    .line 272
    .line 273
    move/from16 v2, v16

    .line 274
    .line 275
    :cond_7
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/j0;

    .line 276
    .line 277
    add-int/lit8 v2, v2, -0x1

    .line 278
    .line 279
    invoke-direct {v0, v2, v9}, Lcom/google/crypto/tink/shaded/protobuf/j0;-><init>(II)V

    .line 280
    .line 281
    .line 282
    throw v0

    .line 283
    :cond_8
    move-wide/from16 v4, v20

    .line 284
    .line 285
    if-gt v13, v14, :cond_a

    .line 286
    .line 287
    if-gt v14, v12, :cond_a

    .line 288
    .line 289
    add-int/lit8 v1, v2, 0x1

    .line 290
    .line 291
    if-eq v1, v9, :cond_9

    .line 292
    .line 293
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    invoke-static {v14, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_a

    .line 302
    .line 303
    :cond_9
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/j0;

    .line 304
    .line 305
    invoke-direct {v0, v2, v9}, Lcom/google/crypto/tink/shaded/protobuf/j0;-><init>(II)V

    .line 306
    .line 307
    .line 308
    throw v0

    .line 309
    :cond_a
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 310
    .line 311
    new-instance v1, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    throw v0

    .line 333
    :cond_b
    move-wide v4, v5

    .line 334
    long-to-int v0, v4

    .line 335
    :goto_5
    return v0

    .line 336
    :cond_c
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 337
    .line 338
    new-instance v3, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    add-int/lit8 v9, v9, -0x1

    .line 344
    .line 345
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    .line 346
    .line 347
    .line 348
    move-result v0

    .line 349
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    add-int v0, v2, v4

    .line 356
    .line 357
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-direct {v1, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    throw v1

    .line 368
    :pswitch_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 369
    .line 370
    .line 371
    move-result v3

    .line 372
    add-int/2addr v4, v2

    .line 373
    const/4 v5, 0x0

    .line 374
    :goto_6
    const/16 v6, 0x80

    .line 375
    .line 376
    if-ge v5, v3, :cond_d

    .line 377
    .line 378
    add-int v7, v5, v2

    .line 379
    .line 380
    if-ge v7, v4, :cond_d

    .line 381
    .line 382
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    .line 383
    .line 384
    .line 385
    move-result v8

    .line 386
    if-ge v8, v6, :cond_d

    .line 387
    .line 388
    int-to-byte v6, v8

    .line 389
    aput-byte v6, v1, v7

    .line 390
    .line 391
    add-int/lit8 v5, v5, 0x1

    .line 392
    .line 393
    goto :goto_6

    .line 394
    :cond_d
    if-ne v5, v3, :cond_e

    .line 395
    .line 396
    add-int v0, v2, v3

    .line 397
    .line 398
    goto/16 :goto_9

    .line 399
    .line 400
    :cond_e
    add-int/2addr v2, v5

    .line 401
    :goto_7
    if-ge v5, v3, :cond_18

    .line 402
    .line 403
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    .line 404
    .line 405
    .line 406
    move-result v7

    .line 407
    if-ge v7, v6, :cond_f

    .line 408
    .line 409
    if-ge v2, v4, :cond_f

    .line 410
    .line 411
    add-int/lit8 v8, v2, 0x1

    .line 412
    .line 413
    int-to-byte v7, v7

    .line 414
    aput-byte v7, v1, v2

    .line 415
    .line 416
    move v2, v8

    .line 417
    goto/16 :goto_8

    .line 418
    .line 419
    :cond_f
    const/16 v8, 0x800

    .line 420
    .line 421
    if-ge v7, v8, :cond_10

    .line 422
    .line 423
    add-int/lit8 v8, v4, -0x2

    .line 424
    .line 425
    if-gt v2, v8, :cond_10

    .line 426
    .line 427
    add-int/lit8 v8, v2, 0x1

    .line 428
    .line 429
    ushr-int/lit8 v9, v7, 0x6

    .line 430
    .line 431
    or-int/lit16 v9, v9, 0x3c0

    .line 432
    .line 433
    int-to-byte v9, v9

    .line 434
    aput-byte v9, v1, v2

    .line 435
    .line 436
    add-int/lit8 v2, v2, 0x2

    .line 437
    .line 438
    and-int/lit8 v7, v7, 0x3f

    .line 439
    .line 440
    or-int/2addr v7, v6

    .line 441
    int-to-byte v7, v7

    .line 442
    aput-byte v7, v1, v8

    .line 443
    .line 444
    goto :goto_8

    .line 445
    :cond_10
    const v8, 0xdfff

    .line 446
    .line 447
    .line 448
    const v9, 0xd800

    .line 449
    .line 450
    .line 451
    if-lt v7, v9, :cond_11

    .line 452
    .line 453
    if-ge v8, v7, :cond_12

    .line 454
    .line 455
    :cond_11
    add-int/lit8 v10, v4, -0x3

    .line 456
    .line 457
    if-gt v2, v10, :cond_12

    .line 458
    .line 459
    add-int/lit8 v8, v2, 0x1

    .line 460
    .line 461
    ushr-int/lit8 v9, v7, 0xc

    .line 462
    .line 463
    or-int/lit16 v9, v9, 0x1e0

    .line 464
    .line 465
    int-to-byte v9, v9

    .line 466
    aput-byte v9, v1, v2

    .line 467
    .line 468
    add-int/lit8 v9, v2, 0x2

    .line 469
    .line 470
    ushr-int/lit8 v10, v7, 0x6

    .line 471
    .line 472
    and-int/lit8 v10, v10, 0x3f

    .line 473
    .line 474
    or-int/2addr v10, v6

    .line 475
    int-to-byte v10, v10

    .line 476
    aput-byte v10, v1, v8

    .line 477
    .line 478
    add-int/lit8 v2, v2, 0x3

    .line 479
    .line 480
    and-int/lit8 v7, v7, 0x3f

    .line 481
    .line 482
    or-int/2addr v7, v6

    .line 483
    int-to-byte v7, v7

    .line 484
    aput-byte v7, v1, v9

    .line 485
    .line 486
    goto :goto_8

    .line 487
    :cond_12
    add-int/lit8 v10, v4, -0x4

    .line 488
    .line 489
    if-gt v2, v10, :cond_15

    .line 490
    .line 491
    add-int/lit8 v8, v5, 0x1

    .line 492
    .line 493
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 494
    .line 495
    .line 496
    move-result v9

    .line 497
    if-eq v8, v9, :cond_14

    .line 498
    .line 499
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    .line 500
    .line 501
    .line 502
    move-result v5

    .line 503
    invoke-static {v7, v5}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 504
    .line 505
    .line 506
    move-result v9

    .line 507
    if-eqz v9, :cond_13

    .line 508
    .line 509
    invoke-static {v7, v5}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 510
    .line 511
    .line 512
    move-result v5

    .line 513
    add-int/lit8 v7, v2, 0x1

    .line 514
    .line 515
    ushr-int/lit8 v9, v5, 0x12

    .line 516
    .line 517
    or-int/lit16 v9, v9, 0xf0

    .line 518
    .line 519
    int-to-byte v9, v9

    .line 520
    aput-byte v9, v1, v2

    .line 521
    .line 522
    add-int/lit8 v9, v2, 0x2

    .line 523
    .line 524
    ushr-int/lit8 v10, v5, 0xc

    .line 525
    .line 526
    and-int/lit8 v10, v10, 0x3f

    .line 527
    .line 528
    or-int/2addr v10, v6

    .line 529
    int-to-byte v10, v10

    .line 530
    aput-byte v10, v1, v7

    .line 531
    .line 532
    add-int/lit8 v7, v2, 0x3

    .line 533
    .line 534
    ushr-int/lit8 v10, v5, 0x6

    .line 535
    .line 536
    and-int/lit8 v10, v10, 0x3f

    .line 537
    .line 538
    or-int/2addr v10, v6

    .line 539
    int-to-byte v10, v10

    .line 540
    aput-byte v10, v1, v9

    .line 541
    .line 542
    add-int/lit8 v2, v2, 0x4

    .line 543
    .line 544
    and-int/lit8 v5, v5, 0x3f

    .line 545
    .line 546
    or-int/2addr v5, v6

    .line 547
    int-to-byte v5, v5

    .line 548
    aput-byte v5, v1, v7

    .line 549
    .line 550
    move v5, v8

    .line 551
    :goto_8
    add-int/lit8 v5, v5, 0x1

    .line 552
    .line 553
    goto/16 :goto_7

    .line 554
    .line 555
    :cond_13
    move v5, v8

    .line 556
    :cond_14
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/j0;

    .line 557
    .line 558
    add-int/lit8 v5, v5, -0x1

    .line 559
    .line 560
    invoke-direct {v0, v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/j0;-><init>(II)V

    .line 561
    .line 562
    .line 563
    throw v0

    .line 564
    :cond_15
    if-gt v9, v7, :cond_17

    .line 565
    .line 566
    if-gt v7, v8, :cond_17

    .line 567
    .line 568
    add-int/lit8 v1, v5, 0x1

    .line 569
    .line 570
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 571
    .line 572
    .line 573
    move-result v4

    .line 574
    if-eq v1, v4, :cond_16

    .line 575
    .line 576
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 577
    .line 578
    .line 579
    move-result v0

    .line 580
    invoke-static {v7, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 581
    .line 582
    .line 583
    move-result v0

    .line 584
    if-nez v0, :cond_17

    .line 585
    .line 586
    :cond_16
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/j0;

    .line 587
    .line 588
    invoke-direct {v0, v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/j0;-><init>(II)V

    .line 589
    .line 590
    .line 591
    throw v0

    .line 592
    :cond_17
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 593
    .line 594
    new-instance v1, Ljava/lang/StringBuilder;

    .line 595
    .line 596
    const-string v3, "Failed writing "

    .line 597
    .line 598
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 599
    .line 600
    .line 601
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    const-string v3, " at index "

    .line 605
    .line 606
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v1

    .line 616
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    throw v0

    .line 620
    :cond_18
    move v0, v2

    .line 621
    :goto_9
    return v0

    .line 622
    nop

    .line 623
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final z([BII)I
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p0

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    iget v4, v2, Lcom/google/crypto/tink/shaded/protobuf/i0;->a:I

    .line 10
    .line 11
    packed-switch v4, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    or-int v4, v1, v3

    .line 15
    .line 16
    array-length v5, v0

    .line 17
    sub-int/2addr v5, v3

    .line 18
    or-int/2addr v4, v5

    .line 19
    if-ltz v4, :cond_14

    .line 20
    .line 21
    int-to-long v4, v1

    .line 22
    int-to-long v6, v3

    .line 23
    sub-long/2addr v6, v4

    .line 24
    long-to-int v1, v6

    .line 25
    const/16 v3, 0x10

    .line 26
    .line 27
    const-wide/16 v7, 0x1

    .line 28
    .line 29
    if-ge v1, v3, :cond_0

    .line 30
    .line 31
    const/4 v9, 0x0

    .line 32
    goto :goto_3

    .line 33
    :cond_0
    long-to-int v3, v4

    .line 34
    and-int/lit8 v3, v3, 0x7

    .line 35
    .line 36
    rsub-int/lit8 v3, v3, 0x8

    .line 37
    .line 38
    move-wide v10, v4

    .line 39
    const/4 v9, 0x0

    .line 40
    :goto_0
    if-ge v9, v3, :cond_2

    .line 41
    .line 42
    add-long v12, v10, v7

    .line 43
    .line 44
    invoke-static {v0, v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 45
    .line 46
    .line 47
    move-result v10

    .line 48
    if-gez v10, :cond_1

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_1
    add-int/lit8 v9, v9, 0x1

    .line 52
    .line 53
    move-wide v10, v12

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    :goto_1
    add-int/lit8 v3, v9, 0x8

    .line 56
    .line 57
    if-gt v3, v1, :cond_4

    .line 58
    .line 59
    sget-wide v12, Lcom/google/crypto/tink/shaded/protobuf/h0;->f:J

    .line 60
    .line 61
    add-long/2addr v12, v10

    .line 62
    sget-object v14, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 63
    .line 64
    invoke-virtual {v14, v12, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v12

    .line 68
    const-wide v14, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    and-long/2addr v12, v14

    .line 74
    const-wide/16 v14, 0x0

    .line 75
    .line 76
    cmp-long v12, v12, v14

    .line 77
    .line 78
    if-eqz v12, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    const-wide/16 v12, 0x8

    .line 82
    .line 83
    add-long/2addr v10, v12

    .line 84
    move v9, v3

    .line 85
    goto :goto_1

    .line 86
    :cond_4
    :goto_2
    if-ge v9, v1, :cond_6

    .line 87
    .line 88
    add-long v12, v10, v7

    .line 89
    .line 90
    invoke-static {v0, v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-gez v3, :cond_5

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    add-int/lit8 v9, v9, 0x1

    .line 98
    .line 99
    move-wide v10, v12

    .line 100
    goto :goto_2

    .line 101
    :cond_6
    move v9, v1

    .line 102
    :goto_3
    sub-int/2addr v1, v9

    .line 103
    int-to-long v9, v9

    .line 104
    add-long/2addr v4, v9

    .line 105
    :goto_4
    const/4 v3, 0x0

    .line 106
    :goto_5
    if-lez v1, :cond_8

    .line 107
    .line 108
    add-long v9, v4, v7

    .line 109
    .line 110
    invoke-static {v0, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-ltz v3, :cond_7

    .line 115
    .line 116
    add-int/lit8 v1, v1, -0x1

    .line 117
    .line 118
    move-wide v4, v9

    .line 119
    goto :goto_5

    .line 120
    :cond_7
    move-wide v4, v9

    .line 121
    :cond_8
    if-nez v1, :cond_9

    .line 122
    .line 123
    const/4 v6, 0x0

    .line 124
    goto/16 :goto_8

    .line 125
    .line 126
    :cond_9
    add-int/lit8 v9, v1, -0x1

    .line 127
    .line 128
    const/16 v10, -0x20

    .line 129
    .line 130
    const/16 v11, -0x41

    .line 131
    .line 132
    if-ge v3, v10, :cond_c

    .line 133
    .line 134
    if-nez v9, :cond_a

    .line 135
    .line 136
    move v6, v3

    .line 137
    goto/16 :goto_8

    .line 138
    .line 139
    :cond_a
    add-int/lit8 v1, v1, -0x2

    .line 140
    .line 141
    const/16 v9, -0x3e

    .line 142
    .line 143
    if-lt v3, v9, :cond_13

    .line 144
    .line 145
    add-long v9, v4, v7

    .line 146
    .line 147
    invoke-static {v0, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-le v3, v11, :cond_b

    .line 152
    .line 153
    goto/16 :goto_7

    .line 154
    .line 155
    :cond_b
    move-wide v15, v7

    .line 156
    move-wide v4, v9

    .line 157
    goto :goto_6

    .line 158
    :cond_c
    const/16 v12, -0x10

    .line 159
    .line 160
    const-wide/16 v13, 0x2

    .line 161
    .line 162
    if-ge v3, v12, :cond_10

    .line 163
    .line 164
    const/4 v12, 0x2

    .line 165
    if-ge v9, v12, :cond_d

    .line 166
    .line 167
    invoke-static {v4, v5, v0, v3, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->O(J[BII)I

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    goto :goto_8

    .line 172
    :cond_d
    add-int/lit8 v1, v1, -0x3

    .line 173
    .line 174
    move-wide v15, v7

    .line 175
    add-long v6, v4, v15

    .line 176
    .line 177
    invoke-static {v0, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    if-gt v8, v11, :cond_13

    .line 182
    .line 183
    const/16 v9, -0x60

    .line 184
    .line 185
    if-ne v3, v10, :cond_e

    .line 186
    .line 187
    if-lt v8, v9, :cond_13

    .line 188
    .line 189
    :cond_e
    const/16 v10, -0x13

    .line 190
    .line 191
    if-ne v3, v10, :cond_f

    .line 192
    .line 193
    if-ge v8, v9, :cond_13

    .line 194
    .line 195
    :cond_f
    add-long/2addr v4, v13

    .line 196
    invoke-static {v0, v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-le v3, v11, :cond_12

    .line 201
    .line 202
    goto :goto_7

    .line 203
    :cond_10
    move-wide v15, v7

    .line 204
    const/4 v6, 0x3

    .line 205
    if-ge v9, v6, :cond_11

    .line 206
    .line 207
    invoke-static {v4, v5, v0, v3, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->O(J[BII)I

    .line 208
    .line 209
    .line 210
    move-result v6

    .line 211
    goto :goto_8

    .line 212
    :cond_11
    add-int/lit8 v1, v1, -0x4

    .line 213
    .line 214
    add-long v7, v4, v15

    .line 215
    .line 216
    invoke-static {v0, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 217
    .line 218
    .line 219
    move-result v6

    .line 220
    if-gt v6, v11, :cond_13

    .line 221
    .line 222
    shl-int/lit8 v3, v3, 0x1c

    .line 223
    .line 224
    add-int/lit8 v6, v6, 0x70

    .line 225
    .line 226
    add-int/2addr v6, v3

    .line 227
    shr-int/lit8 v3, v6, 0x1e

    .line 228
    .line 229
    if-nez v3, :cond_13

    .line 230
    .line 231
    add-long/2addr v13, v4

    .line 232
    invoke-static {v0, v7, v8}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    if-gt v3, v11, :cond_13

    .line 237
    .line 238
    const-wide/16 v6, 0x3

    .line 239
    .line 240
    add-long/2addr v4, v6

    .line 241
    invoke-static {v0, v13, v14}, Lcom/google/crypto/tink/shaded/protobuf/h0;->g([BJ)B

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-le v3, v11, :cond_12

    .line 246
    .line 247
    goto :goto_7

    .line 248
    :cond_12
    :goto_6
    move-wide v7, v15

    .line 249
    goto/16 :goto_4

    .line 250
    .line 251
    :cond_13
    :goto_7
    const/4 v6, -0x1

    .line 252
    :goto_8
    return v6

    .line 253
    :cond_14
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 254
    .line 255
    array-length v0, v0

    .line 256
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    filled-new-array {v0, v1, v3}, [Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    const-string v1, "Array length=%d, index=%d, limit=%d"

    .line 273
    .line 274
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-direct {v4, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    throw v4

    .line 282
    :goto_9
    :pswitch_0
    if-ge v1, v3, :cond_15

    .line 283
    .line 284
    aget-byte v4, v0, v1

    .line 285
    .line 286
    if-ltz v4, :cond_15

    .line 287
    .line 288
    add-int/lit8 v1, v1, 0x1

    .line 289
    .line 290
    goto :goto_9

    .line 291
    :cond_15
    if-lt v1, v3, :cond_16

    .line 292
    .line 293
    goto :goto_b

    .line 294
    :cond_16
    :goto_a
    if-lt v1, v3, :cond_17

    .line 295
    .line 296
    :goto_b
    const/4 v0, 0x0

    .line 297
    goto/16 :goto_d

    .line 298
    .line 299
    :cond_17
    add-int/lit8 v4, v1, 0x1

    .line 300
    .line 301
    aget-byte v5, v0, v1

    .line 302
    .line 303
    if-gez v5, :cond_20

    .line 304
    .line 305
    const/16 v6, -0x20

    .line 306
    .line 307
    const/16 v7, -0x41

    .line 308
    .line 309
    if-ge v5, v6, :cond_19

    .line 310
    .line 311
    if-lt v4, v3, :cond_18

    .line 312
    .line 313
    move v0, v5

    .line 314
    goto :goto_d

    .line 315
    :cond_18
    const/16 v6, -0x3e

    .line 316
    .line 317
    if-lt v5, v6, :cond_1f

    .line 318
    .line 319
    add-int/lit8 v1, v1, 0x2

    .line 320
    .line 321
    aget-byte v4, v0, v4

    .line 322
    .line 323
    if-le v4, v7, :cond_16

    .line 324
    .line 325
    goto :goto_c

    .line 326
    :cond_19
    const/16 v8, -0x10

    .line 327
    .line 328
    if-ge v5, v8, :cond_1d

    .line 329
    .line 330
    add-int/lit8 v8, v3, -0x1

    .line 331
    .line 332
    if-lt v4, v8, :cond_1a

    .line 333
    .line 334
    invoke-static {v0, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/k0;->a([BII)I

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    goto :goto_d

    .line 339
    :cond_1a
    add-int/lit8 v8, v1, 0x2

    .line 340
    .line 341
    aget-byte v4, v0, v4

    .line 342
    .line 343
    if-gt v4, v7, :cond_1f

    .line 344
    .line 345
    const/16 v9, -0x60

    .line 346
    .line 347
    if-ne v5, v6, :cond_1b

    .line 348
    .line 349
    if-lt v4, v9, :cond_1f

    .line 350
    .line 351
    :cond_1b
    const/16 v6, -0x13

    .line 352
    .line 353
    if-ne v5, v6, :cond_1c

    .line 354
    .line 355
    if-ge v4, v9, :cond_1f

    .line 356
    .line 357
    :cond_1c
    add-int/lit8 v1, v1, 0x3

    .line 358
    .line 359
    aget-byte v4, v0, v8

    .line 360
    .line 361
    if-le v4, v7, :cond_16

    .line 362
    .line 363
    goto :goto_c

    .line 364
    :cond_1d
    add-int/lit8 v6, v3, -0x2

    .line 365
    .line 366
    if-lt v4, v6, :cond_1e

    .line 367
    .line 368
    invoke-static {v0, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/k0;->a([BII)I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    goto :goto_d

    .line 373
    :cond_1e
    add-int/lit8 v6, v1, 0x2

    .line 374
    .line 375
    aget-byte v4, v0, v4

    .line 376
    .line 377
    if-gt v4, v7, :cond_1f

    .line 378
    .line 379
    shl-int/lit8 v5, v5, 0x1c

    .line 380
    .line 381
    add-int/lit8 v4, v4, 0x70

    .line 382
    .line 383
    add-int/2addr v4, v5

    .line 384
    shr-int/lit8 v4, v4, 0x1e

    .line 385
    .line 386
    if-nez v4, :cond_1f

    .line 387
    .line 388
    add-int/lit8 v4, v1, 0x3

    .line 389
    .line 390
    aget-byte v5, v0, v6

    .line 391
    .line 392
    if-gt v5, v7, :cond_1f

    .line 393
    .line 394
    add-int/lit8 v1, v1, 0x4

    .line 395
    .line 396
    aget-byte v4, v0, v4

    .line 397
    .line 398
    if-le v4, v7, :cond_16

    .line 399
    .line 400
    :cond_1f
    :goto_c
    const/4 v0, -0x1

    .line 401
    :goto_d
    return v0

    .line 402
    :cond_20
    move v1, v4

    .line 403
    goto :goto_a

    .line 404
    nop

    .line 405
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
