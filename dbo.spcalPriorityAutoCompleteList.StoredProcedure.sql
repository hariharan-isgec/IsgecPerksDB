USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPriorityAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_Priority].[Description] + ' [' + 
        [CAL_Priority].[Priority]
        + ']', [CAL_Priority].[Priority] 
			FROM [CAL_Priority] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [CAL_Priority].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_Priority].[Description] + ' [' + 
        [CAL_Priority].[Priority]
        + ']', [CAL_Priority].[Priority] 
			FROM [CAL_Priority] 
      WHERE Priority >= @PREFIX 
			ORDER BY [CAL_Priority].[Priority] 
	  END
GO
