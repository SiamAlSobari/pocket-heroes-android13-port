.class Lcom/droidhang/crosspromotion/CrossPromotionUtil$1;
.super Ljava/lang/Object;
.source "CrossPromotionUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/crosspromotion/CrossPromotionUtil;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 69
    invoke-static {}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$0()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$0()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewManager;

    if-eqz v0, :cond_0

    .line 70
    invoke-static {}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$0()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewManager;

    invoke-static {}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$0()Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 72
    :cond_0
    const-string v0, "CrossPromotion"

    const-string v1, "dismiss"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$1(Landroid/view/View;)V

    .line 74
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->access$2(Z)V

    .line 75
    return-void
.end method
