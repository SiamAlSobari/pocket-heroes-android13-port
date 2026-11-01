.class Lcom/hz/game/be/util/BEUtil$5;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->postDHNotificationLevelRank(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$rank:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/hz/game/be/util/BEUtil$5;->val$rank:I

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lcom/hz/game/be/util/BEUtil$5;->val$rank:I

    invoke-static {v0}, Lcom/hz/game/be/util/BEUtil;->nPostDHNotificationLevelRank(I)V

    .line 86
    return-void
.end method
