.class Lcom/hz/game/be/util/BEUtil$15;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->submitScoreImmediateToLeaderboard(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$levelName:Ljava/lang/String;

.field private final synthetic val$score:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/util/BEUtil$15;->val$levelName:Ljava/lang/String;

    iput p2, p0, Lcom/hz/game/be/util/BEUtil$15;->val$score:I

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 228
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->access$1()Lcom/droidhang/ph/GameActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/hz/game/be/util/BEUtil$15;->val$levelName:Ljava/lang/String;

    iget v2, p0, Lcom/hz/game/be/util/BEUtil$15;->val$score:I

    invoke-virtual {v0, v1, v2}, Lcom/droidhang/ph/GameActivity;->submitScoreImmediateToLeaderboard(Ljava/lang/String;I)V

    .line 229
    return-void
.end method
