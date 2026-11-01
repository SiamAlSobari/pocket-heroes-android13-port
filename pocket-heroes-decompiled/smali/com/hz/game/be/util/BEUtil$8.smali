.class Lcom/hz/game/be/util/BEUtil$8;
.super Ljava/lang/Object;
.source "BEUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/util/BEUtil;->loadPlayerCenteredScores(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$levelName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/util/BEUtil$8;->val$levelName:Ljava/lang/String;

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 148
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->access$1()Lcom/droidhang/ph/GameActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/hz/game/be/util/BEUtil$8;->val$levelName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->loadPlayerCenteredScores(Ljava/lang/String;)V

    .line 149
    return-void
.end method
