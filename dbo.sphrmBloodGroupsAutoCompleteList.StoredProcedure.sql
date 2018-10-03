USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_BloodGroups].[Description] + ' [' + 
        [HRM_BloodGroups].[BloodGroupID]
        + ']', [HRM_BloodGroups].[BloodGroupID] 
			FROM [HRM_BloodGroups] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_BloodGroups].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_BloodGroups].[Description] + ' [' + 
        [HRM_BloodGroups].[BloodGroupID]
        + ']', [HRM_BloodGroups].[BloodGroupID] 
			FROM [HRM_BloodGroups] 
      WHERE BloodGroupID >= @PREFIX 
			ORDER BY [HRM_BloodGroups].[BloodGroupID] 
	  END
GO
