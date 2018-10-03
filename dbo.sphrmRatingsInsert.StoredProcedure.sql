USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsInsert]
  @RatingID NVarChar(3),
  @Description NVarChar(30),
  @sequence Int,
  @Return_RatingID NVarChar(3) = null OUTPUT
  AS
  INSERT [HRM_Ratings]
  (
   [RatingID]
  ,[Description]
  ,[sequence]
  )
  VALUES
  (
   @RatingID
  ,@Description
  ,@sequence
  )
  SET @Return_RatingID = @RatingID
GO
