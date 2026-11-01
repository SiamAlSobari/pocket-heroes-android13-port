.class Lcom/hz/game/be/sns/DHFacebook$35;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestsSucceed(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$reqId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$35;->val$reqId:Ljava/lang/String;

    .line 605
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lcom/hz/game/be/sns/DHFacebook$35;->val$reqId:Ljava/lang/String;

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->nOnDeleteRequestsSucceed(Ljava/lang/String;)V

    .line 609
    return-void
.end method
