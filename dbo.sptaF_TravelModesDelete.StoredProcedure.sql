USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_TravelModesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_F_TravelModes]
  WHERE
  [TA_F_TravelModes].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
