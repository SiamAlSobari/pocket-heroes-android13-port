.class Lcom/hz/game/be/sns/DHFacebook$12;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->receiveRequests2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 10
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 318
    invoke-virtual {p1}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v2

    .line 319
    .local v2, "e":Lcom/facebook/FacebookRequestError;
    if-eqz v2, :cond_0

    .line 320
    const-string v7, "DHFacebook"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "receiveRequests fail: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$16()V

    .line 338
    :goto_0
    return-void

    .line 323
    :cond_0
    const-string v7, "DHFacebook"

    const-string v8, "receiveRequests succeed"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 325
    .local v6, "reqs":Ljava/util/List;, "Ljava/util/List<Lcom/hz/game/be/sns/FBReq;>;"
    invoke-virtual {p1}, Lcom/facebook/Response;->getGraphObject()Lcom/facebook/model/GraphObject;

    move-result-object v7

    invoke-interface {v7}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    .line 326
    .local v0, "all":Lorg/json/JSONObject;
    const-string v7, "data"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 327
    .local v1, "data":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v3, v7, :cond_1

    .line 336
    invoke-static {v6}, Lcom/hz/game/be/sns/DHFacebook;->access$17(Ljava/util/List;)V

    goto :goto_0

    .line 328
    :cond_1
    new-instance v5, Lcom/hz/game/be/sns/FBReq;

    invoke-direct {v5}, Lcom/hz/game/be/sns/FBReq;-><init>()V

    .line 329
    .local v5, "req":Lcom/hz/game/be/sns/FBReq;
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 330
    .local v4, "jo":Lorg/json/JSONObject;
    const-string v7, "id"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/hz/game/be/sns/FBReq;->id:Ljava/lang/String;

    .line 331
    const-string v7, "from"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "id"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/hz/game/be/sns/FBReq;->fromId:Ljava/lang/String;

    .line 332
    const-string v7, "from"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "name"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/hz/game/be/sns/FBReq;->fromName:Ljava/lang/String;

    .line 333
    const-string v7, "data"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lcom/hz/game/be/sns/FBReq;->data:Ljava/lang/String;

    .line 334
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
