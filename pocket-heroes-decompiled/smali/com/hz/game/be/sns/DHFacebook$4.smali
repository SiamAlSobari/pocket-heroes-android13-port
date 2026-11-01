.class Lcom/hz/game/be/sns/DHFacebook$4;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/Request$GraphUserCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->getMyInfo2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/model/GraphUser;Lcom/facebook/Response;)V
    .locals 5
    .param p1, "user"    # Lcom/facebook/model/GraphUser;
    .param p2, "response"    # Lcom/facebook/Response;

    .prologue
    .line 161
    invoke-virtual {p2}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 162
    .local v0, "e":Lcom/facebook/FacebookRequestError;
    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 163
    :cond_0
    const-string v2, "DHFacebook"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getMyInfo fail :"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$4()V

    .line 174
    :goto_0
    return-void

    .line 166
    :cond_1
    const-string v2, "DHFacebook"

    const-string v3, "getMyInfo succeed"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v1, Lcom/hz/game/be/sns/FBUser;

    invoke-direct {v1}, Lcom/hz/game/be/sns/FBUser;-><init>()V

    .line 168
    .local v1, "u":Lcom/hz/game/be/sns/FBUser;
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    const-string v2, ""

    :goto_1
    iput-object v2, v1, Lcom/hz/game/be/sns/FBUser;->id:Ljava/lang/String;

    .line 169
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    const-string v2, ""

    :goto_2
    iput-object v2, v1, Lcom/hz/game/be/sns/FBUser;->name:Ljava/lang/String;

    .line 170
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    const-string v2, ""

    :goto_3
    iput-object v2, v1, Lcom/hz/game/be/sns/FBUser;->firstName:Ljava/lang/String;

    .line 171
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    const-string v2, ""

    :goto_4
    iput-object v2, v1, Lcom/hz/game/be/sns/FBUser;->lastName:Ljava/lang/String;

    .line 172
    invoke-static {v1}, Lcom/hz/game/be/sns/DHFacebook;->access$5(Lcom/hz/game/be/sns/FBUser;)V

    goto :goto_0

    .line 168
    :cond_2
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 169
    :cond_3
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 170
    :cond_4
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 171
    :cond_5
    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v2

    goto :goto_4
.end method
