USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesUpdate]
  @Original_RegionTypeID NVarChar(10), 
  @RegionTypeID NVarChar(10),
  @RegionTypeName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_RegionTypes] SET 
   [RegionTypeID] = @RegionTypeID
  ,[RegionTypeName] = @RegionTypeName
  WHERE
  [RegionTypeID] = @Original_RegionTypeID
  SET @RowCount = @@RowCount
GO
