USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesDelete]
  @Original_RegionTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_RegionTypes]
  WHERE
  [TA_RegionTypes].[RegionTypeID] = @Original_RegionTypeID
  SET @RowCount = @@RowCount
GO
