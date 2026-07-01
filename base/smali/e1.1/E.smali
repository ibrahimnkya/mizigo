.class public interface abstract Le1/E;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Le1/B;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Le1/B;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v2, v1, v1}, Le1/B;-><init>([BII)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Le1/E;->b:Le1/B;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public abstract j(III)Le1/B;
.end method
