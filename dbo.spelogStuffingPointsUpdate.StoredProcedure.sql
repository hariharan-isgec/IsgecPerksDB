USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsUpdate]
  @Original_StuffingPointID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_StuffingPoints] SET 
   [Description] = @Description
  WHERE
  [StuffingPointID] = @Original_StuffingPointID
  SET @RowCount = @@RowCount
GO
