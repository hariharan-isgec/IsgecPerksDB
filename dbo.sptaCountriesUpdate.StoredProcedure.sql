USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesUpdate]
  @Original_CountryID NVarChar(30), 
  @CountryID NVarChar(30),
  @CountryName NVarChar(50),
  @RegionID NVarChar(10),
  @CurrencyID NVarChar(6),
  @RegionTypeID NVarChar(10),
  @ContingencyAmount Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Countries] SET 
   [CountryID] = @CountryID
  ,[CountryName] = @CountryName
  ,[RegionID] = @RegionID
  ,[CurrencyID] = @CurrencyID
  ,[RegionTypeID] = @RegionTypeID
  ,[ContingencyAmount] = @ContingencyAmount
  WHERE
  [CountryID] = @Original_CountryID
  SET @RowCount = @@RowCount
GO
