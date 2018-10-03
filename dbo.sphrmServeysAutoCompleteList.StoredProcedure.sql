USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Serveys].[Description] + ' [' + 
        STR([HRM_Serveys].[ServeyID])
        + ']', [HRM_Serveys].[ServeyID] 
			FROM [HRM_Serveys] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Serveys].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Serveys].[Description] + ' [' + 
        STR([HRM_Serveys].[ServeyID])
        + ']', [HRM_Serveys].[ServeyID] 
			FROM [HRM_Serveys] 
      WHERE ServeyID >= @PREFIX 
			ORDER BY [HRM_Serveys].[ServeyID] 
	  END
GO
