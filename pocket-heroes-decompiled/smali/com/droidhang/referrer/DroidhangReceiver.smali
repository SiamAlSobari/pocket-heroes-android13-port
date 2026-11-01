.class public Lcom/droidhang/referrer/DroidhangReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DroidhangReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static isStringEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 13
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 18
    new-instance v1, Lcom/sponsorpay/advertiser/InstallReferrerReceiver;

    invoke-direct {v1}, Lcom/sponsorpay/advertiser/InstallReferrerReceiver;-><init>()V

    .line 19
    .local v1, "spInstallReferrerReceiver":Lcom/sponsorpay/advertiser/InstallReferrerReceiver;
    invoke-virtual {v1, p1, p2}, Lcom/sponsorpay/advertiser/InstallReferrerReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 21
    const-string v2, "be"

    const-string v3, "DroidhangReceiver"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    const-string v2, "referrer"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "referrer":Ljava/lang/String;
    invoke-static {v0}, Lcom/droidhang/referrer/DroidhangReceiver;->isStringEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 26
    invoke-static {v0}, Lcom/droidhang/crosspromotion/InstallReferrerStatistic;->install(Ljava/lang/String;)V

    .line 28
    :cond_0
    return-void
.end method
