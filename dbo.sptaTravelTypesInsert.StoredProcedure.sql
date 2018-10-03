USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesInsert]
  @TravelTypeDescription NVarChar(50),
  @Return_TravelTypeID Int = null OUTPUT 
  AS
  INSERT [TA_TravelTypes]
  (
   [TravelTypeDescription]
  )
  VALUES
  (
   @TravelTypeDescription
  )
  SET @Return_TravelTypeID = Scope_Identity()
GO
