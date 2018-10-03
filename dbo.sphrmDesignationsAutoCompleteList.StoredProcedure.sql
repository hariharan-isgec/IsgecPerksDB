USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDesignationsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Designations].[Description] + ' [' + 
        STR([HRM_Designations].[DesignationID])
        + ']', [HRM_Designations].[DesignationID] 
			FROM [HRM_Designations] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Designations].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Designations].[Description] + ' [' + 
        STR([HRM_Designations].[DesignationID])
        + ']', [HRM_Designations].[DesignationID] 
			FROM [HRM_Designations] 
      WHERE DesignationID >= @PREFIX 
			ORDER BY [HRM_Designations].[DesignationID] 
	  END
GO
