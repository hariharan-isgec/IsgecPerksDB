USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferHeaderUpdate]
  @Original_TransferID Int, 
  @TransferTo Int,
  @Returnable Bit,
  @ExpectedDate DateTime,
  @TransferRemarks NVarChar(100),
  @T_TakenBy NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_TransferHeader] SET 
   [TransferTo] = @TransferTo
  ,[Returnable] = @Returnable
  ,[ExpectedDate] = @ExpectedDate
  ,[TransferRemarks] = @TransferRemarks
  ,[T_TakenBy] = @T_TakenBy
  WHERE
  [TransferID] = @Original_TransferID
  SET @RowCount = @@RowCount
GO
