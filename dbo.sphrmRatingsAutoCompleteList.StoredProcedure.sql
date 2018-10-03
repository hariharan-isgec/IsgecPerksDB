USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Ratings].[Description] + ' [' + 
        [HRM_Ratings].[RatingID]
        + ']', [HRM_Ratings].[RatingID] 
			FROM [HRM_Ratings] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Ratings].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Ratings].[Description] + ' [' + 
        [HRM_Ratings].[RatingID]
        + ']', [HRM_Ratings].[RatingID] 
			FROM [HRM_Ratings] 
      WHERE RatingID >= @PREFIX 
			ORDER BY [HRM_Ratings].[RatingID] 
	  END
GO
