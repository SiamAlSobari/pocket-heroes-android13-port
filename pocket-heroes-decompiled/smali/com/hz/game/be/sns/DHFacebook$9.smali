.class Lcom/hz/game/be/sns/DHFacebook$9;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->sendRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$data:Ljava/lang/String;

.field private final synthetic val$message:Ljava/lang/String;

.field private final synthetic val$reqTo:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$title:Ljava/lang/String;

    iput-object p2, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$message:Ljava/lang/String;

    iput-object p3, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$reqTo:Ljava/lang/String;

    iput-object p4, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$data:Ljava/lang/String;

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 263
    new-instance v0, Lcom/hz/game/be/sns/FBReqParam;

    iget-object v1, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$message:Ljava/lang/String;

    iget-object v3, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$reqTo:Ljava/lang/String;

    iget-object v4, p0, Lcom/hz/game/be/sns/DHFacebook$9;->val$data:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hz/game/be/sns/FBReqParam;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->access$12(Lcom/hz/game/be/sns/FBReqParam;)V

    .line 264
    return-void
.end method
