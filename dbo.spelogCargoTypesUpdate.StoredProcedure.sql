USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesUpdate]
  @Original_CargoTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_CargoTypes] SET 
   [Description] = @Description
  WHERE
  [CargoTypeID] = @Original_CargoTypeID
  SET @RowCount = @@RowCount
GO
