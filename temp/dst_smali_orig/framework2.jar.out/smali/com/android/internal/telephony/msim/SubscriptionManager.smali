.class public Lcom/android/internal/telephony/msim/SubscriptionManager;
.super Landroid/os/Handler;
.source "SubscriptionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;,
        Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;,
        Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    }
.end annotation


# static fields
.field private static final EVENT_ALL_CARD_INFO_AVAILABLE:I = 0x2

.field private static final EVENT_ALL_DATA_DISCONNECTED:I = 0x8

.field private static final EVENT_CARD_INFO_AVAILABLE:I = 0x0

.field private static final EVENT_CARD_INFO_NOT_AVAILABLE:I = 0x1

.field private static final EVENT_CLEANUP_DATA_CONNECTION_DONE:I = 0x7

.field private static final EVENT_PROCESS_AVAILABLE_CARDS:I = 0xb

.field private static final EVENT_RADIO_OFF_OR_NOT_AVAILABLE:I = 0xa

.field private static final EVENT_RADIO_ON:I = 0x9

.field private static final EVENT_SET_DATA_SUBSCRIPTION_DONE:I = 0x6

.field private static final EVENT_SET_SUBSCRIPTION_MODE_DONE:I = 0x3

.field private static final EVENT_SET_UICC_SUBSCRIPTION_DONE:I = 0x4

.field private static final EVENT_SUBSCRIPTION_STATUS_CHANGED:I = 0x5

.field static final LOG_TAG:Ljava/lang/String; = "SubscriptionManager"

.field public static NUM_SUBSCRIPTIONS:I = 0x0

.field public static final SUB_ACTIVATE_FAILED:Ljava/lang/String; = "ACTIVATE FAILED"

.field public static final SUB_ACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "ACTIVATE NOT SUPPORTED"

.field public static final SUB_ACTIVATE_SUCCESS:Ljava/lang/String; = "ACTIVATE SUCCESS"

.field public static final SUB_DEACTIVATE_FAILED:Ljava/lang/String; = "DEACTIVATE FAILED"

.field public static final SUB_DEACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "DEACTIVATE NOT SUPPORTED"

.field public static final SUB_DEACTIVATE_SUCCESS:Ljava/lang/String; = "DEACTIVATE SUCCESS"

.field public static final SUB_NOT_CHANGED:Ljava/lang/String; = "NO CHANGE IN SUBSCRIPTION"

.field private static final SUB_STATUS_ACTIVATED:I = 0x1

.field private static final SUB_STATUS_DEACTIVATED:I

.field private static USER_PREF_SUB_FIELDS:I

.field private static sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;


# instance fields
.field private mActivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mAllCardsStatusAvailable:Z

.field private mCardInfoAvailable:[Z

.field private mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

.field private mCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private mContext:Landroid/content/Context;

.field private mCurrentDds:I

.field private mCurrentSubscriptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDataActive:Z

.field private mDeactivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mDisableDdsInProgress:Z

.field private mIsNewCard:[Z

.field private mQueuedDds:I

.field private mRadioOn:[Z

.field private mSetDdsCompleteMsg:Landroid/os/Message;

.field private mSetDdsRequired:Z

.field private mSetSubsModeRequired:Z

.field private mSetSubscriptionInProgress:Z

.field private mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

.field private mSubActivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubResult:[Ljava/lang/String;

.field private mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x2

    sput v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    const/4 v0, 0x6

    sput v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 11
    .parameter "context"
    .parameter "uiccController"
    .parameter "ci"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-object v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    new-array v5, v8, [Z

    fill-array-data v5, :array_0

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    new-array v5, v8, [Z

    fill-array-data v5, :array_1

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    new-instance v5, Landroid/os/RegistrantList;

    invoke-direct {v5}, Landroid/os/RegistrantList;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    sget v5, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    new-array v5, v8, [Z

    fill-array-data v5, :array_2

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    const-string v5, "Constructor - Enter"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getUserPreferredSubs()V

    invoke-static {p1, p2, p3}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getInstance(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    move-result-object v5

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v8, :cond_0

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v1, p0, v7, v6}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForCardInfoAvailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v1, p0, v10, v6}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForCardInfoUnavailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v5, p0, v8, v9}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForAllCardsInfoAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iput-object p3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    const/4 v1, 0x0

    :goto_1
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v5, v5

    if-ge v1, v5, :cond_1

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/4 v6, 0x5

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForSubscriptionStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/16 v6, 0xa

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/16 v6, 0x9

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    new-array v5, v8, [Landroid/os/RegistrantList;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    new-array v5, v8, [Landroid/os/RegistrantList;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v8, :cond_2

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/RegistrantList;

    invoke-direct {v6}, Landroid/os/RegistrantList;-><init>()V

    aput-object v6, v5, v1

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/RegistrantList;

    invoke-direct {v6}, Landroid/os/RegistrantList;-><init>()V

    aput-object v6, v5, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_3
    if-ge v2, v3, :cond_3

    aget-object v4, v0, v2

    .local v4, t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .end local v4           #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v5

    iput v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "In MSimProxyManager constructor current active dds is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    array-length v3, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v3, :cond_4

    aget-object v4, v0, v2

    .restart local v4       #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    new-instance v6, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    invoke-direct {v6, p0}, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;)V

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .end local v4           #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    const-string v5, "Constructor - Exit"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    return-void

    nop

    :array_0
    .array-data 0x1
        0x0t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 0x1
        0x0t
        0x0t
    .end array-data

    nop

    :array_2
    .array-data 0x1
        0x0t
        0x0t
    .end array-data
.end method

.method private getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;
    .locals 1
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/msim/Subscription;

    return-object v0
.end method

.method private getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z
    .locals 1
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    return v0
.end method

.method private getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    .locals 1
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    return-object v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/msim/SubscriptionManager;
    .locals 2
    .parameter "context"
    .parameter "uiccController"
    .parameter "ci"

    .prologue
    const-string v0, "SubscriptionManager"

    const-string v1, "getInstance"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/internal/telephony/msim/SubscriptionManager;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    return-object v0
.end method

.method private getSetSubscriptionResults()[Ljava/lang/String;
    .locals 4

    .prologue
    sget v2, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    new-array v1, v2, [Ljava/lang/String;

    .local v1, result:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private getUserPreferredSubs()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, -0x1

    const/4 v1, 0x0

    .local v1, errorOnParsing:Z
    new-instance v8, Lcom/android/internal/telephony/msim/SubscriptionData;

    sget v9, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/msim/SubscriptionData;-><init>(I)V

    iput-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    sget v8, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v3, v8, :cond_7

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v9, v9, v3

    invoke-static {v8, v9}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, strUserSub:Ljava/lang/String;
    if-eqz v6, :cond_3

    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: strUserSub = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    const-string v8, ","

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .local v5, splitUserSub:[Ljava/lang/String;
    array-length v8, v5

    sget v9, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    if-ne v8, v9, :cond_6

    const/4 v8, 0x0

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x0

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    :cond_0
    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x1

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    :cond_1
    const/4 v8, 0x2

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x2

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    :cond_2
    const/4 v8, 0x3

    :try_start_1
    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .local v7, subStatus:I
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    invoke-static {}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->values()[Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v9

    aget-object v9, v9, v7

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v7           #subStatus:I
    :goto_1
    :try_start_2
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x4

    aget-object v9, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x5

    aget-object v9, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_3 .. :try_end_3} :catch_1

    .end local v5           #splitUserSub:[Ljava/lang/String;
    :cond_3
    :goto_3
    if-eqz v6, :cond_4

    if-eqz v1, :cond_5

    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ",,,"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v9}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, defaultUserSub:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v9, v9, v3

    invoke-static {v8, v9, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v11, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v11, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    .end local v0           #defaultUserSub:Ljava/lang/String;
    :cond_5
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v3, v8, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getUserPreferredSubs: mUserPrefSubs.subscription["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v9, v9, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .restart local v5       #splitUserSub:[Ljava/lang/String;
    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/NumberFormatException;
    :try_start_4
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    :try_end_4
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1

    .end local v2           #ex:Ljava/lang/NumberFormatException;
    .end local v5           #splitUserSub:[Ljava/lang/String;
    :catch_1
    move-exception v4

    .local v4, pe:Ljava/util/regex/PatternSyntaxException;
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: PatternSyntaxException while split : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    goto/16 :goto_3

    .end local v4           #pe:Ljava/util/regex/PatternSyntaxException;
    .restart local v5       #splitUserSub:[Ljava/lang/String;
    :catch_2
    move-exception v2

    .restart local v2       #ex:Ljava/lang/NumberFormatException;
    :try_start_5
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs:m3gppIndex: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, -0x1

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    goto/16 :goto_2

    .end local v2           #ex:Ljava/lang/NumberFormatException;
    :catch_3
    move-exception v2

    .restart local v2       #ex:Ljava/lang/NumberFormatException;
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs:m3gpp2Index: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, -0x1

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    goto/16 :goto_3

    .end local v2           #ex:Ljava/lang/NumberFormatException;
    :cond_6
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: splitUserSub.length != "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget v10, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_5 .. :try_end_5} :catch_1

    const/4 v1, 0x1

    goto/16 :goto_3

    .end local v5           #splitUserSub:[Ljava/lang/String;
    .end local v6           #strUserSub:Ljava/lang/String;
    :cond_7
    return-void
.end method

.method private isAllCardsInfoAvailable()Z
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v4, 0x1

    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    .local v0, arr$:[Z
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-boolean v1, v0, v2

    .local v1, available:Z
    if-eqz v4, :cond_0

    if-eqz v1, :cond_0

    move v4, v5

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move v4, v6

    goto :goto_1

    .end local v1           #available:Z
    :cond_1
    if-nez v4, :cond_2

    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    if-eqz v7, :cond_3

    :cond_2
    move v6, v5

    :cond_3
    return v6
.end method

.method private isAllRadioOn()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    .local v0, arr$:[Z
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-boolean v3, v0, v1

    .local v3, radioOn:Z
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    const/4 v4, 0x1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .end local v3           #radioOn:Z
    :cond_1
    return v4
.end method

.method private isAnyPendingActivateRequest(I)Z
    .locals 3
    .parameter "subId"

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/Subscription;

    .local v0, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isNewCardAvailable()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    .local v0, arr$:[Z
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_2

    aget-boolean v2, v0, v1

    .local v2, isNew:Z
    if-nez v4, :cond_0

    if-eqz v2, :cond_1

    :cond_0
    const/4 v4, 0x1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .end local v2           #isNew:Z
    :cond_2
    return v4
.end method

.method private isPresentInActivatePendingList(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 6
    .parameter "userSub"

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    .local v1, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/Subscription;

    .local v0, actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/msim/Subscription;->isSame(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    .end local v0           #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_1
    return v5

    .restart local v0       #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v4       #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0           #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .parameter "string"

    .prologue
    const-string v0, "SubscriptionManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .parameter "string"

    .prologue
    const-string v0, "SubscriptionManager"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private notifyIfAnyNewCardsAvailable()V
    .locals 3

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isNewCardAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyNewCardsAvailable()V

    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v0           #i:I
    :cond_0
    return-void
.end method

.method private notifySubscriptionActivated(I)V
    .locals 1
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    return-void
.end method

.method private notifySubscriptionDeactivated(I)V
    .locals 1
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    return-void
.end method

.method private printPendingActivateRequests()V
    .locals 7

    .prologue
    const-string v5, "ActivatePending Queue : "

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/msim/Subscription;

    .local v3, newSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v3           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    return-void
.end method

.method private printPendingDeactivateRequests()V
    .locals 7

    .prologue
    const-string v5, "DeactivatePending Queue : "

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/msim/Subscription;

    .local v3, newSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v3           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    return-void
.end method

.method private processActivateRequests()V
    .locals 2

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "processActivateRequests: mSetSubscriptionInProgress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mSetSubsModeRequired = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setSubscriptionMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    goto :goto_0
.end method

.method private processAllCardsInfoAvailable()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "processAllCardsInfoAvailable: Radio Not Available "

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    .local v0, availableCards:I
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v3, :cond_3

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v2, v2, v1

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v2, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->isCardAbsentOrError(I)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    if-ne v0, v3, :cond_4

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v2, :cond_4

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    :cond_4
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processAllDataDisconnected(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    if-nez p1, :cond_1

    const-string v2, "processAllDataDisconnected: ar is null!! return!!"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .local v0, sub:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processAllDataDisconnected: sub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3, p0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->unregisterForAllDataDisconnected(ILandroid/os/Handler;)V

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    if-eqz v2, :cond_2

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processDisableDataConnectionDone(Landroid/os/AsyncResult;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aget-object v1, v2, v3

    .local v1, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processAllDataDisconnected: subscriptionReadiness["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->triggerUpdateFromAvaialbleCards()V

    goto :goto_0
.end method

.method private processAvailableCards()V
    .locals 2

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "processAvailableCards: Radio Not Available "

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v1, :cond_1

    const-string v1, "processAvailableCards: set subscription in progress!!"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .local v0, cardIndex:I
    :goto_1
    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateActivatePendingList(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processCardInfoAvailable(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .local v0, cardIndex:Ljava/lang/Integer;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-boolean v1, v1, v2

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: Radio Not Available on cardIndex = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    aput-boolean v3, v1, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: CARD:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is available"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateActivatePendingList(I)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllCardsInfoAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "All cards info not available!! Waiting for all info before processing"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: mSetSubscriptionInProgress = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processCardInfoNotAvailable(Landroid/os/AsyncResult;)V
    .locals 10
    .parameter "ar"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v8, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v8, :cond_0

    iget-object v8, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-nez v8, :cond_2

    :cond_0
    const-string v6, "processCardInfoNotAvailable - Exception"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v1, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .local v1, cardIndex:Ljava/lang/Integer;
    iget-object v4, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    .local v4, reason:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "processCardInfoNotAvailable on cardIndex = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " reason = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    aput-boolean v7, v8, v9

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v8, v8, v7

    if-nez v8, :cond_5

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v8, v8, v6

    if-nez v8, :cond_5

    :goto_1
    iput-boolean v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processCardInfoNotAvailable mSetSubsModeRequired = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-eq v4, v6, :cond_3

    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_SIM_REFRESH_RESET:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-ne v4, v6, :cond_6

    :cond_3
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_2
    if-ge v2, v3, :cond_6

    aget-object v5, v0, v2

    .local v5, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v6

    iget v6, v6, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v6, v8, :cond_4

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    invoke-virtual {v5}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v0           #arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_5
    move v6, v7

    goto :goto_1

    :cond_6
    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-ne v4, v6, :cond_1

    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    goto/16 :goto_0
.end method

.method private processCleanupDataConnectionDone(Ljava/lang/Integer;)V
    .locals 2
    .parameter "subId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "processCleanupDataConnectionDone: Radio Not Available on subId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    goto :goto_0
.end method

.method private processDisableDataConnectionDone(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setDataSubscription(I)V

    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->updateDataConnectionTracker(I)V

    :cond_0
    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    iput v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->updateDataConnectionTracker(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setDataSubscriptionSource is Successful  Enable Data Connectivity on Subscription "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    const-string v0, "Enable Data Connectivity Done!! Sending the cnf back!"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    iput-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    :cond_1
    return-void

    :cond_2
    const-string v0, "SubscriptionManager"

    const-string v1, "Disabling Data Subscription Failed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V
    .locals 5
    .parameter "ar"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const-string v0, "Register for the all data disconnect"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    const/16 v2, 0x8

    new-instance v3, Ljava/lang/Integer;

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, p0, v2, v3}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "SubscriptionManager"

    const-string v1, "setDataSubscriptionSource Failed : "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    const-string v0, "posting failure message"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    iput-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    goto :goto_0
.end method

.method private processSetSubscriptionModeDone()V
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "processSetSubscriptionModeDone: Radio Not Available"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    goto :goto_0
.end method

.method private processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V
    .locals 10
    .parameter "ar"

    .prologue
    const/4 v6, 0x0

    const/4 v9, 0x0

    iget-object v3, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    .local v3, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x0

    .local v0, cause:Ljava/lang/String;
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .local v4, subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    const/4 v1, 0x0

    .local v1, currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-boolean v5, v5, v7

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processSetUiccSubscriptionDone: Radio Not Available on subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v5, :cond_a

    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    instance-of v5, v5, Lcom/android/internal/telephony/CommandException;

    if-eqz v5, :cond_2

    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v5, Lcom/android/internal/telephony/CommandException;

    check-cast v5, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v2

    .local v2, error:Lcom/android/internal/telephony/CommandException$Error;
    if-eqz v2, :cond_2

    sget-object v5, Lcom/android/internal/telephony/CommandException$Error;->SUBSCRIPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v2, v5, :cond_2

    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_5

    const-string v0, "ACTIVATE NOT SUPPORTED"

    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_2
    :goto_1
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_6

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Activate Failed"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    if-nez v0, :cond_3

    const-string v0, "ACTIVATE FAILED"

    :cond_3
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_2
    const-string v5, "set uicc subscription done. update the current subscriptions"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5, v1, v4, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateCurrentSubscription(ILcom/android/internal/telephony/msim/Subscription;Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Ljava/lang/String;)V

    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v5, :cond_d

    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->saveUserPreferredSubscription(ILcom/android/internal/telephony/msim/Subscription;)V

    :goto_3
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aput-object v0, v5, v7

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v5

    if-nez v5, :cond_0

    iput-boolean v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/AsyncResult;

    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    invoke-direct {v6, v9, v7, v9}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v5, v6}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .restart local v2       #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_5
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_2

    const-string v0, "DEACTIVATE NOT SUPPORTED"

    goto/16 :goto_1

    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_6
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_9

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Deactivate Failed"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    if-nez v0, :cond_7

    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAnyPendingActivateRequest(I)Z

    move-result v5

    if-eqz v5, :cond_8

    const-string v0, "ACTIVATE FAILED"

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    :goto_4
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    if-ne v5, v7, :cond_4

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v5

    iget v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v5, v7}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    goto/16 :goto_2

    :cond_8
    const-string v0, "DEACTIVATE FAILED"

    goto :goto_4

    :cond_9
    const-string v5, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_a
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_b

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Activated"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    const-string v0, "ACTIVATE SUCCESS"

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    :cond_b
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_c

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Deactivated"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    const-string v0, "DEACTIVATE SUCCESS"

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    goto/16 :goto_2

    :cond_c
    const-string v5, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_d
    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    sget-object v5, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v4, v5, :cond_e

    const/4 v5, 0x1

    :goto_5
    invoke-direct {p0, v7, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    goto/16 :goto_3

    :cond_e
    move v5, v6

    goto :goto_5
.end method

.method private processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V
    .locals 8
    .parameter "ar"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    iget-object v2, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    .local v2, subId:Ljava/lang/Integer;
    iget-object v3, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    aget v0, v3, v5

    .local v0, actStatus:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleSubscriptionStatusChanged sub = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " actStatus = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-boolean v3, v3, v6

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "processSubscriptionStatusChanged: Radio Not Available on subId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v0, v4, :cond_2

    move v3, v4

    :goto_1
    invoke-direct {p0, v6, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    if-ne v0, v4, :cond_3

    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-ne v3, v6, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setDataSubscription on "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iput v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    const/4 v3, 0x6

    new-instance v4, Ljava/lang/Integer;

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-direct {v4, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .local v1, msgSetDdsDone:Landroid/os/Message;
    iget-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    aget-object v3, v3, v4

    invoke-interface {v3, v1}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    iput-boolean v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .end local v1           #msgSetDdsDone:Landroid/os/Message;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionActivated(I)V

    goto :goto_0

    :cond_2
    move v3, v5

    goto :goto_1

    :cond_3
    if-nez v0, :cond_5

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-ne v3, v4, :cond_4

    const-string v3, "Register for the all data disconnect"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x8

    new-instance v6, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3, v4, p0, v5, v6}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_0

    :cond_4
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->triggerUpdateFromAvaialbleCards()V

    goto/16 :goto_0

    :cond_5
    const-string v3, "handleSubscriptionStatusChanged INVALID"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V
    .locals 2
    .parameter "subId"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    return-void
.end method

.method private saveUserPreferredSubscription(ILcom/android/internal/telephony/msim/Subscription;)V
    .locals 4
    .parameter "subIndex"
    .parameter "userPrefSub"

    .prologue
    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge p1, v1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveUserPreferredSubscription: INVALID PARAMETERS: subIndex = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " userPrefSub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v1, v1, p1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v1, v1, p1

    iput p1, v1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    :goto_3
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p2, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, userSub:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveUserPreferredSubscription: userPrefSub = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveUserPreferredSubscription: userSub = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_0

    .end local v0           #userSub:Ljava/lang/String;
    :cond_2
    const-string v1, ""

    goto/16 :goto_1

    :cond_3
    const-string v1, ""

    goto/16 :goto_2

    :cond_4
    const-string v1, ""

    goto/16 :goto_3
.end method

.method private setSubscriptionMode()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    .local v3, numSubsciptions:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v6, v0, v1

    .local v6, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/msim/Subscription;

    .local v4, pendingSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v4, :cond_0

    iget-object v8, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v8, v9, :cond_0

    add-int/lit8 v3, v3, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v4           #pendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v6           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setSubscriptionMode numSubsciptions = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    if-lez v3, :cond_2

    sget v8, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-gt v3, v8, :cond_2

    const/4 v8, 0x3

    const/4 v9, 0x0

    invoke-static {p0, v8, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .local v5, setSubsModeDone:Landroid/os/Message;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v7, v8, v7

    invoke-interface {v7, v3, v5}, Lcom/android/internal/telephony/CommandsInterface;->setSubscriptionMode(ILandroid/os/Message;)V

    const/4 v7, 0x1

    .end local v5           #setSubsModeDone:Landroid/os/Message;
    :cond_2
    return v7
.end method

.method private startNextPendingActivateRequests()Z
    .locals 12

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->printPendingActivateRequests()V

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v6

    .local v6, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v8, v6

    .local v8, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v8, :cond_2

    aget-object v11, v6, v7

    .local v11, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/msim/Subscription;

    .local v9, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v9, :cond_0

    iget-object v0, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    invoke-direct {p0, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->validateActivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, v11, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/internal/telephony/msim/MSimProxyManager;->checkAndUpdatePhoneObject(Lcom/android/internal/telephony/msim/Subscription;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startNextPendingActivateRequests: Activating SUB : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v10, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    iget v0, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v1, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-direct {v10, p0, v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;)V

    .local v10, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x4

    invoke-static {p0, v0, v10}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v1, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v0, v0, v1

    iget v1, v9, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v9}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v4, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    const/4 v0, 0x1

    .end local v5           #msgSetUiccSubDone:Landroid/os/Message;
    .end local v9           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v10           #setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    .end local v11           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_1
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private startNextPendingDeactivateRequests()Z
    .locals 14

    .prologue
    const/4 v13, 0x1

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->printPendingDeactivateRequests()V

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    .local v7, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v9, v7

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v12, v7, v8

    .local v12, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/internal/telephony/msim/Subscription;

    .local v10, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v10, :cond_0

    iget-object v0, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->validateDeactivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startNextPendingDeactivateRequests: Need to deactivating SUB : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    if-eqz v0, :cond_2

    const-string v0, "Deactivate all the data calls if there is any"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    const/4 v0, 0x7

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    .local v6, allDataCleanedUpMsg:Landroid/os/Message;
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1, v6}, Lcom/android/internal/telephony/msim/MSimProxyManager;->disableDataConnectivity(ILandroid/os/Message;)V

    iput-boolean v13, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .end local v6           #allDataCleanedUpMsg:Landroid/os/Message;
    :goto_1
    move v0, v13

    .end local v10           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v12           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_2
    return v0

    .restart local v10       #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v12       #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_2
    const-string v0, "startNextPendingDeactivateRequests: Deactivating now"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v11, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    iget v0, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-direct {v11, p0, v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;)V

    .local v11, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x4

    invoke-static {p0, v0, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v0, v0, v1

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v10}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v4, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    goto :goto_1

    .end local v5           #msgSetUiccSubDone:Landroid/os/Message;
    .end local v10           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v11           #setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    .end local v12           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private triggerUpdateFromAvaialbleCards()V
    .locals 1

    .prologue
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private updateActivatePendingList(I)V
    .locals 7
    .parameter "cardIndex"

    .prologue
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v5, v5, p1

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v5, p1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    .local v0, cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: cardIndex = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n Card Sub Info = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v5, v5, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v4, v5, p1

    .local v4, userSub:Lcom/android/internal/telephony/msim/Subscription;
    iget v3, v4, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .local v3, subId:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v5

    aget-object v5, v5, v3

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    .local v1, currentSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n user pref sub = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n current sub   = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v5, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_0

    iget-object v5, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-eq v5, v6, :cond_0

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->hasSubscription(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isPresentInActivatePendingList(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " need to activate!!!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v2, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .local v2, sub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->getSubscription(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    iput p1, v2, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    iput v3, v2, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    sget-object v5, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v5, v2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-virtual {v5, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v2           #sub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_0
    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->hasSubscription(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v6, 0x0

    aput-boolean v6, v5, p1

    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: mIsNewCard ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    aget-boolean v6, v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .end local v0           #cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v3           #subId:I
    .end local v4           #userSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_1
    return-void

    .restart local v0       #cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v3       #subId:I
    .restart local v4       #userSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_2
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v6, 0x1

    aput-boolean v6, v5, p1

    goto :goto_0
.end method

.method private updateCurrentSubscription(ILcom/android/internal/telephony/msim/Subscription;Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Ljava/lang/String;)V
    .locals 3
    .parameter "subId"
    .parameter "subscription"
    .parameter "subStatus"
    .parameter "cause"

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .local v0, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateCurrentSubscription: subId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " subStatus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n subscription = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne p3, v1, :cond_1

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    :goto_0
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iput-object p3, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-nez p4, :cond_0

    const-string p4, "NO CHANGE IN SUBSCRIPTION"

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iput-object p4, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    return-void

    :cond_1
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    sget-object p3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    goto :goto_0
.end method

.method private updateSubPreferences()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v1, 0x0

    .local v1, activeSubCount:I
    const/4 v0, 0x0

    .local v0, activeSub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    .local v2, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v5, v2

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v6, v2, v4

    .local v6, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v8, v9, :cond_0

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v6           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    if-ne v1, v10, :cond_3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: only SUB:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is Active.  Update the default/voice/sms and data subscriptions"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setVoiceSubscription(I)V

    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setSMSSubscription(I)V

    invoke-static {v11}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setPromptEnabled(Z)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: current defaultSub = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDefaultSubscription()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: current mCurrentDds = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDefaultSubscription()I

    move-result v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-eq v8, v9, :cond_2

    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setDefaultSubscription(I)V

    :cond_2
    iget v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-eq v8, v9, :cond_3

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v7, v8, v9

    .local v7, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v8

    if-eqz v8, :cond_4

    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iput v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    const/4 v8, 0x6

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0, v8, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .local v3, callback:Landroid/os/Message;
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "update setDataSubscription to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v8, v8, v9

    invoke-interface {v8, v3}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    iput-boolean v11, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .end local v3           #callback:Landroid/os/Message;
    .end local v7           #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    :goto_1
    return-void

    .restart local v7       #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iput v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    goto :goto_1
.end method

.method private updateSubscriptionReadiness(IZ)V
    .locals 3
    .parameter "subId"
    .parameter "ready"

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .local v0, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateSubscriptionReadiness("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    goto :goto_0
.end method

.method private validateActivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 3
    .parameter "sub"

    .prologue
    iget-object v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v1, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v2, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private validateDeactivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 3
    .parameter "sub"

    .prologue
    iget-object v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v1, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v2, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getActiveSubscriptionsCount()I
    .locals 8

    .prologue
    const/4 v0, 0x0

    .local v0, activeSubCount:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    .local v1, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    const-string v5, "SubscriptionManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "count of subs activated "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getCurrentSubscription(I)Lcom/android/internal/telephony/msim/Subscription;
    .locals 1
    .parameter "subId"

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .local v1, subId:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_RADIO_OFF_OR_NOT_AVAILABLE on SUB: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v4, v2, v3

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v2

    if-nez v2, :cond_0

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    iput-boolean v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    goto :goto_0

    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .restart local v1       #subId:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_RADIO_ON on SUB: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v5, v2, v3

    goto :goto_0

    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_2
    const-string v2, "EVENT_CARD_INFO_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCardInfoAvailable(Landroid/os/AsyncResult;)V

    goto :goto_0

    :pswitch_3
    const-string v2, "EVENT_CARD_INFO_NOT_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCardInfoNotAvailable(Landroid/os/AsyncResult;)V

    goto :goto_0

    :pswitch_4
    const-string v2, "EVENT_ALL_CARD_INFO_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAllCardsInfoAvailable()V

    goto :goto_0

    :pswitch_5
    const-string v2, "EVENT_SET_SUBSCRIPTION_MODE_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetSubscriptionModeDone()V

    goto/16 :goto_0

    :pswitch_6
    const-string v2, "EVENT_SET_UICC_SUBSCRIPTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    :pswitch_7
    const-string v2, "EVENT_SUBSCRIPTION_STATUS_CHANGED"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    :pswitch_8
    const-string v2, "EVENT_CLEANUP_DATA_CONNECTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCleanupDataConnectionDone(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :pswitch_9
    const-string v2, "EVENT_SET_DATA_SUBSCRIPTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    :pswitch_a
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_ALL_DATA_DISCONNECTED"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAllDataDisconnected(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    :pswitch_b
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_PROCESS_AVAILABLE_CARDS"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAvailableCards()V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_a
        :pswitch_1
        :pswitch_0
        :pswitch_b
    .end packed-switch
.end method

.method public isSetSubscriptionInProgress()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    return v0
.end method

.method public isSubActive(I)Z
    .locals 3
    .parameter "subscription"

    .prologue
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .local v0, currentSelSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method notifyNewCardsAvailable()V
    .locals 3

    .prologue
    const-string v1, "notifyNewCardsAvailable"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, setSubscriptionIntent:Landroid/content/Intent;
    const-string v1, "com.android.phone"

    const-string v2, "com.android.phone.SetSubscription"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "NOTIFY_NEW_CARD_AVAILABLE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public declared-synchronized registerForSetSubscriptionCompleted(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 2
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    monitor-enter p0

    :try_start_0
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .end local v0           #r:Landroid/os/Registrant;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .locals 4
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    :goto_0
    monitor-exit v2

    return-void

    :cond_0
    const-string v1, "SubscriptionManager"

    const-string v3, "registerForSubscriptionActivated: Subscription is not activated"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setDataSubscription(ILandroid/os/Message;)V
    .locals 7
    .parameter "subscription"
    .parameter "onCompleteMsg"

    .prologue
    const/4 v3, 0x0

    .local v3, result:Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setDataSubscription: mCurrentDds = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " new subscription = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    iget-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    if-nez v4, :cond_3

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setDataSubscription: requested SUB:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not yet activated, returning failure"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v4, "Subscription not active"

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .local v0, exception:Ljava/lang/RuntimeException;
    :goto_0
    if-eqz p2, :cond_0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p2, v4, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .end local v0           #exception:Ljava/lang/RuntimeException;
    :cond_0
    :goto_1
    return-void

    :cond_1
    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-eq v4, p1, :cond_2

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/msim/MSimProxyManager;->disableDataConnectivityFlag(I)Z

    move-result v1

    .local v1, flag:Z
    iput-object p2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    iput p1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    const/4 v4, 0x6

    new-instance v5, Ljava/lang/Integer;

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .local v2, msgSetDataSub:Landroid/os/Message;
    const-string v4, "SubscriptionManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Set DDS to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Calling cmd interface setDataSubscription"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    aget-object v4, v4, v5

    invoke-interface {v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    goto :goto_1

    .end local v1           #flag:Z
    .end local v2           #msgSetDataSub:Landroid/os/Message;
    :cond_2
    const-string v4, "Current subscription is same as requested Subscription"

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    const/4 v3, 0x1

    const/4 v0, 0x0

    .restart local v0       #exception:Ljava/lang/RuntimeException;
    goto :goto_0

    .end local v0           #exception:Ljava/lang/RuntimeException;
    :cond_3
    const-string v4, "DDS switch in progress. Sending false"

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v4, "DDS switch in progress"

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .restart local v0       #exception:Ljava/lang/RuntimeException;
    goto :goto_0
.end method

.method public setSubscription(Lcom/android/internal/telephony/msim/SubscriptionData;)Z
    .locals 11
    .parameter "subData"

    .prologue
    const/4 v10, 0x1

    const/4 v7, 0x0

    const/4 v5, 0x0

    .local v5, ret:Z
    iget-boolean v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v8, :cond_0

    :goto_0
    return v7

    :cond_0
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    const-string v9, "NO CHANGE IN SUBSCRIPTION"

    aput-object v9, v8, v7

    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    const-string v8, "NO CHANGE IN SUBSCRIPTION"

    aput-object v8, v7, v10

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_4

    aget-object v6, v0, v2

    .local v6, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    iget-object v8, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v9

    aget-object v8, v8, v9

    invoke-virtual {v7, v8}, Lcom/android/internal/telephony/msim/Subscription;->equals(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Need to deactivate current SUB :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v4, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v4}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .local v4, newSub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v7, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v4           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_1
    :goto_2
    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    iget-object v7, v7, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Need to activate new SUB : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    new-instance v4, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v4}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .restart local v4       #newSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v4           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_3
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_1

    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    iget-object v7, v7, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_1

    goto :goto_2

    .end local v6           #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v7, :cond_5

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v1

    .local v1, deactivateInProgress:Z
    if-eqz v1, :cond_7

    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .end local v1           #deactivateInProgress:Z
    :cond_5
    :goto_3
    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v7, :cond_6

    const/4 v5, 0x1

    :cond_6
    move v7, v5

    goto/16 :goto_0

    .restart local v1       #deactivateInProgress:Z
    :cond_7
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    goto :goto_3
.end method

.method public declared-synchronized unRegisterForSetSubscriptionCompleted(Landroid/os/Handler;)V
    .locals 1
    .parameter "h"

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterForSubscriptionActivated(ILandroid/os/Handler;)V
    .locals 2
    .parameter "subId"
    .parameter "h"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterForSubscriptionDeactivated(ILandroid/os/Handler;)V
    .locals 2
    .parameter "subId"
    .parameter "h"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
