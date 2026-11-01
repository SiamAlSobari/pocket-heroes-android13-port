.class Lcom/hz/game/be/util/BEUtil$11;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->showAchievement()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 188
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->access$1()Lcom/droidhang/ph/GameActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/droidhang/ph/GameActivity;->showAchievement()V

    .line 189
    return-void
.end method
