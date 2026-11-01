.class Lcom/hz/game/be/sns/DHFacebook$21;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->onGetMyInfoSucceed(Lcom/hz/game/be/sns/FBUser;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$user:Lcom/hz/game/be/sns/FBUser;


# direct methods
.method constructor <init>(Lcom/hz/game/be/sns/FBUser;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$21;->val$user:Lcom/hz/game/be/sns/FBUser;

    .line 476
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lcom/hz/game/be/sns/DHFacebook$21;->val$user:Lcom/hz/game/be/sns/FBUser;

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->nOnGetMyInfoSucceed(Lcom/hz/game/be/sns/FBUser;)V

    .line 480
    return-void
.end method
