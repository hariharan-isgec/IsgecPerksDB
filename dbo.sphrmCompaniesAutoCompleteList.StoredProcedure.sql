USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmCompaniesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Companies].[Description] + ' [' + 
        [HRM_Companies].[CompanyID]
        + ']', [HRM_Companies].[CompanyID] 
			FROM [HRM_Companies] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Companies].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Companies].[Description] + ' [' + 
        [HRM_Companies].[CompanyID]
        + ']', [HRM_Companies].[CompanyID] 
			FROM [HRM_Companies] 
      WHERE CompanyID >= @PREFIX 
			ORDER BY [HRM_Companies].[CompanyID] 
	  END
GO
