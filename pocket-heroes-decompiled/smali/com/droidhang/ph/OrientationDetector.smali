.class public Lcom/droidhang/ph/OrientationDetector;
.super Landroid/view/OrientationEventListener;
.source "OrientationDetector.java"


# instance fields
.field private activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 12
    iput-object p1, p0, Lcom/droidhang/ph/OrientationDetector;->activity:Landroid/app/Activity;

    .line 13
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 2
    .param p1, "orientation"    # I

    .prologue
    const/16 v1, 0x8

    .line 17
    const/16 v0, 0x15e

    if-gt p1, v0, :cond_0

    const/16 v0, 0xa

    if-ge p1, v0, :cond_2

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    const/16 v0, 0x10e

    if-ne p1, v0, :cond_5

    .line 31
    iget-object v0, p0, Lcom/droidhang/ph/OrientationDetector;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 32
    iget-object v0, p0, Lcom/droidhang/ph/OrientationDetector;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 43
    :cond_1
    :goto_1
    return-void

    .line 19
    :cond_2
    const/16 v0, 0x50

    if-le p1, v0, :cond_3

    const/16 v0, 0x64

    if-ge p1, v0, :cond_3

    .line 20
    const/16 p1, 0x5a

    .line 21
    goto :goto_0

    :cond_3
    const/16 v0, 0xaa

    if-le p1, v0, :cond_4

    const/16 v0, 0xbe

    if-ge p1, v0, :cond_4

    .line 22
    const/16 p1, 0xb4

    .line 23
    goto :goto_0

    :cond_4
    const/16 v0, 0x104

    if-le p1, v0, :cond_1

    const/16 v0, 0x118

    if-ge p1, v0, :cond_1

    .line 24
    const/16 p1, 0x10e

    .line 25
    goto :goto_0

    .line 36
    :cond_5
    const/16 v0, 0x5a

    if-ne p1, v0, :cond_1

    .line 38
    iget-object v0, p0, Lcom/droidhang/ph/OrientationDetector;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    if-nez v0, :cond_1

    .line 39
    iget-object v0, p0, Lcom/droidhang/ph/OrientationDetector;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_1
.end method
