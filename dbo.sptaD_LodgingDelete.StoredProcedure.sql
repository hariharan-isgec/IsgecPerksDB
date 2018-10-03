USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_Lodging]
  WHERE
  [TA_D_Lodging].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
