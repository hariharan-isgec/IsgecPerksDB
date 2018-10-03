USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_Status].[Description] + ' [' + 
        STR([CAL_Status].[CallStatusID])
        + ']', [CAL_Status].[CallStatusID] 
			FROM [CAL_Status] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [CAL_Status].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_Status].[Description] + ' [' + 
        STR([CAL_Status].[CallStatusID])
        + ']', [CAL_Status].[CallStatusID] 
			FROM [CAL_Status] 
      WHERE CallStatusID >= @PREFIX 
			ORDER BY [CAL_Status].[CallStatusID] 
	  END
GO
