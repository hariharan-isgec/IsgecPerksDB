USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_WorkingAreas].[Description] + ' [' + 
        STR([HRM_WorkingAreas].[WorkingAreaID])
        + ']', [HRM_WorkingAreas].[WorkingAreaID] 
			FROM [HRM_WorkingAreas] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_WorkingAreas].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_WorkingAreas].[Description] + ' [' + 
        STR([HRM_WorkingAreas].[WorkingAreaID])
        + ']', [HRM_WorkingAreas].[WorkingAreaID] 
			FROM [HRM_WorkingAreas] 
      WHERE WorkingAreaID >= @PREFIX 
			ORDER BY [HRM_WorkingAreas].[WorkingAreaID] 
	  END
GO
