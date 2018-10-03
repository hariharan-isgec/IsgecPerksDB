USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsDelete]
  @Original_ServeySheetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_ServeySheets]
  WHERE
  [HRM_ServeySheets].[ServeySheetID] = @Original_ServeySheetID
  SET @RowCount = @@RowCount
GO
