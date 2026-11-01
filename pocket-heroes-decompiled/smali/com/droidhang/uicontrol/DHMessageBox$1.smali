.class Lcom/droidhang/uicontrol/DHMessageBox$1;
.super Ljava/lang/Object;
.source "DHMessageBox.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/uicontrol/DHMessageBox;->showMessageBox(Landroid/opengl/GLSurfaceView;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$bt:Ljava/lang/String;

.field private final synthetic val$ctx:Landroid/app/Activity;

.field private final synthetic val$glSurfaceView:Landroid/opengl/GLSurfaceView;

.field private final synthetic val$msg:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/opengl/GLSurfaceView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$ctx:Landroid/app/Activity;

    iput-object p2, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$msg:Ljava/lang/String;

    iput-object p3, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$bt:Ljava/lang/String;

    iput-object p5, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 16
    iget-object v0, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$ctx:Landroid/app/Activity;

    iget-object v1, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$msg:Ljava/lang/String;

    iget-object v2, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$title:Ljava/lang/String;

    iget-object v3, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$bt:Ljava/lang/String;

    new-instance v4, Lcom/droidhang/uicontrol/DHMessageBox$1$1;

    iget-object v5, p0, Lcom/droidhang/uicontrol/DHMessageBox$1;->val$glSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-direct {v4, p0, v5}, Lcom/droidhang/uicontrol/DHMessageBox$1$1;-><init>(Lcom/droidhang/uicontrol/DHMessageBox$1;Landroid/opengl/GLSurfaceView;)V

    invoke-static {v0, v1, v2, v3, v4}, Lcom/wwcd/util/DialogHelper;->showButtonDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/wwcd/util/DialogAction;)V

    .line 27
    return-void
.end method
