USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsDelete]
  @Original_RatingID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Ratings]
  WHERE
  [HRM_Ratings].[RatingID] = @Original_RatingID
  SET @RowCount = @@RowCount
GO
