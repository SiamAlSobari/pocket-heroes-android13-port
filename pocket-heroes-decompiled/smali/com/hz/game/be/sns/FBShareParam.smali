.class Lcom/hz/game/be/sns/FBShareParam;
.super Ljava/lang/Object;
.source "DHFacebook.java"


# instance fields
.field public caption:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public link:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public picture:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "c"    # Ljava/lang/String;
    .param p3, "d"    # Ljava/lang/String;
    .param p4, "p"    # Ljava/lang/String;
    .param p5, "l"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/hz/game/be/sns/FBShareParam;->name:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/hz/game/be/sns/FBShareParam;->caption:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/hz/game/be/sns/FBShareParam;->description:Ljava/lang/String;

    .line 53
    iput-object p4, p0, Lcom/hz/game/be/sns/FBShareParam;->picture:Ljava/lang/String;

    .line 54
    iput-object p5, p0, Lcom/hz/game/be/sns/FBShareParam;->link:Ljava/lang/String;

    .line 55
    return-void
.end method
