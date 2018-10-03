USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4AutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus4].[Description] + ' [' + 
        STR([HRM_FunctionalStatus4].[FunctionalStatusID4])
        + ']', [HRM_FunctionalStatus4].[FunctionalStatusID4] 
			FROM [HRM_FunctionalStatus4] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_FunctionalStatus4].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus4].[Description] + ' [' + 
        STR([HRM_FunctionalStatus4].[FunctionalStatusID4])
        + ']', [HRM_FunctionalStatus4].[FunctionalStatusID4] 
			FROM [HRM_FunctionalStatus4] 
      WHERE FunctionalStatusID4 >= @PREFIX 
			ORDER BY [HRM_FunctionalStatus4].[FunctionalStatusID4] 
	  END
GO
