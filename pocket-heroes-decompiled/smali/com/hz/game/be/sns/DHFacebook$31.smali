.class Lcom/hz/game/be/sns/DHFacebook$31;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestSucceed(Lcom/hz/game/be/sns/FBReq;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$req:Lcom/hz/game/be/sns/FBReq;


# direct methods
.method constructor <init>(Lcom/hz/game/be/sns/FBReq;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$31;->val$req:Lcom/hz/game/be/sns/FBReq;

    .line 569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 572
    iget-object v0, p0, Lcom/hz/game/be/sns/DHFacebook$31;->val$req:Lcom/hz/game/be/sns/FBReq;

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->nOnReceiveRequestSucceed(Lcom/hz/game/be/sns/FBReq;)V

    .line 573
    return-void
.end method
