.class public Lcom/android/internal/atfwd/AtCmdHandler$PauseEvent;
.super Ljava/lang/Object;
.source "AtCmdHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/atfwd/AtCmdHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PauseEvent"
.end annotation


# instance fields
.field private mTime:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "time"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/android/internal/atfwd/AtCmdHandler$PauseEvent;->mTime:J

    return-void
.end method


# virtual methods
.method public getTime()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/android/internal/atfwd/AtCmdHandler$PauseEvent;->mTime:J

    return-wide v0
.end method
