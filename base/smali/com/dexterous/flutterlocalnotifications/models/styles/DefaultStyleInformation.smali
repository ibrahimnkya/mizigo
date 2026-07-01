.class public Lcom/dexterous/flutterlocalnotifications/models/styles/DefaultStyleInformation;
.super Lcom/dexterous/flutterlocalnotifications/models/styles/StyleInformation;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field public htmlFormatBody:Ljava/lang/Boolean;

.field public htmlFormatTitle:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/dexterous/flutterlocalnotifications/models/styles/StyleInformation;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/dexterous/flutterlocalnotifications/models/styles/DefaultStyleInformation;->htmlFormatTitle:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/dexterous/flutterlocalnotifications/models/styles/DefaultStyleInformation;->htmlFormatBody:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-void
.end method
