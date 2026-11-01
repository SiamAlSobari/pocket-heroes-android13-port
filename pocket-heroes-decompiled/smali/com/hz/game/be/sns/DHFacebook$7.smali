.class Lcom/hz/game/be/sns/DHFacebook$7;
.super Ljava/lang/Object;
.source "DHFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hz/game/be/sns/DHFacebook;->share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$caption:Ljava/lang/String;

.field private final synthetic val$description:Ljava/lang/String;

.field private final synthetic val$link:Ljava/lang/String;

.field private final synthetic val$name:Ljava/lang/String;

.field private final synthetic val$picture:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$name:Ljava/lang/String;

    iput-object p2, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$caption:Ljava/lang/String;

    iput-object p3, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$description:Ljava/lang/String;

    iput-object p4, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$picture:Ljava/lang/String;

    iput-object p5, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$link:Ljava/lang/String;

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 223
    new-instance v0, Lcom/hz/game/be/sns/FBShareParam;

    iget-object v1, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$name:Ljava/lang/String;

    iget-object v2, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$caption:Ljava/lang/String;

    iget-object v3, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$description:Ljava/lang/String;

    iget-object v4, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$picture:Ljava/lang/String;

    iget-object v5, p0, Lcom/hz/game/be/sns/DHFacebook$7;->val$link:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/hz/game/be/sns/FBShareParam;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/hz/game/be/sns/DHFacebook;->access$9(Lcom/hz/game/be/sns/FBShareParam;)V

    .line 224
    return-void
.end method
