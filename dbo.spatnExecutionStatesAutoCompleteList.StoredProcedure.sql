USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_ExecutionStates].[Description] + ' [' + 
        STR([ATN_ExecutionStates].[ExecutionState])
        + ']', [ATN_ExecutionStates].[ExecutionState] 
			FROM [ATN_ExecutionStates] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_ExecutionStates].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_ExecutionStates].[Description] + ' [' + 
        STR([ATN_ExecutionStates].[ExecutionState])
        + ']', [ATN_ExecutionStates].[ExecutionState] 
			FROM [ATN_ExecutionStates] 
      WHERE ExecutionState >= @PREFIX 
			ORDER BY [ATN_ExecutionStates].[ExecutionState] 
	  END
GO
