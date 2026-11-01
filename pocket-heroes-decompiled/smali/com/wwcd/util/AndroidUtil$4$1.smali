.class Lcom/wwcd/util/AndroidUtil$4$1;
.super Ljava/lang/Object;
.source "AndroidUtil.java"

# interfaces
.implements Lcom/wwcd/util/DialogAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wwcd/util/AndroidUtil$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/wwcd/util/AndroidUtil$4;

.field private final synthetic val$ctx:Landroid/app/Activity;

.field private final synthetic val$dlurl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/wwcd/util/AndroidUtil$4;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/wwcd/util/AndroidUtil$4$1;->this$1:Lcom/wwcd/util/AndroidUtil$4;

    iput-object p2, p0, Lcom/wwcd/util/AndroidUtil$4$1;->val$ctx:Landroid/app/Activity;

    iput-object p3, p0, Lcom/wwcd/util/AndroidUtil$4$1;->val$dlurl:Ljava/lang/String;

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doAction()V
    .locals 2

    .prologue
    .line 239
    iget-object v0, p0, Lcom/wwcd/util/AndroidUtil$4$1;->val$ctx:Landroid/app/Activity;

    iget-object v1, p0, Lcom/wwcd/util/AndroidUtil$4$1;->val$dlurl:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/wwcd/util/AndroidUtil;->downloadApp(Landroid/content/Context;Ljava/lang/String;)V

    .line 240
    return-void
.end method
