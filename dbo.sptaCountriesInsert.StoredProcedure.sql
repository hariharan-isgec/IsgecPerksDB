USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesInsert]
  @CountryID NVarChar(30),
  @CountryName NVarChar(50),
  @RegionID NVarChar(10),
  @CurrencyID NVarChar(6),
  @RegionTypeID NVarChar(10),
  @ContingencyAmount Int,
  @Return_CountryID NVarChar(30) = null OUTPUT 
  AS
  INSERT [TA_Countries]
  (
   [CountryID]
  ,[CountryName]
  ,[RegionID]
  ,[CurrencyID]
  ,[RegionTypeID]
  ,[ContingencyAmount]
  )
  VALUES
  (
   UPPER(@CountryID)
  ,@CountryName
  ,@RegionID
  ,@CurrencyID
  ,@RegionTypeID
  ,@ContingencyAmount
  )
  SET @Return_CountryID = @CountryID
GO
