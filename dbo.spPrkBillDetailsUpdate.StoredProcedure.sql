USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsUpdate]
  @SerialNo Int,
  @BillNo NVarChar(20),
  @BillDate DateTime,
  @Particulars NVarChar(250),
  @Quantity Decimal(18,2),
  @Amount Decimal(18,2),
  @Original_AttachmentID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_BillDetails] SET 
   [SerialNo] = @SerialNo
  ,[BillNo] = @BillNo
  ,[BillDate] = @BillDate
  ,[Particulars] = @Particulars
  ,[Quantity] = @Quantity
  ,[Amount] = @Amount
  WHERE
  [AttachmentID] = @Original_AttachmentID
  SET @RowCount = @@RowCount
GO
