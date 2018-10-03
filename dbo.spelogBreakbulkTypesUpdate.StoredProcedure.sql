USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesUpdate]
  @Original_BreakbulkTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_BreakbulkTypes] SET 
   [Description] = @Description
  WHERE
  [BreakbulkTypeID] = @Original_BreakbulkTypeID
  SET @RowCount = @@RowCount
GO
