USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultUpdate]
  @Original_SerialNo Int, 
  @MinimumCapacityPercentage Decimal(6,2),
  @MaximumCapacityPercentage Decimal(6,2),
  @MinimumHeightPercentage Decimal(6,2),
  @MinimumWidthPercentage Decimal(6,2),
  @MinimumLengthPercentage Decimal(6,2),
  @MaximumHeightPercentage Decimal(6,2),
  @MaximumWidthPercentage Decimal(6,2),
  @MaximumLengthPercentage Decimal(6,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_VTDefault] SET 
   [MinimumCapacityPercentage] = @MinimumCapacityPercentage
  ,[MaximumCapacityPercentage] = @MaximumCapacityPercentage
  ,[MinimumHeightPercentage] = @MinimumHeightPercentage
  ,[MinimumWidthPercentage] = @MinimumWidthPercentage
  ,[MinimumLengthPercentage] = @MinimumLengthPercentage
  ,[MaximumHeightPercentage] = @MaximumHeightPercentage
  ,[MaximumWidthPercentage] = @MaximumWidthPercentage
  ,[MaximumLengthPercentage] = @MaximumLengthPercentage
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
