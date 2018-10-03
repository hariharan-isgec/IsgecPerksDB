USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesUpdate]
  @Original_BLTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_BLTypes] SET 
   [Description] = @Description
  WHERE
  [BLTypeID] = @Original_BLTypeID
  SET @RowCount = @@RowCount
GO
