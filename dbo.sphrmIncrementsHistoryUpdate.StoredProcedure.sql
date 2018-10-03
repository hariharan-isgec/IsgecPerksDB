USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmIncrementsHistoryUpdate]
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Original_IncrementID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Increments] SET 
   [Executed] = @Executed
  ,[Cancelled] = @Cancelled
  ,[ProcessedBy] = @ProcessedBy
  ,[ProcessedOn] = @ProcessedOn
  WHERE
  [IncrementID] = @Original_IncrementID
  SET @RowCount = @@RowCount
GO
