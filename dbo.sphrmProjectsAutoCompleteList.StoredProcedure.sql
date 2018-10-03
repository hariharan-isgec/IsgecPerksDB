USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[IDM_Projects].[Description] + ' [' + 
        [IDM_Projects].[ProjectID]   + ']', [IDM_Projects].[ProjectID] as projectcode  
			FROM [IDM_Projects] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' OR LOWER(PROJECTID) LIKE LOWER(@PREFIX) + '%'  
			ORDER BY [IDM_Projects].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[IDM_Projects].[Description] + ' [' + 
        [IDM_Projects].[ProjectID]   + ']', [IDM_Projects].[ProjectID] as projectcode  
			FROM [IDM_Projects] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' OR LOWER(PROJECTID) LIKE LOWER(@PREFIX) + '%'  
			ORDER BY [IDM_Projects].[Description] 
	  END
GO
