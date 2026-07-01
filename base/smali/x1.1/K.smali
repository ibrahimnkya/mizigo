.class public final Lx1/K;
.super Lcom/google/crypto/tink/shaded/protobuf/u;
.source "SourceFile"

# interfaces
.implements Lcom/google/crypto/tink/shaded/protobuf/N;


# instance fields
.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/crypto/tink/shaded/protobuf/w;I)V
    .locals 0

    .line 1
    iput p2, p0, Lx1/K;->g:I

    invoke-direct {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/u;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;)V

    return-void
.end method


# virtual methods
.method public final a()Lcom/google/crypto/tink/shaded/protobuf/w;
    .locals 1

    .line 1
    iget v0, p0, Lx1/K;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->e:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 7
    .line 8
    return-object v0

    .line 9
    :pswitch_0
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->e:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->e:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 13
    .line 14
    return-object v0

    .line 15
    :pswitch_2
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/u;->e:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 16
    .line 17
    return-object v0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lx1/K;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->d()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->d()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0

    .line 16
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->d()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0

    .line 21
    :pswitch_2
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/u;->d()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
