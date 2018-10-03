USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_MileageDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_Mileage]
  WHERE
  [TA_D_Mileage].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
