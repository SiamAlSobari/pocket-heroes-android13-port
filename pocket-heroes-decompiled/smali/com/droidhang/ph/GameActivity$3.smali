.class Lcom/droidhang/ph/GameActivity$3;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/ph/GameActivity;->loadMoreScores(Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V
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
        "Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/droidhang/ph/GameActivity;


# direct methods
.method constructor <init>(Lcom/droidhang/ph/GameActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/droidhang/ph/GameActivity$3;->this$0:Lcom/droidhang/ph/GameActivity;

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;

    invoke-virtual {p0, p1}, Lcom/droidhang/ph/GameActivity$3;->onResult(Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;)V

    return-void
.end method

.method public onResult(Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;)V
    .locals 8
    .param p1, "result"    # Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;

    .prologue
    .line 422
    if-eqz p1, :cond_0

    .line 423
    const-string v4, "be"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "result.getStatus().getStatusCode()="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v4

    if-nez v4, :cond_0

    .line 425
    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/Leaderboards$LoadScoresResult;->getScores()Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;

    move-result-object v0

    .line 426
    .local v0, "buffer":Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;
    const/4 v1, 0x0

    .line 427
    .local v1, "has1":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->getCount()I

    move-result v4

    if-lt v2, v4, :cond_1

    .line 437
    if-nez v1, :cond_0

    .line 438
    iget-object v4, p0, Lcom/droidhang/ph/GameActivity$3;->this$0:Lcom/droidhang/ph/GameActivity;

    invoke-static {v4, v0}, Lcom/droidhang/ph/GameActivity;->access$2(Lcom/droidhang/ph/GameActivity;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V

    .line 442
    .end local v0    # "buffer":Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;
    .end local v1    # "has1":Z
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 428
    .restart local v0    # "buffer":Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;
    .restart local v1    # "has1":Z
    .restart local v2    # "i":I
    :cond_1
    invoke-virtual {v0, v2}, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->get(I)Lcom/google/android/gms/games/leaderboard/LeaderboardScore;

    move-result-object v3

    .line 429
    .local v3, "score":Lcom/google/android/gms/games/leaderboard/LeaderboardScore;
    const-string v4, "be"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "pre name="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lcom/google/android/gms/games/leaderboard/LeaderboardScore;->getScoreHolderDisplayName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    const-string v4, "be"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "pre rank="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lcom/google/android/gms/games/leaderboard/LeaderboardScore;->getDisplayRank()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    const-string v4, "be"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "pre score="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lcom/google/android/gms/games/leaderboard/LeaderboardScore;->getDisplayScore()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    const-string v4, "be"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "pre rawrank="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lcom/google/android/gms/games/leaderboard/LeaderboardScore;->getRank()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    invoke-interface {v3}, Lcom/google/android/gms/games/leaderboard/LeaderboardScore;->getRank()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 434
    const/4 v1, 0x1

    .line 427
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
