.class public final synthetic LE0/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LG0/b;


# instance fields
.field public final synthetic e:LE0/l;

.field public final synthetic f:Ly0/i;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(LE0/l;Ly0/i;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LE0/g;->e:LE0/l;

    iput-object p2, p0, LE0/g;->f:Ly0/i;

    iput p3, p0, LE0/g;->g:I

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, LE0/g;->e:LE0/l;

    .line 2
    .line 3
    iget-object v0, v0, LE0/l;->d:LE0/d;

    .line 4
    .line 5
    iget v1, p0, LE0/g;->g:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iget-object v3, p0, LE0/g;->f:Ly0/i;

    .line 11
    .line 12
    invoke-virtual {v0, v3, v1, v2}, LE0/d;->a(Ly0/i;IZ)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    return-object v0
.end method
