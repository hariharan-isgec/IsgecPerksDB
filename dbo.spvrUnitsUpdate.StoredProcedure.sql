USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsUpdate]
  @Original_UnitID Int, 
  @Description NVarChar(50),
  @ConversionFactor Decimal(18,6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_Units] SET 
   [Description] = @Description
  ,[ConversionFactor] = @ConversionFactor
  WHERE
  [UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
