USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsDelete]
  @Original_DocumentNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Documents]
  WHERE
  [PAK_Documents].[DocumentNo] = @Original_DocumentNo
  SET @RowCount = @@RowCount
GO
