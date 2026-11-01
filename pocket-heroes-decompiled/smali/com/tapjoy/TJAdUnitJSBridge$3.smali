.class Lcom/tapjoy/TJAdUnitJSBridge$3;
.super Ljava/lang/Object;
.source "TJAdUnitJSBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TJAdUnitJSBridge;->displayRichMedia(Lorg/json/JSONObject;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TJAdUnitJSBridge;

.field final synthetic val$json:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/tapjoy/TJAdUnitJSBridge;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    iput-object p2, p0, Lcom/tapjoy/TJAdUnitJSBridge$3;->val$json:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 377
    const/4 v4, 0x0

    .line 381
    .local v4, "html":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->val$json:Lorg/json/JSONObject;

    const-string v5, "html"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 389
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$200(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 391
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$200(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 393
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$200(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v5}, Lcom/tapjoy/TJAdUnitJSBridge;->access$200(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 397
    :cond_0
    new-instance v2, Lcom/tapjoy/mraid/view/MraidView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$300(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;-><init>(Landroid/content/Context;)V

    .line 398
    .local v2, "banner":Lcom/tapjoy/mraid/view/MraidView;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$400(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v11

    .line 399
    .local v11, "webSettings":Landroid/webkit/WebSettings;
    const/4 v3, 0x1

    invoke-virtual {v11, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 400
    sget-object v3, Lcom/tapjoy/mraid/view/MraidView$PLACEMENT_TYPE;->INLINE:Lcom/tapjoy/mraid/view/MraidView$PLACEMENT_TYPE;

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->setPlacementType(Lcom/tapjoy/mraid/view/MraidView$PLACEMENT_TYPE;)V

    .line 403
    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    const/16 v3, 0x280

    const/16 v5, 0x64

    invoke-direct {v9, v3, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 404
    .local v9, "layout":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v2, v9}, Lcom/tapjoy/mraid/view/MraidView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 407
    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->setInitialScale(I)V

    .line 410
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/tapjoy/mraid/view/MraidView;->setBackgroundColor(I)V

    .line 411
    const/4 v3, 0x0

    const-string v5, "text/html"

    const-string v6, "utf-8"

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/tapjoy/mraid/view/MraidView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$300(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/content/Context;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    const-string v5, "window"

    invoke-virtual {v3, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/WindowManager;

    .line 415
    .local v12, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getWidth()I

    move-result v10

    .line 416
    .local v10, "screenWidth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v2, v10}, Lcom/tapjoy/TapjoyUtil;->scaleDisplayAd(Landroid/view/View;I)Landroid/view/View;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/tapjoy/TJAdUnitJSBridge;->access$202(Lcom/tapjoy/TJAdUnitJSBridge;Landroid/view/View;)Landroid/view/View;

    .line 418
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v3}, Lcom/tapjoy/TJAdUnitJSBridge;->access$300(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/content/Context;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/tapjoy/TJAdUnitJSBridge$3;->this$0:Lcom/tapjoy/TJAdUnitJSBridge;

    invoke-static {v5}, Lcom/tapjoy/TJAdUnitJSBridge;->access$200(Lcom/tapjoy/TJAdUnitJSBridge;)Landroid/view/View;

    move-result-object v5

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const-wide/high16 v14, 0x4059000000000000L    # 100.0

    int-to-double v0, v10

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4084000000000000L    # 640.0

    div-double v16, v16, v18

    mul-double v14, v14, v16

    double-to-int v7, v14

    invoke-direct {v6, v10, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v6}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 419
    return-void

    .line 383
    .end local v2    # "banner":Lcom/tapjoy/mraid/view/MraidView;
    .end local v9    # "layout":Landroid/view/ViewGroup$LayoutParams;
    .end local v10    # "screenWidth":I
    .end local v11    # "webSettings":Landroid/webkit/WebSettings;
    .end local v12    # "windowManager":Landroid/view/WindowManager;
    :catch_0
    move-exception v8

    .line 385
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method
