USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_JoiningStates].[Description] + ' [' + 
        [HRM_JoiningStates].[JoiningStateID]
        + ']', [HRM_JoiningStates].[JoiningStateID] 
			FROM [HRM_JoiningStates] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_JoiningStates].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_JoiningStates].[Description] + ' [' + 
        [HRM_JoiningStates].[JoiningStateID]
        + ']', [HRM_JoiningStates].[JoiningStateID] 
			FROM [HRM_JoiningStates] 
      WHERE JoiningStateID >= @PREFIX 
			ORDER BY [HRM_JoiningStates].[JoiningStateID] 
	  END
GO
