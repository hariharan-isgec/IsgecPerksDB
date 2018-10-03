USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesInsert]
  @CityTypeID NVarChar(6),
  @CityTypeName NVarChar(50),
  @Return_CityTypeID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TA_CityTypes]
  (
   [CityTypeID]
  ,[CityTypeName]
  )
  VALUES
  (
   UPPER(@CityTypeID)
  ,@CityTypeName
  )
  SET @Return_CityTypeID = @CityTypeID
GO
