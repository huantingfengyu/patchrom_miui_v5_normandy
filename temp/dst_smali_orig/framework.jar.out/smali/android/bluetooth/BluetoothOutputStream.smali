.class final Landroid/bluetooth/BluetoothOutputStream;
.super Ljava/io/OutputStream;
.source "BluetoothOutputStream.java"


# instance fields
.field private mSocket:Landroid/bluetooth/BluetoothSocket;


# direct methods
.method constructor <init>(Landroid/bluetooth/BluetoothSocket;)V
    .locals 0
    .parameter "s"

    .prologue
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    iput-object p1, p0, Landroid/bluetooth/BluetoothOutputStream;->mSocket:Landroid/bluetooth/BluetoothSocket;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Landroid/bluetooth/BluetoothOutputStream;->mSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V

    return-void
.end method

.method public write(I)V
    .locals 4
    .parameter "oneByte"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [B

    .local v0, b:[B
    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v1, p0, Landroid/bluetooth/BluetoothOutputStream;->mSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1, v0, v2, v3}, Landroid/bluetooth/BluetoothSocket;->write([BII)I

    return-void
.end method

.method public write([BII)V
    .locals 4
    .parameter "b"
    .parameter "offset"
    .parameter "count"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "buffer is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    or-int v1, p2, p3

    if-ltz v1, :cond_1

    array-length v1, p1

    sub-int/2addr v1, p2

    if-le p3, v1, :cond_2

    :cond_1
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "invalid offset or length"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    const/4 v0, 0x0

    .local v0, written:I
    :goto_0
    if-ge v0, p3, :cond_3

    iget-object v1, p0, Landroid/bluetooth/BluetoothOutputStream;->mSocket:Landroid/bluetooth/BluetoothSocket;

    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-virtual {v1, p1, v2, v3}, Landroid/bluetooth/BluetoothSocket;->write([BII)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_3
    return-void
.end method
