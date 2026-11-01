.class public Lcom/hz/game/be/sns/DHFacebook;
.super Ljava/lang/Object;
.source "DHFacebook.java"


# static fields
.field private static _activity:Landroid/app/Activity;

.field private static _glSurfaceView:Landroid/opengl/GLSurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 80
    sput-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    .line 81
    sput-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()V
    .locals 0

    .prologue
    .line 465
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onOpenSessionFail()V

    return-void
.end method

.method static synthetic access$1()V
    .locals 0

    .prologue
    .line 456
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onOpenSessionSucceed()V

    return-void
.end method

.method static synthetic access$10()V
    .locals 0

    .prologue
    .line 512
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onShareSucceed()V

    return-void
.end method

.method static synthetic access$11()V
    .locals 0

    .prologue
    .line 521
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onShareFail()V

    return-void
.end method

.method static synthetic access$12(Lcom/hz/game/be/sns/FBReqParam;)V
    .locals 0

    .prologue
    .line 268
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->sendRequest(Lcom/hz/game/be/sns/FBReqParam;)V

    return-void
.end method

.method static synthetic access$13()V
    .locals 0

    .prologue
    .line 530
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onSendRequestSucceed()V

    return-void
.end method

.method static synthetic access$14()V
    .locals 0

    .prologue
    .line 539
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onSendRequestFail()V

    return-void
.end method

.method static synthetic access$15()V
    .locals 0

    .prologue
    .line 307
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->receiveRequests2()V

    return-void
.end method

.method static synthetic access$16()V
    .locals 0

    .prologue
    .line 558
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestsFail()V

    return-void
.end method

.method static synthetic access$17(Ljava/util/List;)V
    .locals 0

    .prologue
    .line 549
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestsSucceed(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$18(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 351
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->receiveRequest2(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$19(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 577
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestFail(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2()V
    .locals 0

    .prologue
    .line 133
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->closeSessionAndClearToken2()V

    return-void
.end method

.method static synthetic access$20(Lcom/hz/game/be/sns/FBReq;)V
    .locals 0

    .prologue
    .line 568
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestSucceed(Lcom/hz/game/be/sns/FBReq;)V

    return-void
.end method

.method static synthetic access$21(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 390
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->deleteRequest2(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$22(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 595
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestFail(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$23(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 586
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestSucceed(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$24(Ljava/util/List;)V
    .locals 0

    .prologue
    .line 423
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->deleteRequests2(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$25(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 613
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestsFail(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$26(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 604
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestsSucceed(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3()V
    .locals 0

    .prologue
    .line 150
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->getMyInfo2()V

    return-void
.end method

.method static synthetic access$4()V
    .locals 0

    .prologue
    .line 484
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onGetMyInfoFail()V

    return-void
.end method

.method static synthetic access$5(Lcom/hz/game/be/sns/FBUser;)V
    .locals 0

    .prologue
    .line 475
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onGetMyInfoSucceed(Lcom/hz/game/be/sns/FBUser;)V

    return-void
.end method

.method static synthetic access$6()V
    .locals 0

    .prologue
    .line 187
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->getFriendsInfo2()V

    return-void
.end method

.method static synthetic access$7()V
    .locals 0

    .prologue
    .line 503
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onGetFriendsInfoFail()V

    return-void
.end method

.method static synthetic access$8(Ljava/util/List;)V
    .locals 0

    .prologue
    .line 494
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->onGetFriendsInfoSucceed(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$9(Lcom/hz/game/be/sns/FBShareParam;)V
    .locals 0

    .prologue
    .line 229
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->share(Lcom/hz/game/be/sns/FBShareParam;)V

    return-void
.end method

.method public static closeSessionAndClearToken()V
    .locals 2

    .prologue
    .line 125
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$2;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method private static closeSessionAndClearToken2()V
    .locals 2

    .prologue
    .line 134
    const-string v0, "DHFacebook"

    const-string v1, "closeSessionAndClearToken succeed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 136
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 137
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 139
    :cond_0
    return-void
.end method

.method public static deleteRequest(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 382
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$15;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$15;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 388
    return-void
.end method

.method private static deleteRequest2(Ljava/lang/String;)V
    .locals 5
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 391
    move-object v0, p0

    .line 392
    .local v0, "rid":Ljava/lang/String;
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 393
    .local v1, "session":Lcom/facebook/Session;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v2

    if-nez v2, :cond_1

    .line 394
    :cond_0
    const-string v2, "DHFacebook"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "deleteRequest ["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] fail: no valid session"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestFail(Ljava/lang/String;)V

    .line 412
    :goto_0
    return-void

    .line 399
    :cond_1
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    new-instance v3, Lcom/hz/game/be/sns/DHFacebook$16;

    invoke-direct {v3, v0}, Lcom/hz/game/be/sns/DHFacebook$16;-><init>(Ljava/lang/String;)V

    invoke-static {v2, p0, v3}, Lcom/facebook/Request;->newDeleteObjectRequest(Lcom/facebook/Session;Ljava/lang/String;Lcom/facebook/Request$Callback;)Lcom/facebook/Request;

    move-result-object v2

    .line 411
    invoke-virtual {v2}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_0
.end method

.method public static deleteRequests(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 415
    .local p0, "reqIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$17;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$17;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 421
    return-void
.end method

.method private static deleteRequests2(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 424
    .local p0, "reqIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v4

    .line 425
    .local v4, "session":Lcom/facebook/Session;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/facebook/Session;->isOpened()Z

    move-result v5

    if-nez v5, :cond_2

    .line 426
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 453
    :goto_1
    return-void

    .line 426
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 427
    .local v1, "reqId":Ljava/lang/String;
    move-object v3, v1

    .line 428
    .local v3, "rid":Ljava/lang/String;
    const-string v6, "DHFacebook"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "deleteRequests - the one ["

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "] fail: no valid session"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    invoke-static {v3}, Lcom/hz/game/be/sns/DHFacebook;->onDeleteRequestsFail(Ljava/lang/String;)V

    goto :goto_0

    .line 434
    .end local v1    # "reqId":Ljava/lang/String;
    .end local v3    # "rid":Ljava/lang/String;
    :cond_2
    new-instance v0, Lcom/facebook/RequestBatch;

    invoke-direct {v0}, Lcom/facebook/RequestBatch;-><init>()V

    .line 435
    .local v0, "batch":Lcom/facebook/RequestBatch;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 452
    invoke-virtual {v0}, Lcom/facebook/RequestBatch;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_1

    .line 435
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 436
    .restart local v1    # "reqId":Ljava/lang/String;
    move-object v3, v1

    .line 437
    .restart local v3    # "rid":Ljava/lang/String;
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v6

    new-instance v7, Lcom/hz/game/be/sns/DHFacebook$18;

    invoke-direct {v7, v3}, Lcom/hz/game/be/sns/DHFacebook$18;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v1, v7}, Lcom/facebook/Request;->newDeleteObjectRequest(Lcom/facebook/Session;Ljava/lang/String;Lcom/facebook/Request$Callback;)Lcom/facebook/Request;

    move-result-object v2

    .line 450
    .local v2, "request":Lcom/facebook/Request;
    invoke-virtual {v0, v2}, Lcom/facebook/RequestBatch;->add(Lcom/facebook/Request;)Z

    goto :goto_2
.end method

.method public static getFriendsInfo()V
    .locals 2

    .prologue
    .line 179
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$5;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$5;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 185
    return-void
.end method

.method private static getFriendsInfo2()V
    .locals 3

    .prologue
    .line 188
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 189
    .local v0, "session":Lcom/facebook/Session;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-nez v1, :cond_1

    .line 190
    :cond_0
    const-string v1, "DHFacebook"

    const-string v2, "getFriendsInfo fail : no valid session"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onGetFriendsInfoFail()V

    .line 217
    :goto_0
    return-void

    .line 195
    :cond_1
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    new-instance v2, Lcom/hz/game/be/sns/DHFacebook$6;

    invoke-direct {v2}, Lcom/hz/game/be/sns/DHFacebook$6;-><init>()V

    invoke-static {v1, v2}, Lcom/facebook/Request;->newMyFriendsRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserListCallback;)Lcom/facebook/Request;

    move-result-object v1

    .line 216
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_0
.end method

.method public static getMyInfo()V
    .locals 2

    .prologue
    .line 142
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$3;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 148
    return-void
.end method

.method private static getMyInfo2()V
    .locals 3

    .prologue
    .line 151
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 152
    .local v0, "session":Lcom/facebook/Session;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-nez v1, :cond_1

    .line 153
    :cond_0
    const-string v1, "DHFacebook"

    const-string v2, "getMyInfo fail : no valid session"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onGetMyInfoFail()V

    .line 176
    :goto_0
    return-void

    .line 158
    :cond_1
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    new-instance v2, Lcom/hz/game/be/sns/DHFacebook$4;

    invoke-direct {v2}, Lcom/hz/game/be/sns/DHFacebook$4;-><init>()V

    invoke-static {v1, v2}, Lcom/facebook/Request;->newMeRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserCallback;)Lcom/facebook/Request;

    move-result-object v1

    .line 175
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_0
.end method

.method public static native nOnDeleteRequestFail(Ljava/lang/String;)V
.end method

.method public static native nOnDeleteRequestSucceed(Ljava/lang/String;)V
.end method

.method public static native nOnDeleteRequestsFail(Ljava/lang/String;)V
.end method

.method public static native nOnDeleteRequestsSucceed(Ljava/lang/String;)V
.end method

.method public static native nOnGetFriendsInfoFail()V
.end method

.method public static native nOnGetFriendsInfoSucceed(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/hz/game/be/sns/FBUser;",
            ">;)V"
        }
    .end annotation
.end method

.method public static native nOnGetMyInfoFail()V
.end method

.method public static native nOnGetMyInfoSucceed(Lcom/hz/game/be/sns/FBUser;)V
.end method

.method public static native nOnOpenSessionFail()V
.end method

.method public static native nOnOpenSessionSucceed()V
.end method

.method public static native nOnReceiveRequestFail(Ljava/lang/String;)V
.end method

.method public static native nOnReceiveRequestSucceed(Lcom/hz/game/be/sns/FBReq;)V
.end method

.method public static native nOnReceiveRequestsFail()V
.end method

.method public static native nOnReceiveRequestsSucceed(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/hz/game/be/sns/FBReq;",
            ">;)V"
        }
    .end annotation
.end method

.method public static native nOnSendRequestFail()V
.end method

.method public static native nOnSendRequestSucceed()V
.end method

.method public static native nOnShareFail()V
.end method

.method public static native nOnShareSucceed()V
.end method

.method private static onDeleteRequestFail(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 596
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$34;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$34;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 602
    return-void
.end method

.method private static onDeleteRequestSucceed(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 587
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$33;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$33;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 593
    return-void
.end method

.method private static onDeleteRequestsFail(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 614
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$36;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$36;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 620
    return-void
.end method

.method private static onDeleteRequestsSucceed(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 605
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$35;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$35;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 611
    return-void
.end method

.method private static onGetFriendsInfoFail()V
    .locals 2

    .prologue
    .line 504
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$24;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$24;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 510
    return-void
.end method

.method private static onGetFriendsInfoSucceed(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/hz/game/be/sns/FBUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/hz/game/be/sns/FBUser;>;"
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$23;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$23;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 501
    return-void
.end method

.method private static onGetMyInfoFail()V
    .locals 2

    .prologue
    .line 485
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$22;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$22;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 491
    return-void
.end method

.method private static onGetMyInfoSucceed(Lcom/hz/game/be/sns/FBUser;)V
    .locals 2
    .param p0, "user"    # Lcom/hz/game/be/sns/FBUser;

    .prologue
    .line 476
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$21;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$21;-><init>(Lcom/hz/game/be/sns/FBUser;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 482
    return-void
.end method

.method private static onOpenSessionFail()V
    .locals 2

    .prologue
    .line 466
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$20;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$20;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 472
    return-void
.end method

.method private static onOpenSessionSucceed()V
    .locals 2

    .prologue
    .line 457
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$19;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$19;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 463
    return-void
.end method

.method private static onReceiveRequestFail(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 578
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$32;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$32;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 584
    return-void
.end method

.method private static onReceiveRequestSucceed(Lcom/hz/game/be/sns/FBReq;)V
    .locals 2
    .param p0, "req"    # Lcom/hz/game/be/sns/FBReq;

    .prologue
    .line 569
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$31;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$31;-><init>(Lcom/hz/game/be/sns/FBReq;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 575
    return-void
.end method

.method private static onReceiveRequestsFail()V
    .locals 2

    .prologue
    .line 559
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$30;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$30;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 565
    return-void
.end method

.method private static onReceiveRequestsSucceed(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/hz/game/be/sns/FBReq;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 550
    .local p0, "reqs":Ljava/util/List;, "Ljava/util/List<Lcom/hz/game/be/sns/FBReq;>;"
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$29;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$29;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 556
    return-void
.end method

.method private static onSendRequestFail()V
    .locals 2

    .prologue
    .line 540
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$28;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$28;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 546
    return-void
.end method

.method private static onSendRequestSucceed()V
    .locals 2

    .prologue
    .line 531
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$27;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$27;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 537
    return-void
.end method

.method private static onShareFail()V
    .locals 2

    .prologue
    .line 522
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$26;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$26;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 528
    return-void
.end method

.method private static onShareSucceed()V
    .locals 2

    .prologue
    .line 513
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$25;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$25;-><init>()V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 519
    return-void
.end method

.method public static openSession(I)I
    .locals 1
    .param p0, "allowUI"    # I

    .prologue
    .line 104
    invoke-static {p0}, Lcom/hz/game/be/sns/DHFacebook;->openSession2(I)I

    move-result v0

    return v0
.end method

.method private static openSession2(I)I
    .locals 6
    .param p0, "allowUI"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 108
    if-eqz p0, :cond_0

    move v0, v2

    .line 109
    .local v0, "bAllowUI":Z
    :goto_0
    sget-object v4, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v5, Lcom/hz/game/be/sns/DHFacebook$1;

    invoke-direct {v5}, Lcom/hz/game/be/sns/DHFacebook$1;-><init>()V

    invoke-static {v4, v0, v5}, Lcom/facebook/Session;->openActiveSession(Landroid/app/Activity;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;

    move-result-object v1

    .line 121
    .local v1, "s":Lcom/facebook/Session;
    if-eqz v1, :cond_1

    :goto_1
    return v2

    .end local v0    # "bAllowUI":Z
    .end local v1    # "s":Lcom/facebook/Session;
    :cond_0
    move v0, v3

    .line 108
    goto :goto_0

    .restart local v0    # "bAllowUI":Z
    .restart local v1    # "s":Lcom/facebook/Session;
    :cond_1
    move v2, v3

    .line 121
    goto :goto_1
.end method

.method public static printKeyHash(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 11
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 90
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/16 v6, 0x40

    invoke-virtual {v5, p1, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 91
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v5, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v6, v5

    :goto_0
    if-lt v4, v6, :cond_0

    .line 101
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    :goto_1
    return-void

    .line 91
    .restart local v1    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    aget-object v3, v5, v4

    .line 92
    .local v3, "signature":Landroid/content/pm/Signature;
    const-string v7, "SHA"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 93
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 94
    const-string v7, "DHFacebook"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "KeyHash:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    .line 91
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "md":Ljava/security/MessageDigest;
    .end local v3    # "signature":Landroid/content/pm/Signature;
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "DHFacebook"

    const-string v5, "KeyHash"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 98
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v0

    .line 99
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v4, "DHFacebook"

    const-string v5, "KeyHash"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static receiveRequest(Ljava/lang/String;)V
    .locals 2
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 343
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$13;

    invoke-direct {v1, p0}, Lcom/hz/game/be/sns/DHFacebook$13;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 349
    return-void
.end method

.method private static receiveRequest2(Ljava/lang/String;)V
    .locals 5
    .param p0, "reqId"    # Ljava/lang/String;

    .prologue
    .line 352
    move-object v0, p0

    .line 353
    .local v0, "rid":Ljava/lang/String;
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 354
    .local v1, "session":Lcom/facebook/Session;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v2

    if-nez v2, :cond_1

    .line 355
    :cond_0
    const-string v2, "DHFacebook"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "receiveRequest ["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] fail: no valid session"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestFail(Ljava/lang/String;)V

    .line 379
    :goto_0
    return-void

    .line 360
    :cond_1
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    new-instance v3, Lcom/hz/game/be/sns/DHFacebook$14;

    invoke-direct {v3, v0}, Lcom/hz/game/be/sns/DHFacebook$14;-><init>(Ljava/lang/String;)V

    invoke-static {v2, p0, v3}, Lcom/facebook/Request;->newGraphPathRequest(Lcom/facebook/Session;Ljava/lang/String;Lcom/facebook/Request$Callback;)Lcom/facebook/Request;

    move-result-object v2

    .line 378
    invoke-virtual {v2}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_0
.end method

.method public static receiveRequests()V
    .locals 2

    .prologue
    .line 299
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$11;

    invoke-direct {v1}, Lcom/hz/game/be/sns/DHFacebook$11;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 305
    return-void
.end method

.method private static receiveRequests2()V
    .locals 4

    .prologue
    .line 308
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 309
    .local v0, "session":Lcom/facebook/Session;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-nez v1, :cond_1

    .line 310
    :cond_0
    const-string v1, "DHFacebook"

    const-string v2, "receiveRequests fail : no valid session"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onReceiveRequestsFail()V

    .line 340
    :goto_0
    return-void

    .line 315
    :cond_1
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    const-string v2, "/me/apprequests"

    new-instance v3, Lcom/hz/game/be/sns/DHFacebook$12;

    invoke-direct {v3}, Lcom/hz/game/be/sns/DHFacebook$12;-><init>()V

    invoke-static {v1, v2, v3}, Lcom/facebook/Request;->newGraphPathRequest(Lcom/facebook/Session;Ljava/lang/String;Lcom/facebook/Request$Callback;)Lcom/facebook/Request;

    move-result-object v1

    .line 339
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto :goto_0
.end method

.method private static sendRequest(Lcom/hz/game/be/sns/FBReqParam;)V
    .locals 5
    .param p0, "param"    # Lcom/hz/game/be/sns/FBReqParam;

    .prologue
    .line 269
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 270
    .local v1, "session":Lcom/facebook/Session;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v2

    if-nez v2, :cond_1

    .line 271
    :cond_0
    const-string v2, "DHFacebook"

    const-string v3, "sendRequest fail : no valid session"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onSendRequestFail()V

    .line 296
    :goto_0
    return-void

    .line 276
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 277
    .local v0, "b":Landroid/os/Bundle;
    const-string v2, "title"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBReqParam;->title:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string v2, "message"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBReqParam;->message:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v2, "to"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBReqParam;->reqTo:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v2, "data"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBReqParam;->data:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    new-instance v2, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;

    sget-object v3, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;-><init>(Landroid/content/Context;Lcom/facebook/Session;Landroid/os/Bundle;)V

    .line 284
    new-instance v3, Lcom/hz/game/be/sns/DHFacebook$10;

    invoke-direct {v3}, Lcom/hz/game/be/sns/DHFacebook$10;-><init>()V

    invoke-virtual {v2, v3}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v2

    check-cast v2, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;

    .line 295
    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog;->show()V

    goto :goto_0
.end method

.method public static sendRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "reqTo"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/String;

    .prologue
    .line 260
    sget-object v0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v1, Lcom/hz/game/be/sns/DHFacebook$9;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/hz/game/be/sns/DHFacebook$9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 266
    return-void
.end method

.method public static setActivity(Landroid/app/Activity;Landroid/opengl/GLSurfaceView;)V
    .locals 0
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "glSurfaceView"    # Landroid/opengl/GLSurfaceView;

    .prologue
    .line 84
    sput-object p0, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    .line 85
    sput-object p1, Lcom/hz/game/be/sns/DHFacebook;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 86
    return-void
.end method

.method private static share(Lcom/hz/game/be/sns/FBShareParam;)V
    .locals 5
    .param p0, "param"    # Lcom/hz/game/be/sns/FBShareParam;

    .prologue
    .line 230
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 231
    .local v1, "session":Lcom/facebook/Session;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v2

    if-nez v2, :cond_1

    .line 232
    :cond_0
    const-string v2, "DHFacebook"

    const-string v3, "share fail : no valid session"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-static {}, Lcom/hz/game/be/sns/DHFacebook;->onShareFail()V

    .line 257
    :goto_0
    return-void

    .line 237
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 238
    .local v0, "b":Landroid/os/Bundle;
    const-string v2, "name"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBShareParam;->name:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    const-string v2, "caption"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBShareParam;->caption:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v2, "description"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBShareParam;->description:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    const-string v2, "picture"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBShareParam;->picture:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string v2, "link"

    iget-object v3, p0, Lcom/hz/game/be/sns/FBShareParam;->link:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    new-instance v2, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;

    sget-object v3, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;-><init>(Landroid/content/Context;Lcom/facebook/Session;Landroid/os/Bundle;)V

    .line 245
    new-instance v3, Lcom/hz/game/be/sns/DHFacebook$8;

    invoke-direct {v3}, Lcom/hz/game/be/sns/DHFacebook$8;-><init>()V

    invoke-virtual {v2, v3}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v2

    check-cast v2, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;

    .line 256
    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog;->show()V

    goto :goto_0
.end method

.method public static share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "caption"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "picture"    # Ljava/lang/String;
    .param p4, "link"    # Ljava/lang/String;

    .prologue
    .line 220
    sget-object v6, Lcom/hz/game/be/sns/DHFacebook;->_activity:Landroid/app/Activity;

    new-instance v0, Lcom/hz/game/be/sns/DHFacebook$7;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/hz/game/be/sns/DHFacebook$7;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 227
    return-void
.end method
