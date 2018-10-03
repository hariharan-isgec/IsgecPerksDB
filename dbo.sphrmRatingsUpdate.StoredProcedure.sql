USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsUpdate]
  @Description NVarChar(30),
  @sequence Int,
  @Original_RatingID NVarChar(3), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Ratings] SET 
   [Description] = @Description
  ,[sequence] = @sequence
  WHERE
  [RatingID] = @Original_RatingID
  SET @RowCount = @@RowCount
GO
