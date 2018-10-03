USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Offices].[Description] + ' [' + 
        STR([HRM_Offices].[OfficeID])
        + ']', [HRM_Offices].[OfficeID] 
			FROM [HRM_Offices] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Offices].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Offices].[Description] + ' [' + 
        STR([HRM_Offices].[OfficeID])
        + ']', [HRM_Offices].[OfficeID] 
			FROM [HRM_Offices] 
      WHERE OfficeID >= @PREFIX 
			ORDER BY [HRM_Offices].[OfficeID] 
	  END
GO
