USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1AutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus1].[Description] + ' [' + 
        STR([HRM_FunctionalStatus1].[FunctionalStatusID1])
        + ']', [HRM_FunctionalStatus1].[FunctionalStatusID1] 
			FROM [HRM_FunctionalStatus1] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_FunctionalStatus1].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus1].[Description] + ' [' + 
        STR([HRM_FunctionalStatus1].[FunctionalStatusID1])
        + ']', [HRM_FunctionalStatus1].[FunctionalStatusID1] 
			FROM [HRM_FunctionalStatus1] 
      WHERE FunctionalStatusID1 >= @PREFIX 
			ORDER BY [HRM_FunctionalStatus1].[FunctionalStatusID1] 
	  END
GO
