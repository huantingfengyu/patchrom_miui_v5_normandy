.class public Landroid/hardware/fmradio/FmTransmitter;
.super Landroid/hardware/fmradio/FmTransceiver;
.source "FmTransmitter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    }
.end annotation


# static fields
.field public static final FM_TX_LOW_POWER_MODE:I = 0x1

.field public static final FM_TX_MAX_PS_LEN:I = 0x61

.field public static final FM_TX_MAX_RT_LEN:I = 0x3f

.field public static final FM_TX_NORMAL_POWER_MODE:I = 0x0

.field public static final FM_TX_PWR_LEVEL_0:I = 0x0

.field public static final FM_TX_PWR_LEVEL_1:I = 0x1

.field public static final FM_TX_PWR_LEVEL_2:I = 0x2

.field public static final FM_TX_PWR_LEVEL_3:I = 0x3

.field public static final FM_TX_PWR_LEVEL_4:I = 0x4

.field public static final FM_TX_PWR_LEVEL_5:I = 0x5

.field public static final FM_TX_PWR_LEVEL_6:I = 0x6

.field public static final FM_TX_PWR_LEVEL_7:I = 0x7

.field private static final MAX_PS_CHARS:I = 0x61

.field private static final MAX_PS_REP_COUNT:I = 0xf

.field private static final MAX_RDS_GROUP_BUF_SIZE:I = 0x3e

.field public static final RDS_GRPS_TX_PAUSE:I = 0x0

.field public static final RDS_GRPS_TX_RESUME:I = 0x1

.field public static final RDS_GRPS_TX_STOP:I = 0x2

.field private static final V4L2_CID_PRIVATE_BASE:I = 0x8000000

.field private static final V4L2_CID_PRIVATE_TAVARUA_ANTENNA:I = 0x8000012


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mPSStarted:Z

.field private mRTStarted:Z

.field private mTxCallbacks:Landroid/hardware/fmradio/FmTransmitterCallbacksAdaptor;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/hardware/fmradio/FmTransmitterCallbacksAdaptor;)V
    .locals 2
    .parameter "path"
    .parameter "callbacks"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/hardware/fmradio/FmTransceiver;-><init>()V

    const-string v0, "FmTransmitter"

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransmitter;->TAG:Ljava/lang/String;

    iput-boolean v1, p0, Landroid/hardware/fmradio/FmTransmitter;->mPSStarted:Z

    iput-boolean v1, p0, Landroid/hardware/fmradio/FmTransmitter;->mRTStarted:Z

    new-instance v0, Landroid/hardware/fmradio/FmTxEventListner;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmTxEventListner;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransmitter;->mTxEvents:Landroid/hardware/fmradio/FmTxEventListner;

    new-instance v0, Landroid/hardware/fmradio/FmRxControls;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmRxControls;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransmitter;->mControl:Landroid/hardware/fmradio/FmRxControls;

    iput-object p2, p0, Landroid/hardware/fmradio/FmTransmitter;->mTxCallbacks:Landroid/hardware/fmradio/FmTransmitterCallbacksAdaptor;

    return-void
.end method


# virtual methods
.method public disable()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .local v2, status:Z
    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->getFMState()I

    move-result v1

    .local v1, state:I
    sparse-switch v1, :sswitch_data_0

    :cond_0
    const/4 v4, 0x6

    invoke-static {v4}, Landroid/hardware/fmradio/FmTransmitter;->setFMPowerState(I)V

    const-string v4, "FmTransmitter"

    const-string v5, "disable: CURRENT-STATE : FMTxOn ---> NEW-STATE : FMTurningOff"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v4, p0, Landroid/hardware/fmradio/FmTransmitter;->mPSStarted:Z

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->stopPSInfo()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "FmTransmitter"

    const-string v5, "FmTrasmitter:stopPSInfo failed\n"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-boolean v4, p0, Landroid/hardware/fmradio/FmTransmitter;->mRTStarted:Z

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->stopRTInfo()Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "FmTransmitter"

    const-string v5, "FmTrasmitter:stopRTInfo failed\n"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Landroid/hardware/fmradio/FmTransmitter;->transmitRdsGroupControl(I)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "FmTransmitter"

    const-string v5, "FmTrasmitter:transmitRdsGroupControl failed\n"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-super {p0}, Landroid/hardware/fmradio/FmTransceiver;->disable()Z

    move v2, v3

    .end local v2           #status:Z
    :goto_0
    return v2

    .restart local v2       #status:Z
    :sswitch_0
    const-string v4, "FmTransmitter"

    const-string v5, "FM already tuned Off."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v3

    goto :goto_0

    :sswitch_1
    const-string v4, "FmTransmitter"

    const-string v5, "disable: FM not yet turned On..."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->getFMState()I

    move-result v1

    const/4 v4, 0x5

    if-ne v1, v4, :cond_0

    const-string v3, "FmTransmitter"

    const-string v4, "disable: FM in bad state"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .end local v0           #e:Ljava/lang/InterruptedException;
    :sswitch_2
    const-string v3, "FmTransmitter"

    const-string v4, "disable: FM is getting turned Off."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5 -> :sswitch_1
        0x6 -> :sswitch_2
    .end sparse-switch
.end method

.method public enable(Landroid/hardware/fmradio/FmConfig;)Z
    .locals 6
    .parameter "configSettings"

    .prologue
    const/4 v4, 0x5

    const/4 v5, 0x2

    const/4 v1, 0x1

    .local v1, status:Z
    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->getFMState()I

    move-result v0

    .local v0, state:I
    if-ne v0, v5, :cond_0

    const-string v3, "FmTransmitter"

    const-string v4, "enable: FM Tx already turned On and running"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .end local v1           #status:Z
    .local v2, status:I
    :goto_0
    return v2

    .end local v2           #status:I
    .restart local v1       #status:Z
    :cond_0
    const/4 v3, 0x6

    if-ne v0, v3, :cond_1

    const-string v3, "FmTransmitter"

    const-string v4, "FM is in the process of turning off.Pls wait for sometime."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .restart local v2       #status:I
    goto :goto_0

    .end local v2           #status:I
    :cond_1
    if-ne v0, v4, :cond_2

    const-string v3, "FmTransmitter"

    const-string v4, "FM is in the process of turning On.Pls wait for sometime."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v1

    .restart local v2       #status:I
    goto :goto_0

    .end local v2           #status:I
    :cond_2
    invoke-static {v4}, Landroid/hardware/fmradio/FmTransmitter;->setFMPowerState(I)V

    const-string v3, "FmTransmitter"

    const-string v4, "enable: CURRENT-STATE : FMOff ---> NEW-STATE : FMTxStarting"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1, v5}, Landroid/hardware/fmradio/FmTransceiver;->enable(Landroid/hardware/fmradio/FmConfig;I)Z

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_3

    iget-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mTxCallbacks:Landroid/hardware/fmradio/FmTransmitterCallbacksAdaptor;

    invoke-virtual {p0, v3}, Landroid/hardware/fmradio/FmTransmitter;->registerTransmitClient(Landroid/hardware/fmradio/FmTransmitterCallbacks;)Z

    new-instance v3, Landroid/hardware/fmradio/FmRxRdsData;

    sget v4, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-direct {v3, v4}, Landroid/hardware/fmradio/FmRxRdsData;-><init>(I)V

    iput-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mRdsData:Landroid/hardware/fmradio/FmRxRdsData;

    :goto_1
    move v2, v1

    .restart local v2       #status:I
    goto :goto_0

    .end local v2           #status:I
    :cond_3
    const/4 v1, 0x0

    const-string v3, "FmTransmitter"

    const-string v4, "enable: failed to turn On FM TX"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "FmTransmitter"

    const-string v4, "enable: CURRENT-STATE : FMTxStarting ---> NEW-STATE : FMOff"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x0

    invoke-static {v3}, Landroid/hardware/fmradio/FmTransmitter;->setFMPowerState(I)V

    goto :goto_1
.end method

.method public getFMState()I
    .locals 1

    .prologue
    invoke-static {}, Landroid/hardware/fmradio/FmTransceiver;->getFMPowerState()I

    move-result v0

    .local v0, currFMState:I
    return v0
.end method

.method public getPSFeatures()Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    .locals 2

    .prologue
    new-instance v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;

    invoke-direct {v0, p0}, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;-><init>(Landroid/hardware/fmradio/FmTransmitter;)V

    .local v0, psFeatures:Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    const/16 v1, 0x61

    iput v1, v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;->maxPSCharacters:I

    const/16 v1, 0xf

    iput v1, v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;->maxPSStringRepeatCount:I

    return-object v0
.end method

.method public getRdsGroupBufSize()I
    .locals 1

    .prologue
    const/16 v0, 0x3e

    return v0
.end method

.method public reset()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .local v0, status:Z
    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->unregisterTransmitClient()Z

    move-result v0

    return v0
.end method

.method public setPowerMode(I)Z
    .locals 5
    .parameter "powerMode"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    iget-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mControl:Landroid/hardware/fmradio/FmRxControls;

    sget v4, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-virtual {v3, v4, v1}, Landroid/hardware/fmradio/FmRxControls;->setLowPwrMode(IZ)I

    move-result v0

    .local v0, re:I
    :goto_0
    if-nez v0, :cond_1

    :goto_1
    return v1

    .end local v0           #re:I
    :cond_0
    iget-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mControl:Landroid/hardware/fmradio/FmRxControls;

    sget v4, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-virtual {v3, v4, v2}, Landroid/hardware/fmradio/FmRxControls;->setLowPwrMode(IZ)I

    move-result v0

    .restart local v0       #re:I
    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public setRdsOn()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mRdsData:Landroid/hardware/fmradio/FmRxRdsData;

    if-nez v3, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v3, p0, Landroid/hardware/fmradio/FmTransmitter;->mRdsData:Landroid/hardware/fmradio/FmRxRdsData;

    invoke-virtual {v3, v2}, Landroid/hardware/fmradio/FmRxRdsData;->rdsOn(Z)I

    move-result v0

    .local v0, re:I
    if-nez v0, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public setStation(I)Z
    .locals 4
    .parameter "frequencyKHz"

    .prologue
    const/4 v0, 0x0

    .local v0, status:Z
    iget-boolean v2, p0, Landroid/hardware/fmradio/FmTransmitter;->mPSStarted:Z

    if-eqz v2, :cond_0

    const-string v2, "FmTransmitter"

    const-string v3, "FmTransmitter:setStation mPSStarted"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->stopPSInfo()Z

    move-result v2

    if-nez v2, :cond_0

    move v1, v0

    .end local v0           #status:Z
    .local v1, status:I
    :goto_0
    return v1

    .end local v1           #status:I
    .restart local v0       #status:Z
    :cond_0
    iget-boolean v2, p0, Landroid/hardware/fmradio/FmTransmitter;->mRTStarted:Z

    if-eqz v2, :cond_1

    const-string v2, "FmTransmitter"

    const-string v3, "FmTransmitter:setStation mRTStarted"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->stopRTInfo()Z

    move-result v2

    if-nez v2, :cond_1

    move v1, v0

    .restart local v1       #status:I
    goto :goto_0

    .end local v1           #status:I
    :cond_1
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Landroid/hardware/fmradio/FmTransmitter;->transmitRdsGroupControl(I)Z

    move-result v2

    if-nez v2, :cond_2

    move v1, v0

    .restart local v1       #status:I
    goto :goto_0

    .end local v1           #status:I
    :cond_2
    const-string v2, "FmTransmitter"

    const-string v3, "FmTrasmitter:SetStation\n"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1}, Landroid/hardware/fmradio/FmTransceiver;->setStation(I)Z

    move-result v0

    move v1, v0

    .restart local v1       #status:I
    goto :goto_0
.end method

.method public setTxPowerLevel(I)Z
    .locals 4
    .parameter "powLevel"

    .prologue
    const/4 v0, 0x1

    .local v0, bStatus:Z
    sget v2, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v2, p1}, Landroid/hardware/fmradio/FmReceiverJNI;->setTxPowerLevelNative(II)I

    move-result v1

    .local v1, err:I
    if-gez v1, :cond_0

    const-string v2, "FmTransmitter"

    const-string v3, "setTxPowerLevel is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .end local v0           #bStatus:Z
    :cond_0
    return v0
.end method

.method public startPSInfo(Ljava/lang/String;III)Z
    .locals 6
    .parameter "psStr"
    .parameter "pty"
    .parameter "pi"
    .parameter "repeatCount"

    .prologue
    const/16 v4, 0x61

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-ltz p2, :cond_0

    const/16 v3, 0x1f

    if-le p2, v3, :cond_1

    :cond_0
    const-string v2, "FmTransmitter"

    const-string v3, "pTy is expected from 0 to 31"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_1
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v3, p2}, Landroid/hardware/fmradio/FmReceiverJNI;->setPTYNative(II)I

    move-result v0

    .local v0, err:I
    if-gez v0, :cond_2

    const-string v2, "FmTransmitter"

    const-string v3, "setPTYNative is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    if-ltz p3, :cond_3

    const v3, 0xffff

    if-le p3, v3, :cond_4

    :cond_3
    const-string v2, "FmTransmitter"

    const-string v3, "pi is expected from 0 to 65535"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v3, p3}, Landroid/hardware/fmradio/FmReceiverJNI;->setPINative(II)I

    move-result v0

    if-gez v0, :cond_5

    const-string v2, "FmTransmitter"

    const-string v3, "setPINative is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_5
    if-ltz p4, :cond_6

    const/16 v3, 0xf

    if-le p4, v3, :cond_7

    :cond_6
    const-string v2, "FmTransmitter"

    const-string v3, "repeat count is expected from 0 to 15"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_7
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v3, p4}, Landroid/hardware/fmradio/FmReceiverJNI;->setPSRepeatCountNative(II)I

    move-result v0

    if-gez v0, :cond_8

    const-string v2, "FmTransmitter"

    const-string v3, "setPSRepeatCountNative is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_9

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_9
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, p1, v4}, Landroid/hardware/fmradio/FmReceiverJNI;->startPSNative(ILjava/lang/String;I)I

    move-result v0

    const-string v3, "FmTransmitter"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "return for startPS is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gez v0, :cond_a

    const-string v2, "FmTransmitter"

    const-string v3, "FmReceiverJNI.startPSNative returned false\n"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_a
    const-string v1, "FmTransmitter"

    const-string v3, "startPSNative is successful"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Landroid/hardware/fmradio/FmTransmitter;->mPSStarted:Z

    move v1, v2

    goto/16 :goto_0
.end method

.method public startRTInfo(Ljava/lang/String;II)Z
    .locals 5
    .parameter "rtStr"
    .parameter "pty"
    .parameter "pi"

    .prologue
    const/16 v4, 0x3f

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-ltz p2, :cond_0

    const/16 v3, 0x1f

    if-le p2, v3, :cond_1

    :cond_0
    const-string v2, "FmTransmitter"

    const-string v3, "pTy is expected from 0 to 31"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_1
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v3, p2}, Landroid/hardware/fmradio/FmReceiverJNI;->setPTYNative(II)I

    move-result v0

    .local v0, err:I
    if-gez v0, :cond_2

    const-string v2, "FmTransmitter"

    const-string v3, "setPTYNative is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    if-ltz p3, :cond_3

    const v3, 0xffff

    if-le p3, v3, :cond_4

    :cond_3
    const-string v2, "FmTransmitter"

    const-string v3, "pi is expected from 0 to 65535"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v3, p3}, Landroid/hardware/fmradio/FmReceiverJNI;->setPINative(II)I

    move-result v0

    if-gez v0, :cond_5

    const-string v2, "FmTransmitter"

    const-string v3, "setPINative is failure"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_6

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_6
    sget v3, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, p1, v4}, Landroid/hardware/fmradio/FmReceiverJNI;->startRTNative(ILjava/lang/String;I)I

    move-result v0

    if-gez v0, :cond_7

    const-string v2, "FmTransmitter"

    const-string v3, "FmReceiverJNI.startRTNative returned false\n"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_7
    const-string v1, "FmTransmitter"

    const-string v3, "mRTStarted is true"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Landroid/hardware/fmradio/FmTransmitter;->mRTStarted:Z

    move v1, v2

    goto :goto_0
.end method

.method public stopPSInfo()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .local v0, err:I
    sget v2, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v2}, Landroid/hardware/fmradio/FmReceiverJNI;->stopPSNative(I)I

    move-result v0

    if-gez v0, :cond_0

    const-string v2, "FmTransmitter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "return for startPS is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_0
    const-string v2, "FmTransmitter"

    const-string v3, "stopPSNative is successful"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v1, p0, Landroid/hardware/fmradio/FmTransmitter;->mPSStarted:Z

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public stopRTInfo()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    sget v1, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-static {v1}, Landroid/hardware/fmradio/FmReceiverJNI;->stopRTNative(I)I

    move-result v1

    if-gez v1, :cond_0

    const-string v1, "FmTransmitter"

    const-string v2, "stopRTNative is failure"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v0

    :cond_0
    const-string v1, "FmTransmitter"

    const-string v2, "mRTStarted is false"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v0, p0, Landroid/hardware/fmradio/FmTransmitter;->mRTStarted:Z

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public transmitRdsContGroups([BJ)I
    .locals 1
    .parameter "rdsGroups"
    .parameter "numGroupsToTransmit"

    .prologue
    const/4 v0, -0x1

    return v0
.end method

.method public transmitRdsGroupControl(I)Z
    .locals 2
    .parameter "ctrlCmd"

    .prologue
    const/4 v0, 0x1

    .local v0, bStatus:Z
    const/4 v1, 0x0

    .local v1, val:I
    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x0

    :pswitch_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public transmitRdsGroups([BJ)I
    .locals 1
    .parameter "rdsGroups"
    .parameter "numGroupsToTransmit"

    .prologue
    const/4 v0, -0x1

    return v0
.end method
