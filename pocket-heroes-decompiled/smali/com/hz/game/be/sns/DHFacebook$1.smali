.class Lcom/hz/game/be/sns/DHFacebook$1;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Lcom/facebook/Session$StatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->openSession2(I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .locals 2
    .param p1, "session"    # Lcom/facebook/Session;
    .param p2, "state"    # Lcom/facebook/SessionState;
    .param p3, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 112
    if-eqz p3, :cond_1

    .line 113
    const-string v0, "DHFacebook"

    const-string v1, "openSession fail"

    invoke-static {v0, v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$0()V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/facebook/Session;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const-string v0, "DHFacebook"

    const-string v1, "openSession succeed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->access$1()V

    goto :goto_0
.end method
