USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasSelectByID]
  @WorkingAreaID Int
  AS
  SELECT
		[HRM_WorkingAreas].[WorkingAreaID],
		[HRM_WorkingAreas].[Description] 
  FROM [HRM_WorkingAreas] 
  WHERE
  [HRM_WorkingAreas].[WorkingAreaID] = @WorkingAreaID
GO
