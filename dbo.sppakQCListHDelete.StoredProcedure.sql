USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListHDelete]
  @Original_QCLNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_QCListH]
  WHERE
  [PAK_QCListH].[QCLNo] = @Original_QCLNo
  AND [PAK_QCListH].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
