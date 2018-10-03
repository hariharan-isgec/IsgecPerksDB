USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesInsert]
  @CityID NVarChar(30),
  @CityName NVarChar(80),
  @CityTypeForDA NVarChar(6),
  @CityTypeForHotel NVarChar(6),
  @CountryID NVarChar(30),
  @RegionID NVarChar(10),
  @CurrencyID NVarChar(6),
  @RegionTypeID NVarChar(10),
  @Return_CityID NVarChar(30) = null OUTPUT 
  AS
  INSERT [TA_Cities]
  (
   [CityID]
  ,[CityName]
  ,[CityTypeForDA]
  ,[CityTypeForHotel]
  ,[CountryID]
  ,[RegionID]
  ,[CurrencyID]
  ,[RegionTypeID]
  )
  VALUES
  (
   UPPER(@CityID)
  ,@CityName
  ,@CityTypeForDA
  ,@CityTypeForHotel
  ,@CountryID
  ,@RegionID
  ,@CurrencyID
  ,@RegionTypeID
  )
  SET @Return_CityID = @CityID
GO
