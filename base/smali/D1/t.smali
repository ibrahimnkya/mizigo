.class public final LD1/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LP1/a;


# static fields
.field public static final c:LA1/h;

.field public static final d:LD1/g;


# instance fields
.field public a:LA1/h;

.field public volatile b:LP1/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LA1/h;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, LA1/h;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LD1/t;->c:LA1/h;

    .line 8
    .line 9
    new-instance v0, LD1/g;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, LD1/g;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, LD1/t;->d:LD1/g;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LD1/t;->b:LP1/a;

    .line 2
    .line 3
    invoke-interface {v0}, LP1/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method
