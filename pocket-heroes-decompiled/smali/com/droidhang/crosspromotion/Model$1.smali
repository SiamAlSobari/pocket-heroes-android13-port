.class Lcom/droidhang/crosspromotion/Model$1;
.super Ljava/lang/Object;
.source "Model.java"

# interfaces
.implements Lcom/droidhang/crosspromotion/util/net/SimpleHttpObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droidhang/crosspromotion/Model;->requestData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAsyncHttpComplete(Z[B)V
    .locals 17
    .param p1, "succeed"    # Z
    .param p2, "bytes"    # [B

    .prologue
    .line 121
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "request applist success="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    const-string v7, ""

    .line 124
    .local v7, "jsonString":Ljava/lang/String;
    :try_start_0
    new-instance v8, Ljava/lang/String;

    const-string v14, "UTF-8"

    move-object/from16 v0, p2

    invoke-direct {v8, v0, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .end local v7    # "jsonString":Ljava/lang/String;
    .local v8, "jsonString":Ljava/lang/String;
    :try_start_1
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "jsonString="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_6

    .line 130
    const-string v13, "0"

    .line 131
    .local v13, "version":Ljava/lang/String;
    const/4 v12, 0x0

    .line 134
    .local v12, "status":I
    :try_start_2
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 135
    .local v6, "jsonObject":Lorg/json/JSONObject;
    const-string v14, "status"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    .line 136
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "status = "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 142
    invoke-static {}, Lcom/droidhang/crosspromotion/Model;->access$0()Landroid/app/Activity;

    move-result-object v14

    .line 143
    const-string v15, "crosspromotion"

    .line 144
    const/16 v16, 0x0

    .line 143
    invoke-virtual/range {v14 .. v16}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 146
    .local v11, "sharedPreferences":Landroid/content/SharedPreferences;
    if-nez v12, :cond_2

    .line 147
    const-string v14, "ret"

    const-string v15, ""

    invoke-interface {v11, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 148
    .local v10, "ret":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 149
    const-string v14, "CrossPromotion_Model"

    .line 150
    const-string v15, "304, parse jsonString in pref = null"

    .line 149
    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v7, v8

    .line 220
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v8    # "jsonString":Ljava/lang/String;
    .end local v10    # "ret":Ljava/lang/String;
    .end local v11    # "sharedPreferences":Landroid/content/SharedPreferences;
    .end local v12    # "status":I
    .end local v13    # "version":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    :goto_0
    return-void

    .line 126
    :catch_0
    move-exception v1

    .line 127
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    goto :goto_0

    .line 137
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v7    # "jsonString":Ljava/lang/String;
    .restart local v8    # "jsonString":Ljava/lang/String;
    .restart local v12    # "status":I
    .restart local v13    # "version":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 138
    .local v1, "e":Lorg/json/JSONException;
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, " parse jsonString exp ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v7, v8

    .line 139
    .end local v8    # "jsonString":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    goto :goto_0

    .line 154
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v7    # "jsonString":Ljava/lang/String;
    .restart local v6    # "jsonObject":Lorg/json/JSONObject;
    .restart local v8    # "jsonString":Ljava/lang/String;
    .restart local v10    # "ret":Ljava/lang/String;
    .restart local v11    # "sharedPreferences":Landroid/content/SharedPreferences;
    :cond_0
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "304, parse jsonString in pref ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :try_start_3
    new-instance v6, Lorg/json/JSONObject;

    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    invoke-direct {v6, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 183
    .end local v10    # "ret":Ljava/lang/String;
    .restart local v6    # "jsonObject":Lorg/json/JSONObject;
    :goto_2
    const/4 v5, 0x0

    .line 185
    .local v5, "jsonArray":Lorg/json/JSONArray;
    :try_start_4
    const-string v14, "app"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v5

    .line 190
    :goto_3
    if-eqz v5, :cond_1

    :try_start_5
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_1

    .line 191
    const-string v14, "CrossPromotion_Model"

    const-string v15, "update cache"

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    invoke-static {}, Lcom/droidhang/crosspromotion/Model;->access$1()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->clear()V

    .line 193
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_4
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    move-result v14

    if-lt v3, v14, :cond_3

    .line 217
    .end local v3    # "i":I
    :cond_1
    :goto_5
    invoke-static {}, Lcom/droidhang/crosspromotion/Model;->access$1()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_5

    move-object v7, v8

    .line 220
    .end local v8    # "jsonString":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    goto :goto_0

    .line 157
    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "jsonString":Ljava/lang/String;
    .restart local v8    # "jsonString":Ljava/lang/String;
    .restart local v10    # "ret":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 158
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v14, "CrossPromotion_Model"

    .line 159
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "304, parse jsonString in pref exp ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 159
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 158
    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v7, v8

    .line 161
    .end local v8    # "jsonString":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    goto/16 :goto_0

    .line 165
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v7    # "jsonString":Ljava/lang/String;
    .end local v10    # "ret":Ljava/lang/String;
    .restart local v6    # "jsonObject":Lorg/json/JSONObject;
    .restart local v8    # "jsonString":Ljava/lang/String;
    :cond_2
    :try_start_6
    const-string v14, "v"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 166
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "version ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_3

    .line 176
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 177
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v14, "ret"

    invoke-interface {v2, v14, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 178
    const-string v14, "version"

    invoke-interface {v2, v14, v13}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 179
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_2

    .line 167
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :catch_3
    move-exception v1

    .line 168
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v14, "CrossPromotion_Model"

    .line 169
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, " parse jsonString exp ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 169
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 168
    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v7, v8

    .line 171
    .end local v8    # "jsonString":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    goto/16 :goto_0

    .line 186
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v7    # "jsonString":Ljava/lang/String;
    .restart local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v8    # "jsonString":Ljava/lang/String;
    :catch_4
    move-exception v1

    .line 187
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "parse jsonArray exp ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 195
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v3    # "i":I
    :cond_3
    :try_start_7
    invoke-virtual {v5, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 196
    .local v9, "object":Lorg/json/JSONObject;
    new-instance v4, Lcom/droidhang/crosspromotion/Model$AppItem;

    invoke-direct {v4}, Lcom/droidhang/crosspromotion/Model$AppItem;-><init>()V

    .line 197
    .local v4, "item":Lcom/droidhang/crosspromotion/Model$AppItem;
    const-string v14, "appid"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->appid:Ljava/lang/String;

    .line 198
    const-string v14, "percent"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    iput v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->percent:I

    .line 199
    const-string v14, "md5"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->md5:Ljava/lang/String;

    .line 200
    const-string v14, "url"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->url:Ljava/lang/String;

    .line 202
    iget-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->appid:Ljava/lang/String;

    invoke-static {v14}, Lcom/droidhang/crosspromotion/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 203
    iget v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->percent:I

    if-lez v14, :cond_4

    .line 205
    iget-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->md5:Ljava/lang/String;

    invoke-static {v14}, Lcom/droidhang/crosspromotion/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 207
    iget-object v14, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->url:Ljava/lang/String;

    invoke-static {v14}, Lcom/droidhang/crosspromotion/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 208
    invoke-static {}, Lcom/droidhang/crosspromotion/Model;->access$1()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_5

    .line 193
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_4

    .line 212
    .end local v3    # "i":I
    .end local v4    # "item":Lcom/droidhang/crosspromotion/Model$AppItem;
    .end local v9    # "object":Lorg/json/JSONObject;
    :catch_5
    move-exception v1

    .line 213
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v14, "CrossPromotion_Model"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "parse exp ="

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 217
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_5
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/droidhang/crosspromotion/Model$AppItem;

    .line 218
    .restart local v4    # "item":Lcom/droidhang/crosspromotion/Model$AppItem;
    iget-object v15, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->url:Ljava/lang/String;

    iget-object v0, v4, Lcom/droidhang/crosspromotion/Model$AppItem;->md5:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Lcom/droidhang/crosspromotion/Model;->access$2(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 126
    .end local v4    # "item":Lcom/droidhang/crosspromotion/Model$AppItem;
    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v11    # "sharedPreferences":Landroid/content/SharedPreferences;
    .end local v12    # "status":I
    .end local v13    # "version":Ljava/lang/String;
    :catch_6
    move-exception v1

    move-object v7, v8

    .end local v8    # "jsonString":Ljava/lang/String;
    .restart local v7    # "jsonString":Ljava/lang/String;
    goto/16 :goto_1
.end method
