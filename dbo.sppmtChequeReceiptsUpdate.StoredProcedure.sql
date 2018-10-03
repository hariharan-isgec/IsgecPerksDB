USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtChequeReceiptsUpdate]
  @Original_CQRNo Int, 
  @CQNumber NVarChar(50),
  @CQDate DateTime,
  @CQAmount Decimal(10,2),
  @VendorID NVarChar(6),
  @StatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_CQReceipts] SET 
   [CQNumber] = @CQNumber
  ,[CQDate] = @CQDate
  ,[CQAmount] = @CQAmount
  ,[VendorID] = @VendorID
  ,[StatusID] = @StatusID
  WHERE
  [CQRNo] = @Original_CQRNo
  SET @RowCount = @@RowCount
GO
