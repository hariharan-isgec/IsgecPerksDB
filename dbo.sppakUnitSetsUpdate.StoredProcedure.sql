USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsUpdate]
  @Original_UnitSetID Int, 
  @Description NVarChar(50),
  @BaseUnitID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_UnitSets] SET 
   [Description] = @Description
  ,[BaseUnitID] = @BaseUnitID
  WHERE
  [UnitSetID] = @Original_UnitSetID
  SET @RowCount = @@RowCount
GO
