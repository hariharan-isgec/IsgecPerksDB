USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_VTDefault]
  WHERE
  [VR_VTDefault].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
