USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchUpdate]
  @Processed Bit,
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ProcessPunch] SET 
   [Processed] = @Processed
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
