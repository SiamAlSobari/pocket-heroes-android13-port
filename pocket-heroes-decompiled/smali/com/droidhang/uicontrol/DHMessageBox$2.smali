.class Lcom/droidhang/uicontrol/DHMessageBox$2;
.super Ljava/lang/Object;
.source "DHMessageBox.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/uicontrol/DHMessageBox;->showMessageBox2(Landroid/opengl/GLSurfaceView;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$bt1:Ljava/lang/String;

.field private final synthetic val$bt2:Ljava/lang/String;

.field private final synthetic val$ctx:Landroid/app/Activity;

.field private final synthetic val$glSurfaceView:Landroid/opengl/GLSurfaceView;

.field private final synthetic val$msg:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/opengl/GLSurfaceView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$ctx:Landroid/app/Activity;

    iput-object p2, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$msg:Ljava/lang/String;

    iput-object p3, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$bt1:Ljava/lang/String;

    iput-object p5, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$bt2:Ljava/lang/String;

    iput-object p6, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 36
    iget-object v0, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$ctx:Landroid/app/Activity;

    iget-object v1, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$msg:Ljava/lang/String;

    iget-object v2, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$title:Ljava/lang/String;

    iget-object v3, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$bt1:Ljava/lang/String;

    iget-object v4, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$bt2:Ljava/lang/String;

    new-instance v5, Lcom/droidhang/uicontrol/DHMessageBox$2$1;

    iget-object v6, p0, Lcom/droidhang/uicontrol/DHMessageBox$2;->val$glSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-direct {v5, p0, v6}, Lcom/droidhang/uicontrol/DHMessageBox$2$1;-><init>(Lcom/droidhang/uicontrol/DHMessageBox$2;Landroid/opengl/GLSurfaceView;)V

    .line 46
    const/4 v6, 0x0

    const/4 v7, -0x1

    .line 36
    invoke-static/range {v0 .. v7}, Lcom/wwcd/util/DialogHelper;->show2ButtonDialog(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/wwcd/util/DialogAction;Lcom/wwcd/util/DialogAction;I)V

    .line 47
    return-void
.end method
