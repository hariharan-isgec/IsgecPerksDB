USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LCModesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_LCModes]
  WHERE
  [TA_D_LCModes].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
