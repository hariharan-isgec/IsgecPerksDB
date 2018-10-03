USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_PunchStatus].[Description] + ' [' + 
        [ATN_PunchStatus].[PunchStatusID]
        + ']', [ATN_PunchStatus].[PunchStatusID] 
			FROM [ATN_PunchStatus] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_PunchStatus].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_PunchStatus].[Description] + ' [' + 
        [ATN_PunchStatus].[PunchStatusID]
        + ']', [ATN_PunchStatus].[PunchStatusID] 
			FROM [ATN_PunchStatus] 
      WHERE PunchStatusID >= @PREFIX 
			ORDER BY [ATN_PunchStatus].[PunchStatusID] 
	  END
GO
