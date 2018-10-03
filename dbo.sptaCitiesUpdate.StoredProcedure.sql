USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesUpdate]
  @Original_CityID NVarChar(30), 
  @CityID NVarChar(30),
  @CityName NVarChar(80),
  @CityTypeForDA NVarChar(6),
  @CityTypeForHotel NVarChar(6),
  @CountryID NVarChar(30),
  @RegionID NVarChar(10),
  @CurrencyID NVarChar(6),
  @RegionTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Cities] SET 
   [CityID] = @CityID
  ,[CityName] = @CityName
  ,[CityTypeForDA] = @CityTypeForDA
  ,[CityTypeForHotel] = @CityTypeForHotel
  ,[CountryID] = @CountryID
  ,[RegionID] = @RegionID
  ,[CurrencyID] = @CurrencyID
  ,[RegionTypeID] = @RegionTypeID
  WHERE
  [CityID] = @Original_CityID
  SET @RowCount = @@RowCount
GO
