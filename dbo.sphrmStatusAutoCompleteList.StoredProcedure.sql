USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Status].[Description] + ' [' + 
        [HRM_Status].[StatusID]
        + ']', [HRM_Status].[StatusID] 
			FROM [HRM_Status] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Status].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Status].[Description] + ' [' + 
        [HRM_Status].[StatusID]
        + ']', [HRM_Status].[StatusID] 
			FROM [HRM_Status] 
      WHERE StatusID >= @PREFIX 
			ORDER BY [HRM_Status].[StatusID] 
	  END
GO
