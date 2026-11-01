.class Lcom/hz/game/be/sns/FBReqParam;
.super Ljava/lang/Object;
.source "DHFacebook.java"


# instance fields
.field public data:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public reqTo:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/String;
    .param p2, "m"    # Ljava/lang/String;
    .param p3, "r"    # Ljava/lang/String;
    .param p4, "d"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/hz/game/be/sns/FBReqParam;->title:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lcom/hz/game/be/sns/FBReqParam;->message:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lcom/hz/game/be/sns/FBReqParam;->reqTo:Ljava/lang/String;

    .line 68
    iput-object p4, p0, Lcom/hz/game/be/sns/FBReqParam;->data:Ljava/lang/String;

    .line 69
    return-void
.end method
