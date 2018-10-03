USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnFinYearAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_FinYear].[Description] + ' [' + 
        [ATN_FinYear].[FinYear]
        + ']', [ATN_FinYear].[FinYear] 
			FROM [ATN_FinYear] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_FinYear].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_FinYear].[Description] + ' [' + 
        [ATN_FinYear].[FinYear]
        + ']', [ATN_FinYear].[FinYear] 
			FROM [ATN_FinYear] 
      WHERE FinYear >= @PREFIX 
			ORDER BY [ATN_FinYear].[FinYear] 
	  END
GO
