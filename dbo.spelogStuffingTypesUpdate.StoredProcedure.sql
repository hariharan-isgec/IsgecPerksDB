USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesUpdate]
  @Original_StuffingTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_StuffingTypes] SET 
   [Description] = @Description
  WHERE
  [StuffingTypeID] = @Original_StuffingTypeID
  SET @RowCount = @@RowCount
GO
