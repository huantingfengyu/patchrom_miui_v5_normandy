.class public Lcom/android/server/QosManager;
.super Ljava/lang/Object;
.source "QosManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "QoSManager"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mService:Lcom/android/server/ConnectivityService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/server/ConnectivityService;)V
    .locals 0
    .parameter "context"
    .parameter "connectivityService"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/QosManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/QosManager;->mService:Lcom/android/server/ConnectivityService;

    return-void
.end method


# virtual methods
.method public getCurrentFwdLatency(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCurrentRevLatency(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMaxAvailableForwardBandwidth(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMaxAvailableReverseBandwidth(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMinAvailableForwardBandwidth(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMinAvailableReverseBandwidth(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public getQosState(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public releaseQos(I)Z
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public requestLink(ILandroid/net/LinkCapabilities;Ljava/lang/String;Landroid/os/IBinder;)I
    .locals 0
    .parameter "id"
    .parameter "cap"
    .parameter "remoteIPAddress"
    .parameter "binder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    return p1
.end method

.method public requestQoS(IILjava/lang/String;)Z
    .locals 1
    .parameter "id"
    .parameter "port"
    .parameter "localAddress"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public resumeQoS(I)Z
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public suspendQoS(I)Z
    .locals 1
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    return v0
.end method
