USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsDelete]
  @Original_ElementID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Elements]
  WHERE
  [PAK_Elements].[ElementID] = @Original_ElementID
  SET @RowCount = @@RowCount
GO
