.class Lcom/hz/game/be/util/BEUtil$12;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->unlockAchievement(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$index:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/hz/game/be/util/BEUtil$12;->val$index:I

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 197
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->access$1()Lcom/droidhang/ph/GameActivity;

    move-result-object v0

    iget v1, p0, Lcom/hz/game/be/util/BEUtil$12;->val$index:I

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->unlockAchievement(I)V

    .line 198
    return-void
.end method
