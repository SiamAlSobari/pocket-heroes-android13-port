.class Lcom/hz/game/be/sns/DHFacebook$6;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/Request$GraphUserListCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->getFriendsInfo2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/util/List;Lcom/facebook/Response;)V
    .locals 7
    .param p2, "response"    # Lcom/facebook/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/model/GraphUser;",
            ">;",
            "Lcom/facebook/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 198
    .local p1, "users":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/model/GraphUser;>;"
    invoke-virtual {p2}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 199
    .local v0, "e":Lcom/facebook/FacebookRequestError;
    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 200
    :cond_0
    const-string v4, "DHFacebook"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getFriendsInfo fail: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$7()V

    .line 215
    :goto_0
    return-void

    .line 203
    :cond_1
    const-string v4, "DHFacebook"

    const-string v5, "getFriendsInfo succeed"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lcom/hz/game/be/sns/FBUser;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 213
    invoke-static {v1}, Lcom/hz/game/be/sns/DHFacebook;->access$8(Ljava/util/List;)V

    goto :goto_0

    .line 205
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/model/GraphUser;

    .line 206
    .local v3, "user":Lcom/facebook/model/GraphUser;
    new-instance v2, Lcom/hz/game/be/sns/FBUser;

    invoke-direct {v2}, Lcom/hz/game/be/sns/FBUser;-><init>()V

    .line 207
    .local v2, "u":Lcom/hz/game/be/sns/FBUser;
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    const-string v4, ""

    :goto_2
    iput-object v4, v2, Lcom/hz/game/be/sns/FBUser;->id:Ljava/lang/String;

    .line 208
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    const-string v4, ""

    :goto_3
    iput-object v4, v2, Lcom/hz/game/be/sns/FBUser;->name:Ljava/lang/String;

    .line 209
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5

    const-string v4, ""

    :goto_4
    iput-object v4, v2, Lcom/hz/game/be/sns/FBUser;->firstName:Ljava/lang/String;

    .line 210
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_6

    const-string v4, ""

    :goto_5
    iput-object v4, v2, Lcom/hz/game/be/sns/FBUser;->lastName:Ljava/lang/String;

    .line 211
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 207
    :cond_3
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 208
    :cond_4
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getName()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 209
    :cond_5
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 210
    :cond_6
    invoke-interface {v3}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v4

    goto :goto_5
.end method
