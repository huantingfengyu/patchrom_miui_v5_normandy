.class public Landroid/net/ExtraLinkCapabilities;
.super Landroid/net/LinkCapabilities;
.source "ExtraLinkCapabilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/net/LinkCapabilities;-><init>()V

    return-void
.end method


# virtual methods
.method public put(ILjava/lang/String;)V
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    iget-object v0, p0, Landroid/net/ExtraLinkCapabilities;->mCapabilities:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .parameter "cap"

    .prologue
    iget-object v0, p0, Landroid/net/ExtraLinkCapabilities;->mCapabilities:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public remove(I)V
    .locals 2
    .parameter "key"

    .prologue
    iget-object v0, p0, Landroid/net/ExtraLinkCapabilities;->mCapabilities:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
