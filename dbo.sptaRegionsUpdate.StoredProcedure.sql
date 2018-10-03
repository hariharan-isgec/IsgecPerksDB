USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsUpdate]
  @Original_RegionID NVarChar(10), 
  @RegionID NVarChar(10),
  @RegionName NVarChar(50),
  @RegionTypeID NVarChar(10),
  @CurrencyID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Regions] SET 
   [RegionID] = @RegionID
  ,[RegionName] = @RegionName
  ,[RegionTypeID] = @RegionTypeID
  ,[CurrencyID] = @CurrencyID
  WHERE
  [RegionID] = @Original_RegionID
  SET @RowCount = @@RowCount
GO
