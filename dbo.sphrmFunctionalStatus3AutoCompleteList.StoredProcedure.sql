USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3AutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus3].[Description] + ' [' + 
        STR([HRM_FunctionalStatus3].[FunctionalStatusID3])
        + ']', [HRM_FunctionalStatus3].[FunctionalStatusID3] 
			FROM [HRM_FunctionalStatus3] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_FunctionalStatus3].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_FunctionalStatus3].[Description] + ' [' + 
        STR([HRM_FunctionalStatus3].[FunctionalStatusID3])
        + ']', [HRM_FunctionalStatus3].[FunctionalStatusID3] 
			FROM [HRM_FunctionalStatus3] 
      WHERE FunctionalStatusID3 >= @PREFIX 
			ORDER BY [HRM_FunctionalStatus3].[FunctionalStatusID3] 
	  END
GO
