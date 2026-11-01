.class public Lcom/droidhang/ph/GameActivity;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "GameActivity.java"

# interfaces
.implements Lcom/tapjoy/TapjoyNotifier;
.implements Lcom/tapjoy/TapjoySpendPointsNotifier;
.implements Lcom/droidhang/game/ad/IAdId;
.implements Lcom/droidhang/game/ad/video/VideoAdCallback;


# static fields
.field private static final KEY:Ljava/lang/String; = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArD7nH0mqESEqosASz4UIMB2BVhnBJoijt/3dj0lWnQC64VtRCnMkaBEtMDvD8cF6cHgoADob5YFwamqkavsD99puoQjoia6YE0nQCCCFOKc/2mh32wMTVICOKqWpIz0OrHWca+I+jwuWNerzxczRdEB/9dfmHQt4BqANb9MoTa6jaTzLV3fz+52mynVQ386fDD/tTDEnqed6uucaamVklFsloITJypN/BrueJqv4yy5+ng2Bz6vIPsehh7TUgeg2tfm0aQ9CUqOVqFkBI/Z/Oz/IL8VTvAkSvtdkUVFYe+P6MZQ7J5p6iSqXwowlVQX5CP3EIL4c7Zn4lQWORMtxtwIDAQAB"

.field public static STATIC_REF:Landroid/content/Context;

.field public static _nameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final REQUEST_ACHIEVEMENTS:I

.field final REQUEST_IAP:I

.field final REQUEST_LEADERBOARD:I

.field private _achievementIds:[I

.field private _spendTapPoint:I

.field private _uid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 75
    const/4 v0, 0x0

    sput-object v0, Lcom/droidhang/ph/GameActivity;->STATIC_REF:Landroid/content/Context;

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    .line 86
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "1-10"

    const v2, 0x7f040047

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "2-10"

    const v2, 0x7f040048

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "3-10"

    const v2, 0x7f040049

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "4-10"

    const v2, 0x7f04004a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "5-10"

    const v2, 0x7f04004b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "6-10"

    const v2, 0x7f04004c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "7-5"

    const v2, 0x7f04004d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    const-string v1, "7-10"

    const v2, 0x7f04004e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v0, "game"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput v0, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    .line 76
    const/16 v0, 0x1389

    iput v0, p0, Lcom/droidhang/ph/GameActivity;->REQUEST_LEADERBOARD:I

    .line 77
    const/16 v0, 0x138a

    iput v0, p0, Lcom/droidhang/ph/GameActivity;->REQUEST_ACHIEVEMENTS:I

    .line 80
    const/16 v0, 0x7db

    iput v0, p0, Lcom/droidhang/ph/GameActivity;->REQUEST_IAP:I

    .line 82
    const-string v0, "100000000"

    iput-object v0, p0, Lcom/droidhang/ph/GameActivity;->_uid:Ljava/lang/String;

    .line 96
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 106
    iput-object v0, p0, Lcom/droidhang/ph/GameActivity;->_achievementIds:[I

    .line 72
    return-void

    .line 96
    :array_0
    .array-data 4
        0x7f04004f
        0x7f040050
        0x7f040051
        0x7f040052
        0x7f040053
        0x7f040054
        0x7f040055
        0x7f040056
        0x7f040057
        0x7f040058
    .end array-data
.end method

.method static synthetic access$0(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 446
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->loadCurrentPlayerLeaderboardScore(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 342
    invoke-direct {p0, p1, p2}, Lcom/droidhang/ph/GameActivity;->submitScoreToLeaderboard(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$2(Lcom/droidhang/ph/GameActivity;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V
    .locals 0

    .prologue
    .line 416
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->loadMoreScores(Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V

    return-void
.end method

.method private getAchievementId(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 110
    iget-object v0, p0, Lcom/droidhang/ph/GameActivity;->_achievementIds:[I

    aget v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 152
    sget-object v0, Lcom/droidhang/ph/GameActivity;->STATIC_REF:Landroid/content/Context;

    return-object v0
.end method

.method private getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "levelName"    # Ljava/lang/String;

    .prologue
    .line 294
    sget-object v1, Lcom/droidhang/ph/GameActivity;->_nameMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 295
    .local v0, "id":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 296
    const/4 v1, 0x0

    .line 298
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private loadCurrentPlayerLeaderboardScore(Ljava/lang/String;)V
    .locals 5
    .param p1, "levelName"    # Ljava/lang/String;

    .prologue
    .line 447
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 448
    .local v0, "lid":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 449
    const-string v1, "be"

    const-string v2, "id=null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    :goto_0
    return-void

    .line 453
    :cond_0
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    .line 454
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    .line 456
    const/4 v3, 0x2

    .line 457
    const/4 v4, 0x0

    .line 453
    invoke-interface {v1, v2, v0, v3, v4}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->loadCurrentPlayerLeaderboardScore(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;II)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v1

    .line 458
    new-instance v2, Lcom/droidhang/ph/GameActivity$4;

    invoke-direct {v2, p0}, Lcom/droidhang/ph/GameActivity$4;-><init>(Lcom/droidhang/ph/GameActivity;)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    goto :goto_0
.end method

.method private loadMoreScores(Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V
    .locals 4
    .param p1, "buffer"    # Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;

    .prologue
    .line 417
    sget-object v0, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    const/16 v2, 0x19

    const/4 v3, 0x1

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->loadMoreScores(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;II)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 418
    new-instance v1, Lcom/droidhang/ph/GameActivity$3;

    invoke-direct {v1, p0}, Lcom/droidhang/ph/GameActivity$3;-><init>(Lcom/droidhang/ph/GameActivity;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    .line 444
    return-void
.end method

.method private submitScoreToLeaderboard(Ljava/lang/String;I)V
    .locals 6
    .param p1, "levelName"    # Ljava/lang/String;
    .param p2, "score"    # I

    .prologue
    .line 343
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 344
    .local v0, "lid":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 345
    const-string v1, "be"

    const-string v2, "id=null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    :goto_0
    return-void

    .line 349
    :cond_0
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    int-to-long v4, p2

    invoke-interface {v1, v2, v0, v4, v5}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->submitScore(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;J)V

    goto :goto_0
.end method


# virtual methods
.method public adLoaded()V
    .locals 0

    .prologue
    .line 490
    return-void
.end method

.method public getAdmobBannerAdid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 521
    const-string v0, "ca-app-pub-6247246961848012/1905315689"

    return-object v0
.end method

.method public getAdmobInterstitialAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 501
    const-string v0, "ca-app-pub-6751988454642532/9245691806"

    return-object v0
.end method

.method public getInMobiInterstitialAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 506
    const-string v0, "7b54627f5345429380d4e166d7336319"

    return-object v0
.end method

.method public getInmobiVideoAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    const-string v0, "7b54627f5345429380d4e166d7336319"

    return-object v0
.end method

.method public getSpendPointsResponse(Ljava/lang/String;I)V
    .locals 3
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 249
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getSpendPointsResponse, pointTotal: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget v0, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    if-lez v0, :cond_0

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Got "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " coins!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/wwcd/util/ToastUtil;->alertShort(Landroid/app/Activity;Ljava/lang/String;)V

    .line 252
    iget v0, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-static {v0, v1}, Lcom/hz/game/be/util/BEUtil;->addCoins(ILandroid/opengl/GLSurfaceView;)V

    .line 253
    const-string v0, "be"

    const-string v1, "getSpendPointsResponse bbb"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    .line 256
    return-void
.end method

.method public getSpendPointsResponseFailed(Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/String;

    .prologue
    .line 261
    return-void
.end method

.method public getUpdatePoints(Ljava/lang/String;I)V
    .locals 3
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 265
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getUpdatePoints, pointTotal: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    if-lez p2, :cond_0

    .line 267
    iput p2, p0, Lcom/droidhang/ph/GameActivity;->_spendTapPoint:I

    .line 269
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p2, p0}, Lcom/tapjoy/TapjoyConnect;->spendTapPoints(ILcom/tapjoy/TapjoySpendPointsNotifier;)V

    .line 271
    :cond_0
    return-void
.end method

.method public getUpdatePointsFailed(Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/String;

    .prologue
    .line 276
    return-void
.end method

.method public getVungleVideoAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 516
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public incrementAchievement(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 313
    :goto_0
    return-void

    .line 312
    :cond_0
    sget-object v0, Lcom/google/android/gms/games/Games;->Achievements:Lcom/google/android/gms/games/achievement/Achievements;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getAchievementId(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p2}, Lcom/google/android/gms/games/achievement/Achievements;->increment(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public isGoogleSignin()Z
    .locals 1

    .prologue
    .line 484
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v0

    return v0
.end method

.method public loadPlayerCenteredScores(Ljava/lang/String;)V
    .locals 7
    .param p1, "levelName"    # Ljava/lang/String;

    .prologue
    .line 382
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 383
    .local v2, "lid":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 384
    const-string v0, "be"

    const-string v1, "id=null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    :goto_0
    return-void

    .line 388
    :cond_0
    sget-object v0, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    .line 389
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    .line 391
    const/4 v3, 0x2

    .line 392
    const/4 v4, 0x0

    .line 393
    const/16 v5, 0x19

    const/4 v6, 0x1

    .line 388
    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->loadPlayerCenteredScores(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;IIIZ)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    .line 393
    new-instance v1, Lcom/droidhang/ph/GameActivity$2;

    invoke-direct {v1, p0}, Lcom/droidhang/ph/GameActivity$2;-><init>(Lcom/droidhang/ph/GameActivity;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 157
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onActivityResult, requestCode="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",resultCode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    const/16 v0, 0x7db

    if-ne p1, v0, :cond_1

    .line 159
    invoke-static {}, Lcom/droidhang/pay/DHGooglePaymentManager;->getInstance()Lcom/droidhang/pay/DHGooglePaymentManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/droidhang/pay/DHGooglePaymentManager;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 160
    invoke-super {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 176
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 167
    const v0, 0xface

    if-ne p1, v0, :cond_2

    .line 168
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    goto :goto_0

    .line 169
    :cond_2
    const/16 v0, 0x1389

    if-eq p1, v0, :cond_3

    const/16 v0, 0x138a

    if-ne p1, v0, :cond_0

    .line 170
    :cond_3
    const/16 v0, 0x2711

    if-ne p2, v0, :cond_0

    .line 171
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->signOut()V

    .line 172
    const-string v0, "be"

    const-string v1, "postGoogleSignOutMsg"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->postGoogleSignOutMsg()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 115
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 116
    sput-object p0, Lcom/droidhang/ph/GameActivity;->STATIC_REF:Landroid/content/Context;

    .line 117
    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-static {p0, v1}, Lcom/hz/game/be/util/BEUtil;->init(Lcom/droidhang/ph/GameActivity;Landroid/opengl/GLSurfaceView;)V

    .line 118
    invoke-static {p0}, Lcom/droidhang/featured/FeaturedGameUtil;->init(Landroid/app/Activity;)V

    .line 119
    # invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->noop_updateOnlineConfig(Landroid/content/Context;)V

    .line 121
    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-static {p0, v1}, Lcom/hz/game/be/sns/DHFacebook;->setActivity(Landroid/app/Activity;Landroid/opengl/GLSurfaceView;)V

    .line 124
    const-string v1, "com.hz.game.be"

    # invoke-static {p0, v1}, Lcom/hz/game/be/sns/DHFacebook;->noop_printKeyHash(Landroid/app/Activity;Ljava/lang/String;)V

    .line 126
    const-string v1, "03cbe54e-06f9-4074-8ed2-f01b483ec76a"

    const-string v2, "utVu8jSLcFrCVYIEMipT"

    # invoke-static {p0, v1, v2}, Lcom/tapjoy/TapjoyConnect;->noop_requestTapjoyConnect(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 128
    const-string v1, "be"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "locale="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/wwcd/util/AndroidUtil;->getLocale(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    const-string v1, "dhuid"

    const-string v2, ""

    invoke-static {p0, v1, v2}, Lcom/wwcd/util/preference/DefaultPreferenceUtil;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "uid":Ljava/lang/String;
    invoke-static {v0}, Lcom/wwcd/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    const v3, 0x186a0

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    const-string v1, "dhuid"

    invoke-static {p0, v1, v0}, Lcom/wwcd/util/preference/DefaultPreferenceUtil;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_0
    const-string v1, "be"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "dhuid="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    # invoke-static {p0, p0, p0}, Lcom/droidhang/game/DHGames;->noop_init(Landroid/app/Activity;Lcom/droidhang/game/ad/IAdId;Lcom/droidhang/game/ad/video/VideoAdCallback;)V

    .line 141
    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->_featureLayout:Landroid/widget/FrameLayout;

    # invoke-static {p0, v1}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->noop_init(Landroid/app/Activity;Landroid/widget/FrameLayout;)V

    .line 142
    invoke-static {}, Lcom/droidhang/pay/DHGooglePaymentManager;->getInstance()Lcom/droidhang/pay/DHGooglePaymentManager;

    move-result-object v1

    const-string v2, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArD7nH0mqESEqosASz4UIMB2BVhnBJoijt/3dj0lWnQC64VtRCnMkaBEtMDvD8cF6cHgoADob5YFwamqkavsD99puoQjoia6YE0nQCCCFOKc/2mh32wMTVICOKqWpIz0OrHWca+I+jwuWNerzxczRdEB/9dfmHQt4BqANb9MoTa6jaTzLV3fz+52mynVQ386fDD/tTDEnqed6uucaamVklFsloITJypN/BrueJqv4yy5+ng2Bz6vIPsehh7TUgeg2tfm0aQ9CUqOVqFkBI/Z/Oz/IL8VTvAkSvtdkUVFYe+P6MZQ7J5p6iSqXwowlVQX5CP3EIL4c7Zn4lQWORMtxtwIDAQAB"

    const/16 v3, 0x7db

    iget-object v4, p0, Lcom/droidhang/ph/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v1, v2, v3, p0, v4}, Lcom/droidhang/pay/DHGooglePaymentManager;->init(Ljava/lang/String;ILandroid/app/Activity;Landroid/opengl/GLSurfaceView;)V

    .line 144
    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->_admobLayout:Landroid/widget/RelativeLayout;

    # invoke-static {p0, v1}, Lcom/hz/game/be/util/AdMgr;->noop_init(Landroid/app/Activity;Landroid/widget/RelativeLayout;)V

    .line 145
    # invoke-static {p0, v5, v5}, Lcom/hz/game/be/util/AdMgr;->noop_enable(Landroid/app/Activity;II)V

    .line 149
    return-void
.end method

.method public onCreateView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 7

    .prologue
    const/4 v1, 0x5

    .line 186
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 188
    .local v0, "glSurfaceView":Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    const/4 v2, 0x6

    const/4 v4, 0x0

    const/16 v5, 0x10

    const/16 v6, 0x8

    move v3, v1

    invoke-virtual/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 190
    return-object v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 180
    invoke-static {}, Lcom/droidhang/pay/DHGooglePaymentManager;->getInstance()Lcom/droidhang/pay/DHGooglePaymentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/droidhang/pay/DHGooglePaymentManager;->destroy()V

    .line 181
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onDestroy()V

    .line 182
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 232
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onPause()V

    .line 233
    # invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->noop_onPause()V

    .line 234
    const-string v0, "be"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 236
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    # invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnect;->noop_appPause()V

    .line 239
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 210
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onResume()V

    .line 211
    # invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->noop_onResume()V

    .line 212
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 213
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v1

    # invoke-virtual {v1, p0}, Lcom/tapjoy/TapjoyConnect;->noop_getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V

    .line 214
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v1

    # invoke-virtual {v1}, Lcom/tapjoy/TapjoyConnect;->noop_appResume()V

    .line 217
    :cond_0
    const-string v1, "be"

    const-string v2, "onResume"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :try_start_0
    const-string v1, "7dd88457abf2732cd6eb9e4e740eb23b"

    const/4 v2, 0x0

    const-string v3, ""

    # invoke-static {v1, v2, v3, p0}, Lcom/sponsorpay/SponsorPay;->noop_start(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :goto_0
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->onRated()V

    .line 228
    return-void

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/Throwable;
    const-string v1, "be"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onSignInFailed()V
    .locals 2

    .prologue
    .line 280
    const-string v0, "be"

    const-string v1, "onSignInFailed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    return-void
.end method

.method public onSignInSucceeded()V
    .locals 2

    .prologue
    .line 285
    const-string v0, "be"

    const-string v1, "onSignInSucceeded"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->postGoogleSignInMsg()V

    .line 287
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 243
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStop()V

    .line 244
    const-string v0, "be"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 200
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onWindowFocusChanged(Z)V

    .line 201
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onWindowFocusChanged,hasFocus="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    if-eqz p1, :cond_0

    .line 203
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->hideToolbar()V

    .line 205
    :cond_0
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    iget-object v1, p0, Lcom/droidhang/ph/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-static {v0, v1}, Lcom/hz/game/be/util/BEUtil;->onWindowFocusChanged(ILandroid/opengl/GLSurfaceView;)V

    .line 206
    return-void

    .line 205
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public showAchievement()V
    .locals 2

    .prologue
    .line 316
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 317
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->signInGoogle()V

    .line 321
    :goto_0
    return-void

    .line 320
    :cond_0
    sget-object v0, Lcom/google/android/gms/games/Games;->Achievements:Lcom/google/android/gms/games/achievement/Achievements;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/games/achievement/Achievements;->getAchievementsIntent(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x138a

    invoke-virtual {p0, v0, v1}, Lcom/droidhang/ph/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method public showLeaderboard(Ljava/lang/String;)V
    .locals 4
    .param p1, "levelName"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x1389

    .line 324
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v1

    if-nez v1, :cond_1

    .line 325
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->signInGoogle()V

    .line 340
    :cond_0
    :goto_0
    return-void

    .line 329
    :cond_1
    const-string v1, "all"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 330
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->getAllLeaderboardsIntent(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/droidhang/ph/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 333
    :cond_2
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, "lid":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 338
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->getLeaderboardIntent(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/droidhang/ph/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method public signInGoogle()V
    .locals 0

    .prologue
    .line 290
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->beginUserInitiatedSignIn()V

    .line 291
    return-void
.end method

.method public submitScoreImmediateToLeaderboard(Ljava/lang/String;I)V
    .locals 6
    .param p1, "levelName"    # Ljava/lang/String;
    .param p2, "score"    # I

    .prologue
    .line 353
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v1

    if-nez v1, :cond_0

    .line 378
    :goto_0
    return-void

    .line 356
    :cond_0
    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getLeaderboardId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "lid":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 358
    const-string v1, "be"

    const-string v2, "id=null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 362
    :cond_1
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v2

    .line 363
    int-to-long v4, p2

    .line 362
    invoke-interface {v1, v2, v0, v4, v5}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->submitScoreImmediate(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;J)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v1

    .line 363
    new-instance v2, Lcom/droidhang/ph/GameActivity$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/droidhang/ph/GameActivity$1;-><init>(Lcom/droidhang/ph/GameActivity;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/common/api/PendingResult;->setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V

    goto :goto_0
.end method

.method public unlockAchievement(I)V
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 302
    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->isSignedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 306
    :goto_0
    return-void

    .line 305
    :cond_0
    sget-object v0, Lcom/google/android/gms/games/Games;->Achievements:Lcom/google/android/gms/games/achievement/Achievements;

    invoke-virtual {p0}, Lcom/droidhang/ph/GameActivity;->getApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/droidhang/ph/GameActivity;->getAchievementId(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/games/achievement/Achievements;->unlock(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public watchComplete(I)V
    .locals 0
    .param p1, "statusCode"    # I

    .prologue
    .line 494
    if-nez p1, :cond_0

    .line 495
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->completedVideo()V

    .line 497
    :cond_0
    return-void
.end method
