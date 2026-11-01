.class Lcom/hz/game/be/util/BEUtil$13;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->incrementAchievement(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$index:I

.field private final synthetic val$value:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/hz/game/be/util/BEUtil$13;->val$index:I

    iput p2, p0, Lcom/hz/game/be/util/BEUtil$13;->val$value:I

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 206
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->access$1()Lcom/droidhang/ph/GameActivity;

    move-result-object v0

    iget v1, p0, Lcom/hz/game/be/util/BEUtil$13;->val$index:I

    iget v2, p0, Lcom/hz/game/be/util/BEUtil$13;->val$value:I

    invoke-virtual {v0, v1, v2}, Lcom/droidhang/ph/GameActivity;->incrementAchievement(II)V

    .line 207
    return-void
.end method
