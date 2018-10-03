USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsUpdate]
  @Original_UnitID Int, 
  @Description NVarChar(50),
  @UnitSetID Int,
  @ConversionFactor Decimal(18,8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Units] SET 
   [Description] = @Description
  ,[UnitSetID] = @UnitSetID
  ,[ConversionFactor] = @ConversionFactor
  WHERE
  [UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
