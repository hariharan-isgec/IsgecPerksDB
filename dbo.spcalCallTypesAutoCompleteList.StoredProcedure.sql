USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_CallTypes].[Description] + ' [' + 
        STR([CAL_CallTypes].[CallTypeID])
        + ']', [CAL_CallTypes].[CallTypeID] 
			FROM [CAL_CallTypes] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [CAL_CallTypes].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[CAL_CallTypes].[Description] + ' [' + 
        STR([CAL_CallTypes].[CallTypeID])
        + ']', [CAL_CallTypes].[CallTypeID] 
			FROM [CAL_CallTypes] 
      WHERE CallTypeID >= @PREFIX 
			ORDER BY [CAL_CallTypes].[CallTypeID] 
	  END
GO
