USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesInsert]
  @PlaceID NVarChar(30),
  @Description NVarChar(30),
  @Return_PlaceID NVarChar(30) = null OUTPUT
  AS
  INSERT [SPMT_Places]
  (
   [PlaceID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@PlaceID)
  ,@Description
  )
  SET @Return_PlaceID = @PlaceID
GO
