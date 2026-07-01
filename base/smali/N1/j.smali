.class public final synthetic LN1/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LH3/l;


# instance fields
.field public final synthetic e:LN1/l;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(LN1/l;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN1/j;->e:LN1/l;

    iput-object p2, p0, LN1/j;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, LM/b;

    .line 2
    .line 3
    iget-object v0, p0, LN1/j;->e:LN1/l;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    sget-object v1, LN1/l;->d:LM/d;

    .line 9
    .line 10
    iget-object v2, p0, LN1/j;->f:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v1, v2}, LM/b;->e(LM/d;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, v2}, LN1/l;->d(LM/b;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    return-object p1
.end method
