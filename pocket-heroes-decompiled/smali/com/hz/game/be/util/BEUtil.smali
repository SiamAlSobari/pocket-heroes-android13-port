.class public Lcom/hz/game/be/util/BEUtil;
.super Ljava/lang/Object;
.source "BEUtil.java"


# static fields
.field private static final APP_DIR:Ljava/lang/String; = "com.hz.game.be"

.field private static _gameActivity:Lcom/droidhang/ph/GameActivity;

.field private static _glSurfaceView:Landroid/opengl/GLSurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    sput-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    .line 37
    sput-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(I)V
    .locals 0

    .prologue
    .line 24
    invoke-static {p0}, Lcom/hz/game/be/util/BEUtil;->nSelectLanguage(I)V

    return-void
.end method

.method static synthetic access$1()Lcom/droidhang/ph/GameActivity;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    return-object v0
.end method

.method static synthetic access$2(I)V
    .locals 0

    .prologue
    .line 25
    invoke-static {p0}, Lcom/hz/game/be/util/BEUtil;->nAddCoins(I)V

    return-void
.end method

.method public static addCoins(ILandroid/opengl/GLSurfaceView;)V
    .locals 2
    .param p0, "amount"    # I
    .param p1, "glSurfaceView"    # Landroid/opengl/GLSurfaceView;

    .prologue
    .line 130
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-nez v0, :cond_0

    .line 131
    sput-object p1, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 133
    :cond_0
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$7;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$7;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 139
    return-void
.end method

.method public static backupRecords()I
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SdCardPath"
        }
    .end annotation

    .prologue
    .line 272
    invoke-static {}, Lcom/wwcd/util/AndroidUtil;->hasSDCard()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 273
    invoke-static {}, Lcom/wwcd/util/AndroidUtil;->getSDCardPath()Ljava/lang/String;

    move-result-object v3

    .line 275
    .local v3, "sdcardPath":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "com.hz.game.be"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "rootPath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/wwcd/util/IOUtil;->makeDirs(Ljava/io/File;)V

    .line 277
    new-instance v4, Ljava/io/File;

    const-string v5, "/data/data/com.hz.game.be/shared_prefs/Cocos2dxPrefsFile.xml"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 278
    .local v4, "srcFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 279
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "Cocos2dxPrefsFile.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "dstFile":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v5}, Lcom/wwcd/util/IOUtil;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 290
    const/4 v5, 0x0

    .line 293
    .end local v0    # "dstFile":Ljava/lang/String;
    .end local v2    # "rootPath":Ljava/lang/String;
    .end local v4    # "srcFile":Ljava/io/File;
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    return v5

    .line 282
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "rootPath":Ljava/lang/String;
    .restart local v4    # "srcFile":Ljava/io/File;
    :cond_0
    const-string v5, "be"

    const-string v6, "Records not exist"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    const/4 v5, -0x3

    goto :goto_0

    .line 285
    .end local v2    # "rootPath":Ljava/lang/String;
    .end local v4    # "srcFile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 286
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v5, "be"

    const-string v6, "backupRecords Exception"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 288
    const/4 v5, -0x2

    goto :goto_0

    .line 292
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "sdcardPath":Ljava/lang/String;
    :cond_1
    const-string v5, "be"

    const-string v6, "backupRecords failed, not has SDCard"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    const/4 v5, -0x1

    goto :goto_0
.end method

.method public static changeLanguage(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 46
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$1;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$1;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 52
    return-void
.end method

.method public static completedVideo()V
    .locals 2

    .prologue
    .line 320
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$16;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$16;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 326
    return-void
.end method

.method private static getFBIntent()Landroid/content/Intent;
    .locals 4

    .prologue
    .line 298
    :try_start_0
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v1}, Lcom/droidhang/ph/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "com.facebook.katana"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 299
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "fb://page/1550382958509086"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-object v1

    .line 300
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 301
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "https://www.facebook.com/PocketHeroesMobile"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method public static hideToolbar()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v3, 0x13

    const/16 v2, 0xe

    .line 235
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    if-nez v1, :cond_1

    .line 252
    .local v0, "SDK_INT":I
    :cond_0
    :goto_0
    return-void

    .line 239
    .end local v0    # "SDK_INT":I
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 240
    .restart local v0    # "SDK_INT":I
    const/16 v1, 0xb

    if-lt v0, v1, :cond_2

    if-ge v0, v2, :cond_2

    .line 242
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v1}, Lcom/droidhang/ph/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 244
    :cond_2
    if-lt v0, v2, :cond_3

    if-ge v0, v3, :cond_3

    .line 246
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v1}, Lcom/droidhang/ph/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 248
    :cond_3
    if-lt v0, v3, :cond_0

    .line 250
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->setImmersiveSticky()V

    goto :goto_0
.end method

.method public static incrementAchievement(II)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "value"    # I

    .prologue
    .line 203
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$13;

    invoke-direct {v1, p0, p1}, Lcom/hz/game/be/util/BEUtil$13;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 209
    return-void
.end method

.method public static init(Lcom/droidhang/ph/GameActivity;Landroid/opengl/GLSurfaceView;)V
    .locals 2
    .param p0, "gameActivity"    # Lcom/droidhang/ph/GameActivity;
    .param p1, "glSurfaceView"    # Landroid/opengl/GLSurfaceView;

    .prologue
    .line 40
    const-string v0, "cd"

    const-string v1, "init"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    sput-object p0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    .line 42
    sput-object p1, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 43
    return-void
.end method

.method public static isGoogleSignIn()I
    .locals 1

    .prologue
    .line 221
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v0}, Lcom/droidhang/ph/GameActivity;->isGoogleSignin()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isVideoAdAvailable()I
    .locals 1

    .prologue
    .line 311
    invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->isAdReady()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static loadPlayerCenteredScores(Ljava/lang/String;)V
    .locals 2
    .param p0, "levelName"    # Ljava/lang/String;

    .prologue
    .line 145
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$8;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 151
    return-void
.end method

.method private static native nAddCoins(I)V
.end method

.method public static native nCompletedVideo()V
.end method

.method public static native nOnRated()V
.end method

.method public static native nOnWindowFocusChanged(I)V
.end method

.method public static native nPostDHNotificationLevelRank(I)V
.end method

.method public static native nPostGoogleSignInMsg()V
.end method

.method public static native nPostGoogleSignOutMsg()V
.end method

.method private static native nSelectLanguage(I)V
.end method

.method public static native nVP(Ljava/lang/String;)I
.end method

.method public static onExit()V
    .locals 1

    .prologue
    .line 266
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v0}, Lcom/droidhang/ph/GameActivity;->finish()V

    .line 268
    return-void
.end method

.method public static onRated()V
    .locals 2

    .prologue
    .line 73
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$4;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$4;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 79
    return-void
.end method

.method public static onWindowFocusChanged(ILandroid/opengl/GLSurfaceView;)V
    .locals 2
    .param p0, "value"    # I
    .param p1, "glSurfaceView"    # Landroid/opengl/GLSurfaceView;

    .prologue
    .line 173
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-nez v0, :cond_0

    .line 174
    sput-object p1, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 176
    :cond_0
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$10;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$10;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 182
    return-void
.end method

.method public static openDHOfferWall()V
    .locals 0

    .prologue
    .line 142
    return-void
.end method

.method public static openFB()V
    .locals 2

    .prologue
    .line 306
    invoke-static {}, Lcom/hz/game/be/util/BEUtil;->getFBIntent()Landroid/content/Intent;

    move-result-object v0

    .line 307
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v1, v0}, Lcom/droidhang/ph/GameActivity;->startActivity(Landroid/content/Intent;)V

    .line 308
    return-void
.end method

.method public static openOfferWall()V
    .locals 2

    .prologue
    .line 154
    const-string v0, "be"

    const-string v1, "openOfferWall"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 156
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnect;->showOffers()V

    .line 160
    :goto_0
    return-void

    .line 158
    :cond_0
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const-string v1, "Tapjoy init error"

    invoke-static {v0, v1}, Lcom/wwcd/util/ToastUtil;->alertShort(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static playVideoAd()V
    .locals 3

    .prologue
    .line 315
    const-string v0, "be"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "isCachedAdAvailable="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->isAdReady()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->playAd()V

    .line 317
    return-void
.end method

.method public static postDHNotificationLevelRank(I)V
    .locals 2
    .param p0, "rank"    # I

    .prologue
    .line 82
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$5;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$5;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 88
    return-void
.end method

.method public static postGoogleSignInMsg()V
    .locals 2

    .prologue
    .line 55
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$2;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 61
    return-void
.end method

.method public static postGoogleSignOutMsg()V
    .locals 2

    .prologue
    .line 64
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$3;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 70
    return-void
.end method

.method public static selectLanguage(I)V
    .locals 6
    .param p0, "defaultIndex"    # I

    .prologue
    const/4 v3, 0x5

    const/4 v2, 0x1

    .line 102
    if-ne p0, v3, :cond_0

    move v0, v2

    .line 104
    .local v0, "dindex":I
    :goto_0
    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 105
    sget-object v4, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const v5, 0x7f040059

    invoke-virtual {v4, v5}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 106
    sget-object v3, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const v4, 0x7f04005e

    invoke-virtual {v3, v4}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    .line 107
    sget-object v3, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const v4, 0x7f04005c

    invoke-virtual {v3, v4}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    .line 108
    sget-object v3, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const v4, 0x7f04005f

    invoke-virtual {v3, v4}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    .line 109
    sget-object v3, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    const v4, 0x7f04005a

    invoke-virtual {v3, v4}, Lcom/droidhang/ph/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 113
    .local v1, "options":[Ljava/lang/String;
    sget-object v2, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v3, Lcom/hz/game/be/util/BEUtil$6;

    invoke-direct {v3, v1, v0}, Lcom/hz/game/be/util/BEUtil$6;-><init>([Ljava/lang/String;I)V

    invoke-virtual {v2, v3}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 127
    return-void

    .end local v0    # "dindex":I
    .end local v1    # "options":[Ljava/lang/String;
    :cond_0
    move v0, p0

    .line 102
    goto :goto_0
.end method

.method private static setImmersiveSticky()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 256
    sget-object v1, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    invoke-virtual {v1}, Lcom/droidhang/ph/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 257
    .local v0, "decorView":Landroid/view/View;
    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 263
    return-void
.end method

.method public static showAchievement()V
    .locals 2

    .prologue
    .line 185
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$11;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$11;-><init>()V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 191
    return-void
.end method

.method public static showLeaderboard(Ljava/lang/String;)V
    .locals 2
    .param p0, "levelName"    # Ljava/lang/String;

    .prologue
    .line 212
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$14;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$14;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 218
    return-void
.end method

.method public static signInGoogle()V
    .locals 2

    .prologue
    .line 164
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$9;

    invoke-direct {v1}, Lcom/hz/game/be/util/BEUtil$9;-><init>()V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 170
    return-void
.end method

.method public static submitScoreImmediateToLeaderboard(Ljava/lang/String;I)V
    .locals 2
    .param p0, "levelName"    # Ljava/lang/String;
    .param p1, "score"    # I

    .prologue
    .line 225
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$15;

    invoke-direct {v1, p0, p1}, Lcom/hz/game/be/util/BEUtil$15;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 231
    return-void
.end method

.method public static unlockAchievement(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 194
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_gameActivity:Lcom/droidhang/ph/GameActivity;

    new-instance v1, Lcom/hz/game/be/util/BEUtil$12;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$12;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/droidhang/ph/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 200
    return-void
.end method
