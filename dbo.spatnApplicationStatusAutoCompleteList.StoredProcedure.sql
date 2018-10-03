USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_ApplicationStatus].[Description] + ' [' + 
        STR([ATN_ApplicationStatus].[ApplStatusID])
        + ']', [ATN_ApplicationStatus].[ApplStatusID] 
			FROM [ATN_ApplicationStatus] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_ApplicationStatus].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_ApplicationStatus].[Description] + ' [' + 
        STR([ATN_ApplicationStatus].[ApplStatusID])
        + ']', [ATN_ApplicationStatus].[ApplStatusID] 
			FROM [ATN_ApplicationStatus] 
      WHERE ApplStatusID >= @PREFIX 
			ORDER BY [ATN_ApplicationStatus].[ApplStatusID] 
	  END
GO
