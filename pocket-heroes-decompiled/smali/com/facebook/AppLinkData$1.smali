.class Lcom/facebook/AppLinkData$1;
.super Ljava/lang/Object;
.source "AppLinkData.java"

# interfaces
.implements Lcom/facebook/internal/PlatformServiceClient$CompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/AppLinkData;->fetchDeferredAppLinkData(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/AppLinkData$CompletionHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$completionHandler:Lcom/facebook/AppLinkData$CompletionHandler;


# direct methods
.method constructor <init>(Lcom/facebook/AppLinkData$CompletionHandler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AppLinkData$1;->val$completionHandler:Lcom/facebook/AppLinkData$CompletionHandler;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public completed(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "result"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v6, -0x1

    .line 103
    const/4 v1, 0x0

    .line 104
    .local v1, "appLinkData":Lcom/facebook/AppLinkData;
    if-eqz p1, :cond_1

    .line 105
    const-string v3, "com.facebook.platform.APPLINK_ARGS"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "appLinkArgsJsonString":Ljava/lang/String;
    const-string v3, "com.facebook.platform.APPLINK_TAP_TIME_UTC"

    invoke-virtual {p1, v3, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 109
    .local v4, "tapTimeUtc":J
    invoke-static {v0}, Lcom/facebook/AppLinkData;->access$0(Ljava/lang/String;)Lcom/facebook/AppLinkData;

    move-result-object v1

    .line 110
    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    .line 112
    :try_start_0
    invoke-static {v1}, Lcom/facebook/AppLinkData;->access$1(Lcom/facebook/AppLinkData;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 113
    invoke-static {v1}, Lcom/facebook/AppLinkData;->access$1(Lcom/facebook/AppLinkData;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v6, "com.facebook.platform.APPLINK_TAP_TIME_UTC"

    invoke-virtual {v3, v6, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 115
    :cond_0
    invoke-static {v1}, Lcom/facebook/AppLinkData;->access$2(Lcom/facebook/AppLinkData;)Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 116
    invoke-static {v1}, Lcom/facebook/AppLinkData;->access$2(Lcom/facebook/AppLinkData;)Landroid/os/Bundle;

    move-result-object v3

    const-string v6, "com.facebook.platform.APPLINK_TAP_TIME_UTC"

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .end local v0    # "appLinkArgsJsonString":Ljava/lang/String;
    .end local v4    # "tapTimeUtc":J
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/facebook/AppLinkData$1;->val$completionHandler:Lcom/facebook/AppLinkData$CompletionHandler;

    invoke-interface {v3, v1}, Lcom/facebook/AppLinkData$CompletionHandler;->onDeferredAppLinkDataFetched(Lcom/facebook/AppLinkData;)V

    .line 124
    return-void

    .line 118
    .restart local v0    # "appLinkArgsJsonString":Ljava/lang/String;
    .restart local v4    # "tapTimeUtc":J
    :catch_0
    move-exception v2

    .line 119
    .local v2, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/facebook/AppLinkData;->access$3()Ljava/lang/String;

    move-result-object v3

    const-string v6, "Unable to put tap time in AppLinkData.arguments"

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
