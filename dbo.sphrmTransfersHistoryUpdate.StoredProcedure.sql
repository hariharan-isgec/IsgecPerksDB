USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersHistoryUpdate]
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Original_TransferID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Transfers] SET 
   [Executed] = @Executed
  ,[Cancelled] = @Cancelled
  ,[ProcessedBy] = @ProcessedBy
  ,[ProcessedOn] = @ProcessedOn
  WHERE
  [TransferID] = @Original_TransferID
  SET @RowCount = @@RowCount
GO
