.class Lcom/hz/game/be/sns/DHFacebook$10;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/widget/WebDialog$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->sendRequest(Lcom/hz/game/be/sns/FBReqParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 284
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
    .line 287
    if-nez p2, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "request"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 288
    const-string v0, "DHFacebook"

    const-string v1, "sendRequest succeed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$13()V

    .line 294
    :goto_0
    return-void

    .line 291
    :cond_0
    const-string v0, "DHFacebook"

    const-string v1, "sendRequest fail"

    invoke-static {v0, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 292
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$14()V

    goto :goto_0
.end method
