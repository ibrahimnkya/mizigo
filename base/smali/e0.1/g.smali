.class public final Le0/g;
.super LT0/a;
.source "SourceFile"


# instance fields
.field public final j:Ljava/lang/Object;

.field public final k:I

.field public final l:Le0/a;


# direct methods
.method public constructor <init>(Ljava/lang/Object;ILe0/a;)V
    .locals 1

    .line 1
    const-string v0, "value"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "verificationMode"

    .line 7
    .line 8
    invoke-static {v0, p2}, LE1/j;->o(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0xb

    .line 12
    .line 13
    invoke-direct {p0, v0}, LT0/a;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Le0/g;->j:Ljava/lang/Object;

    .line 17
    .line 18
    iput p2, p0, Le0/g;->k:I

    .line 19
    .line 20
    iput-object p3, p0, Le0/g;->l:Le0/a;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final G(Ljava/lang/String;LH3/l;)LT0/a;
    .locals 3

    .line 1
    iget-object v0, p0, Le0/g;->j:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-interface {p2, v0}, LH3/l;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p2, Le0/f;

    .line 17
    .line 18
    iget-object v1, p0, Le0/g;->l:Le0/a;

    .line 19
    .line 20
    iget v2, p0, Le0/g;->k:I

    .line 21
    .line 22
    invoke-direct {p2, v0, p1, v1, v2}, Le0/f;-><init>(Ljava/lang/Object;Ljava/lang/String;Le0/a;I)V

    .line 23
    .line 24
    .line 25
    return-object p2
.end method

.method public final e()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Le0/g;->j:Ljava/lang/Object;

    .line 2
    .line 3
    return-object v0
.end method
