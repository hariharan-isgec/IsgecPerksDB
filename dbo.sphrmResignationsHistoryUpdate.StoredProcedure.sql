USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsHistoryUpdate]
  @Executed Bit,
  @Cancelled Bit,
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Original_ResignID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Resignations] SET 
   [Executed] = @Executed
  ,[Cancelled] = @Cancelled
  ,[ProcessedBy] = @ProcessedBy
  ,[ProcessedOn] = @ProcessedOn
  WHERE
  [ResignID] = @Original_ResignID
  SET @RowCount = @@RowCount
GO
