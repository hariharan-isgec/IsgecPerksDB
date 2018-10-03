USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasUpdate]
  @Description NVarChar(100),
  @Original_WorkingAreaID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_WorkingAreas] SET 
   [Description] = @Description
  WHERE
  [WorkingAreaID] = @Original_WorkingAreaID
  SET @RowCount = @@RowCount
GO
