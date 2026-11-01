.class Lcom/hz/game/be/sns/DHFacebook$8;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/widget/WebDialog$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->share(Lcom/hz/game/be/sns/FBShareParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .locals 2
    .param p1, "values"    # Landroid/os/Bundle;
    .param p2, "error"    # Lcom/facebook/FacebookException;

    .prologue
    .line 248
    if-nez p2, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "post_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 249
    const-string v0, "DHFacebook"

    const-string v1, "share succeed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$10()V

    .line 255
    :goto_0
    return-void

    .line 252
    :cond_0
    const-string v0, "DHFacebook"

    const-string v1, "share fail"

    invoke-static {v0, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 253
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$11()V

    goto :goto_0
.end method
