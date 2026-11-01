.class Lcom/droidhang/ph/GameActivity$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/ph/GameActivity;->submitScoreImmediateToLeaderboard(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<",
        "Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/droidhang/ph/GameActivity;

.field private final synthetic val$levelName:Ljava/lang/String;

.field private final synthetic val$score:I


# direct methods
.method constructor <init>(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/droidhang/ph/GameActivity$1;->this$0:Lcom/droidhang/ph/GameActivity;

    iput-object p2, p0, Lcom/droidhang/ph/GameActivity$1;->val$levelName:Ljava/lang/String;

    iput p3, p0, Lcom/droidhang/ph/GameActivity$1;->val$score:I

    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;

    invoke-virtual {p0, p1}, Lcom/droidhang/ph/GameActivity$1;->onResult(Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;)V

    return-void
.end method

.method public onResult(Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;)V
    .locals 3
    .param p1, "result"    # Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;

    .prologue
    .line 367
    if-eqz p1, :cond_0

    .line 368
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "result.getStatus().getStatusCode()="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/Leaderboards$SubmitScoreResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    if-nez v0, :cond_1

    .line 370
    const-string v0, "be"

    const-string v1, "SubmitScore successful!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    iget-object v0, p0, Lcom/droidhang/ph/GameActivity$1;->this$0:Lcom/droidhang/ph/GameActivity;

    iget-object v1, p0, Lcom/droidhang/ph/GameActivity$1;->val$levelName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/droidhang/ph/GameActivity;->access$0(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;)V

    .line 376
    :cond_0
    :goto_0
    return-void

    .line 373
    :cond_1
    iget-object v0, p0, Lcom/droidhang/ph/GameActivity$1;->this$0:Lcom/droidhang/ph/GameActivity;

    iget-object v1, p0, Lcom/droidhang/ph/GameActivity$1;->val$levelName:Ljava/lang/String;

    iget v2, p0, Lcom/droidhang/ph/GameActivity$1;->val$score:I

    invoke-static {v0, v1, v2}, Lcom/droidhang/ph/GameActivity;->access$1(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;I)V

    goto :goto_0
.end method
