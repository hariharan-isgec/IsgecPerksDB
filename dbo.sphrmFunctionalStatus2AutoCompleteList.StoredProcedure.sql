USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2AutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus2].[Description] + ' [' + 
        STR([HRM_FunctionalStatus2].[FunctionalStatusID2])
        + ']', [HRM_FunctionalStatus2].[FunctionalStatusID2] 
			FROM [HRM_FunctionalStatus2] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_FunctionalStatus2].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus2].[Description] + ' [' + 
        STR([HRM_FunctionalStatus2].[FunctionalStatusID2])
        + ']', [HRM_FunctionalStatus2].[FunctionalStatusID2] 
			FROM [HRM_FunctionalStatus2] 
      WHERE FunctionalStatusID2 >= @PREFIX 
			ORDER BY [HRM_FunctionalStatus2].[FunctionalStatusID2] 
	  END
GO
