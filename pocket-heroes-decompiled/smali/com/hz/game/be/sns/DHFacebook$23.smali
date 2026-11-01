.class Lcom/hz/game/be/sns/DHFacebook$23;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->onGetFriendsInfoSucceed(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$users:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$23;->val$users:Ljava/util/List;

    .line 495
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 498
    iget-object v0, p0, Lcom/hz/game/be/sns/DHFacebook$23;->val$users:Ljava/util/List;

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->nOnGetFriendsInfoSucceed(Ljava/util/List;)V

    .line 499
    return-void
.end method
