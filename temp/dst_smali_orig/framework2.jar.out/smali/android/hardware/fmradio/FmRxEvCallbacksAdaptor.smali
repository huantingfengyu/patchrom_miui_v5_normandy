.class public Landroid/hardware/fmradio/FmRxEvCallbacksAdaptor;
.super Ljava/lang/Object;
.source "FmRxEvCallbacksAdaptor.java"

# interfaces
.implements Landroid/hardware/fmradio/FmRxEvCallbacks;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public FmRxEvDisableReceiver()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvEnableReceiver()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvRadioReset()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvRadioTuneStatus(I)V
    .locals 0
    .parameter "freq"

    .prologue
    return-void
.end method

.method public FmRxEvRdsAfInfo()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvRdsGroupData()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvRdsLockStatus(Z)V
    .locals 0
    .parameter "rdsAvail"

    .prologue
    return-void
.end method

.method public FmRxEvRdsPsInfo()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvRdsRtInfo()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvSearchCancelled()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvSearchComplete(I)V
    .locals 0
    .parameter "freq"

    .prologue
    return-void
.end method

.method public FmRxEvSearchInProgress()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvSearchListComplete()V
    .locals 0

    .prologue
    return-void
.end method

.method public FmRxEvServiceAvailable(Z)V
    .locals 0
    .parameter "service"

    .prologue
    return-void
.end method

.method public FmRxEvStereoStatus(Z)V
    .locals 0
    .parameter "stereo"

    .prologue
    return-void
.end method
