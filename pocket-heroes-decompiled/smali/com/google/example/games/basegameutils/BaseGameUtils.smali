.class public Lcom/google/example/games/basegameutils/BaseGameUtils;
.super Ljava/lang/Object;
.source "BaseGameUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 159
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 158
    return-object v0
.end method

.method public static makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 171
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 172
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 173
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 174
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 171
    return-object v0
.end method

.method public static resolveConnectionFailure(Landroid/app/Activity;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/ConnectionResult;ILjava/lang/String;)Z
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .param p2, "result"    # Lcom/google/android/gms/common/ConnectionResult;
    .param p3, "requestCode"    # I
    .param p4, "fallbackErrorMessage"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 43
    invoke-virtual {p2}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 45
    :try_start_0
    invoke-virtual {p2, p0, p3}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    const/4 v3, 0x1

    .line 64
    :goto_0
    return v3

    .line 47
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Landroid/content/IntentSender$SendIntentException;
    invoke-interface {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    goto :goto_0

    .line 55
    .end local v1    # "e":Landroid/content/IntentSender$SendIntentException;
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v2

    .line 56
    .local v2, "errorCode":I
    invoke-static {v2, p0, p3}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;I)Landroid/app/Dialog;

    move-result-object v0

    .line 58
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_1

    .line 59
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 62
    :cond_1
    invoke-static {p0, p4}, Lcom/google/example/games/basegameutils/BaseGameUtils;->showAlert(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static showActivityResultError(Landroid/app/Activity;III)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "requestCode"    # I
    .param p2, "actResp"    # I
    .param p3, "errorDescription"    # I

    .prologue
    .line 114
    if-nez p0, :cond_0

    .line 115
    const-string v2, "BaseGameUtils"

    const-string v3, "*** No Activity. Can\'t show failure dialog!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :goto_0
    return-void

    .line 120
    :cond_0
    packed-switch p2, :pswitch_data_0

    .line 136
    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 138
    .local v0, "errorCode":I
    const/4 v2, 0x0

    .line 137
    invoke-static {v0, p0, p1, v2}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;ILandroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;

    move-result-object v1

    .line 139
    .local v1, "errorDialog":Landroid/app/Dialog;
    if-nez v1, :cond_1

    .line 141
    const-string v2, "BaseGamesUtils"

    .line 142
    const-string v3, "No standard error dialog available. Making fallback dialog."

    .line 141
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-virtual {p0, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/google/example/games/basegameutils/BaseGameUtils;->makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v1

    .line 147
    .end local v0    # "errorCode":I
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 123
    .end local v1    # "errorDialog":Landroid/app/Dialog;
    :pswitch_0
    sget v2, Lcom/google/example/games/basegameutils/R$string;->app_misconfigured:I

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 122
    invoke-static {p0, v2}, Lcom/google/example/games/basegameutils/BaseGameUtils;->makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v1

    .line 124
    .restart local v1    # "errorDialog":Landroid/app/Dialog;
    goto :goto_1

    .line 127
    .end local v1    # "errorDialog":Landroid/app/Dialog;
    :pswitch_1
    sget v2, Lcom/google/example/games/basegameutils/R$string;->sign_in_failed:I

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 126
    invoke-static {p0, v2}, Lcom/google/example/games/basegameutils/BaseGameUtils;->makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v1

    .line 128
    .restart local v1    # "errorDialog":Landroid/app/Dialog;
    goto :goto_1

    .line 131
    .end local v1    # "errorDialog":Landroid/app/Dialog;
    :pswitch_2
    sget v2, Lcom/google/example/games/basegameutils/R$string;->license_failed:I

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 130
    invoke-static {p0, v2}, Lcom/google/example/games/basegameutils/BaseGameUtils;->makeSimpleDialog(Landroid/app/Activity;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v1

    .line 132
    .restart local v1    # "errorDialog":Landroid/app/Dialog;
    goto :goto_1

    .line 120
    :pswitch_data_0
    .packed-switch 0x2712
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public static showAlert(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 23
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 24
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 25
    return-void
.end method

.method public static varargs verifySampleSetup(Landroid/app/Activity;[I)Z
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "resIds"    # [I

    .prologue
    const/4 v3, 0x0

    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .local v2, "problems":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 79
    .local v1, "problemFound":Z
    const-string v4, "The following set up problems were found:\n\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.google.example.games"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 83
    const/4 v1, 0x1

    .line 84
    const-string v4, "- Package name cannot be com.google.*. You need to change the sample\'s package name to your own package."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 85
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    :cond_0
    array-length v5, p1

    move v4, v3

    :goto_0
    if-lt v4, v5, :cond_1

    .line 97
    :goto_1
    if-eqz v1, :cond_3

    .line 98
    const-string v4, "\n\nThese problems may prevent the app from working properly."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/google/example/games/basegameutils/BaseGameUtils;->showAlert(Landroid/app/Activity;Ljava/lang/String;)V

    .line 103
    :goto_2
    return v3

    .line 88
    :cond_1
    aget v0, p1, v4

    .line 89
    .local v0, "i":I
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "replaceme"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 90
    const/4 v1, 0x1

    .line 91
    const-string v4, "- You must replace all placeholder IDs in the ids.xml file by your project\'s IDs."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 92
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 88
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 103
    .end local v0    # "i":I
    :cond_3
    const/4 v3, 0x1

    goto :goto_2
.end method
