.class Lcom/droidhang/crosspromotion/Model$2;
.super Ljava/lang/Object;
.source "Model.java"

# interfaces
.implements Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/crosspromotion/Model;->getDisplayAppItem()Lcom/droidhang/crosspromotion/Model$AppItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight",
        "<",
        "Lcom/droidhang/crosspromotion/Model$AppItem;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public getWeight(Lcom/droidhang/crosspromotion/Model$AppItem;)I
    .locals 1
    .param p1, "object"    # Lcom/droidhang/crosspromotion/Model$AppItem;

    .prologue
    .line 251
    iget v0, p1, Lcom/droidhang/crosspromotion/Model$AppItem;->percent:I

    return v0
.end method

.method public bridge synthetic getWeight(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/droidhang/crosspromotion/Model$AppItem;

    invoke-virtual {p0, p1}, Lcom/droidhang/crosspromotion/Model$2;->getWeight(Lcom/droidhang/crosspromotion/Model$AppItem;)I

    move-result v0

    return v0
.end method
