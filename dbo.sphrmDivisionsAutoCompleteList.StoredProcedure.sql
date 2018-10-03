USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Divisions].[Description] + ' [' + 
        [HRM_Divisions].[DivisionID]
        + ']', [HRM_Divisions].[DivisionID] 
			FROM [HRM_Divisions] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Divisions].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Divisions].[Description] + ' [' + 
        [HRM_Divisions].[DivisionID]
        + ']', [HRM_Divisions].[DivisionID] 
			FROM [HRM_Divisions] 
      WHERE DivisionID >= @PREFIX 
			ORDER BY [HRM_Divisions].[DivisionID] 
	  END
GO
