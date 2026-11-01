.class public Lcom/droidhang/crosspromotion/util/RandUtil;
.super Ljava/lang/Object;
.source "RandUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static _random:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const-class v0, Lcom/droidhang/crosspromotion/util/RandUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/droidhang/crosspromotion/util/RandUtil;->$assertionsDisabled:Z

    .line 12
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    .local p0, "this":Lcom/droidhang/crosspromotion/util/RandUtil;, "Lcom/droidhang/crosspromotion/util/RandUtil<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRandom()Ljava/util/Random;
    .locals 4

    .prologue
    .line 15
    sget-object v0, Lcom/droidhang/crosspromotion/util/RandUtil;->_random:Ljava/util/Random;

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/droidhang/crosspromotion/util/RandUtil;->_random:Ljava/util/Random;

    .line 17
    sget-object v0, Lcom/droidhang/crosspromotion/util/RandUtil;->_random:Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Random;->setSeed(J)V

    .line 19
    :cond_0
    sget-object v0, Lcom/droidhang/crosspromotion/util/RandUtil;->_random:Ljava/util/Random;

    return-object v0
.end method


# virtual methods
.method public random(Ljava/util/List;Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/droidhang/crosspromotion/util/RandUtil;, "Lcom/droidhang/crosspromotion/util/RandUtil<TT;>;"
    .local p1, "source":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p2, "weightFunc":Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight;, "Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight<TT;>;"
    sget-boolean v7, Lcom/droidhang/crosspromotion/util/RandUtil;->$assertionsDisabled:Z

    if-nez v7, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_0

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 25
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    .line 26
    .local v4, "size":I
    new-array v6, v4, [I

    .line 27
    .local v6, "weights":[I
    const/4 v5, 0x0

    .line 28
    .local v5, "sum":I
    const/4 v0, 0x0

    .line 29
    .local v0, "index":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_1

    .line 33
    sget-boolean v7, Lcom/droidhang/crosspromotion/util/RandUtil;->$assertionsDisabled:Z

    if-nez v7, :cond_2

    if-nez v5, :cond_2

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 29
    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Object;

    .line 30
    .local v3, "s":Ljava/lang/Object;, "TT;"
    invoke-interface {p2, v3}, Lcom/droidhang/crosspromotion/util/RandUtil$GetWeight;->getWeight(Ljava/lang/Object;)I

    move-result v8

    add-int/2addr v5, v8

    .line 31
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    aput v5, v6, v0

    move v0, v1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    goto :goto_0

    .line 35
    .end local v3    # "s":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-static {}, Lcom/droidhang/crosspromotion/util/RandUtil;->getRandom()Ljava/util/Random;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 36
    .local v2, "ret":I
    const/4 v0, 0x0

    :goto_1
    if-lt v0, v4, :cond_3

    .line 42
    const/4 v7, 0x0

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    :goto_2
    return-object v7

    .line 37
    :cond_3
    aget v7, v6, v0

    if-ge v2, v7, :cond_4

    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    goto :goto_2

    .line 36
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
