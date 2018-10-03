USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsSelectByID]
  @RatingID NVarChar(3)
  AS
  SELECT
		[HRM_Ratings].[RatingID],
		[HRM_Ratings].[Description],
		[HRM_Ratings].[sequence] 
  FROM [HRM_Ratings] 
  WHERE
  [HRM_Ratings].[RatingID] = @RatingID
GO
