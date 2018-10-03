USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransporterBillUpdate]
  @Original_IRNo Int, 
  @IRNo Int,
  @IRDescription NVarChar(50),
  @ISGECPONumber NVarChar(10),
  @ISGECPODate DateTime,
  @ISGECPOAmount Decimal(18,2),
  @TransporterID NVarChar(9),
  @TransporterBillNo NVarChar(20),
  @TransporterBillDate DateTime,
  @BillAmount Decimal(18,2),
  @BillReceivedOn DateTime,
  @BillReceivedBy NVarChar(8),
  @BillReceiverDivisionID NVarChar(6),
  @BillStatusID Int,
  @DiscripantBill Bit,
  @BillReturnRemarks NVarChar(100),
  @BillReturnedOn DateTime,
  @BillReturneddBy NVarChar(8),
  @ReceiptNo NVarChar(10),
  @ReceiptDate DateTime,
  @ReceiptLine NVarChar(4),
  @PassedAmount Decimal(18,2),
  @ForwardedToAccount Bit,
  @ForwardedOn DateTime,
  @ForwardedBy NVarChar(8),
  @ReceiptAcknowledgement Bit,
  @ReceiptAcknowledgedOn DateTime,
  @ReceiptAcknowledgedBy NVarChar(8),
  @DiscripantReceipt Bit,
  @ReceiptReturnedOn DateTime,
  @ReceiptReturnedBy NVarChar(8),
  @ReceiptReturnRemarks NVarChar(100),
  @SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_TransporterBill] SET 
   [IRNo] = @IRNo
  ,[IRDescription] = @IRDescription
  ,[ISGECPONumber] = @ISGECPONumber
  ,[ISGECPODate] = @ISGECPODate
  ,[ISGECPOAmount] = @ISGECPOAmount
  ,[TransporterID] = @TransporterID
  ,[TransporterBillNo] = @TransporterBillNo
  ,[TransporterBillDate] = @TransporterBillDate
  ,[BillAmount] = @BillAmount
  ,[BillReceivedOn] = @BillReceivedOn
  ,[BillReceivedBy] = @BillReceivedBy
  ,[BillReceiverDivisionID] = @BillReceiverDivisionID
  ,[BillStatusID] = @BillStatusID
  ,[DiscripantBill] = @DiscripantBill
  ,[BillReturnRemarks] = @BillReturnRemarks
  ,[BillReturnedOn] = @BillReturnedOn
  ,[BillReturneddBy] = @BillReturneddBy
  ,[ReceiptNo] = @ReceiptNo
  ,[ReceiptDate] = @ReceiptDate
  ,[ReceiptLine] = @ReceiptLine
  ,[PassedAmount] = @PassedAmount
  ,[ForwardedToAccount] = @ForwardedToAccount
  ,[ForwardedOn] = @ForwardedOn
  ,[ForwardedBy] = @ForwardedBy
  ,[ReceiptAcknowledgement] = @ReceiptAcknowledgement
  ,[ReceiptAcknowledgedOn] = @ReceiptAcknowledgedOn
  ,[ReceiptAcknowledgedBy] = @ReceiptAcknowledgedBy
  ,[DiscripantReceipt] = @DiscripantReceipt
  ,[ReceiptReturnedOn] = @ReceiptReturnedOn
  ,[ReceiptReturnedBy] = @ReceiptReturnedBy
  ,[ReceiptReturnRemarks] = @ReceiptReturnRemarks
  ,[SerialNo] = @SerialNo
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
