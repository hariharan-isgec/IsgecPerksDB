USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigAutoCompleteList]
  @FinYear NVarChar(4),
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_PunchConfig].[DataFileLocation] + ' [' + 
        STR([ATN_PunchConfig].[RecordID])
        + ']', [ATN_PunchConfig].[RecordID] 
			FROM [ATN_PunchConfig] 
      WHERE LOWER(DataFileLocation) LIKE LOWER(@PREFIX)+'%' 
      AND [ATN_PunchConfig].[FinYear] = @FinYear
			ORDER BY [ATN_PunchConfig].[DataFileLocation] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_PunchConfig].[DataFileLocation] + ' [' + 
        STR([ATN_PunchConfig].[RecordID])
        + ']', [ATN_PunchConfig].[RecordID] 
			FROM [ATN_PunchConfig] 
      WHERE RecordID >= @PREFIX 
      AND [ATN_PunchConfig].[FinYear] = @FinYear
			ORDER BY [ATN_PunchConfig].[RecordID] 
	  END
GO
