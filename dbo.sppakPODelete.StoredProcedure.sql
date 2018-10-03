USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPODelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PO]
  WHERE
  [PAK_PO].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
