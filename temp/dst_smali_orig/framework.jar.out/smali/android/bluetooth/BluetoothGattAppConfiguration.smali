.class public final Landroid/bluetooth/BluetoothGattAppConfiguration;
.super Ljava/lang/Object;
.source "BluetoothGattAppConfiguration.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/bluetooth/BluetoothGattAppConfiguration;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mPath:Ljava/lang/String;

.field private final mRange:I

.field private final mRole:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Landroid/bluetooth/BluetoothGattAppConfiguration$1;

    invoke-direct {v0}, Landroid/bluetooth/BluetoothGattAppConfiguration$1;-><init>()V

    sput-object v0, Landroid/bluetooth/BluetoothGattAppConfiguration;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .parameter "name"
    .parameter "range"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    iput p2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRange:I

    const/4 v0, 0x1

    iput v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/android/bluetooth/gatt/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mPath:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;II)V
    .locals 2
    .parameter "name"
    .parameter "role"
    .parameter "range"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    iput p2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    iput p3, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRange:I

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/android/bluetooth/gatt/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mPath:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mPath:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    const/4 v1, 0x0

    instance-of v2, p1, Landroid/bluetooth/BluetoothGattAppConfiguration;

    if-eqz v2, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/bluetooth/BluetoothGattAppConfiguration;

    .local v0, config:Landroid/bluetooth/BluetoothGattAppConfiguration;
    iget-object v2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattAppConfiguration;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattAppConfiguration;->getRole()I

    move-result v3

    if-ne v2, v3, :cond_0

    iget v2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRange:I

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattAppConfiguration;->getRange()I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .end local v0           #config:Landroid/bluetooth/BluetoothGattAppConfiguration;
    :cond_0
    return v1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getRange()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRange:I

    return v0
.end method

.method public getRole()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/16 v0, 0x3e9

    .local v0, result:I
    iget-object v1, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    add-int v0, v1, v2

    return v0

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BluetoothGattAppConfiguration [mName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRole:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Landroid/bluetooth/BluetoothGattAppConfiguration;->mRange:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
