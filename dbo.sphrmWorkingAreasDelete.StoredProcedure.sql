USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasDelete]
  @Original_WorkingAreaID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_WorkingAreas]
  WHERE
  [HRM_WorkingAreas].[WorkingAreaID] = @Original_WorkingAreaID
  SET @RowCount = @@RowCount
GO
