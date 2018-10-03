USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TrainingDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_Training]
  WHERE
  [TA_D_Training].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
