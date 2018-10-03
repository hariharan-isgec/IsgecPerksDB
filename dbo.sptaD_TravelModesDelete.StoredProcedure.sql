USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TravelModesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_TravelModes]
  WHERE
  [TA_D_TravelModes].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
