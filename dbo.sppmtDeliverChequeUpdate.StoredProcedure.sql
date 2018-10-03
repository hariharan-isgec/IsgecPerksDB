USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtDeliverChequeUpdate]
  @Original_CQRNo Int, 
  @StatusID Int,
  @Remarks NVarChar(250),
  @Delivered Bit,
  @DeliveredOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_CQReceipts] SET 
   [StatusID] = @StatusID
  ,[Remarks] = @Remarks
  ,[Delivered] = @Delivered
  ,[DeliveredOn] = @DeliveredOn
  WHERE
  [CQRNo] = @Original_CQRNo
  SET @RowCount = @@RowCount
GO
