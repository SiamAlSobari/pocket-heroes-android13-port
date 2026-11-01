.class public Lcom/droidhang/featured/FeaturedGameUtil;
.super Ljava/lang/Object;
.source "FeaturedGameUtil.java"


# static fields
.field private static _ctx:Landroid/app/Activity;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/droidhang/featured/FeaturedGameUtil;->_ctx:Landroid/app/Activity;

    return-object v0
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 0
    .param p0, "ctx"    # Landroid/app/Activity;

    .prologue
    .line 16
    sput-object p0, Lcom/droidhang/featured/FeaturedGameUtil;->_ctx:Landroid/app/Activity;

    .line 17
    return-void
.end method

.method public static isInstall(Ljava/lang/String;)I
    .locals 6
    .param p0, "appid"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 20
    sget-object v5, Lcom/droidhang/featured/FeaturedGameUtil;->_ctx:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 21
    .local v1, "manager":Landroid/content/pm/PackageManager;
    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    .line 22
    .local v3, "pkgList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-lt v0, v5, :cond_0

    .line 27
    :goto_1
    return v4

    .line 23
    :cond_0
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    .line 24
    .local v2, "pI":Landroid/content/pm/PackageInfo;
    iget-object v5, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 25
    const/4 v4, 0x1

    goto :goto_1

    .line 22
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static openGooglePlay(Ljava/lang/String;)V
    .locals 5
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 32
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "market://details?id="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 33
    .local v1, "goToMarket":Landroid/content/Intent;
    sget-object v2, Lcom/droidhang/featured/FeaturedGameUtil;->_ctx:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .end local v1    # "goToMarket":Landroid/content/Intent;
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/droidhang/featured/FeaturedGameUtil;->_ctx:Landroid/app/Activity;

    new-instance v3, Lcom/droidhang/featured/FeaturedGameUtil$1;

    invoke-direct {v3}, Lcom/droidhang/featured/FeaturedGameUtil$1;-><init>()V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
