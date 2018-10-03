USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillUpdate]
  @Original_IRNo Int, 
  @ReceivedOn DateTime,
  @VendorID NVarChar(6),
  @VendorBillNo NVarChar(30),
  @VendorBillDate DateTime,
  @BillDistance Decimal(10,2),
  @BillHours Decimal(10,2),
  @BillAmount Decimal(10,2),
  @PassedDistance Decimal(10,2),
  @PassedHours Decimal(10,2),
  @PassedAmount Decimal(10,2),
  @Remarks NVarChar(250),
  @BillCorrected Bit,
  @StatusID Int,
  @PostedInBaaN Bit,
  @PostedOn DateTime,
  @PostedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_IRDocs] SET 
   [ReceivedOn] = @ReceivedOn
  ,[VendorID] = @VendorID
  ,[VendorBillNo] = @VendorBillNo
  ,[VendorBillDate] = @VendorBillDate
  ,[BillDistance] = @BillDistance
  ,[BillHours] = @BillHours
  ,[BillAmount] = @BillAmount
  ,[PassedDistance] = @PassedDistance
  ,[PassedHours] = @PassedHours
  ,[PassedAmount] = @PassedAmount
  ,[Remarks] = @Remarks
  ,[BillCorrected] = @BillCorrected
  ,[StatusID] = @StatusID
  ,[PostedInBaaN] = @PostedInBaaN
  ,[PostedOn] = @PostedOn
  ,[PostedBy] = @PostedBy
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
