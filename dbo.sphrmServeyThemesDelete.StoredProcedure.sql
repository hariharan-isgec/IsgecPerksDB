USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemesDelete]
  @Original_ThemeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_ServeyThemes]
  WHERE
  [HRM_ServeyThemes].[ThemeID] = @Original_ThemeID
  SET @RowCount = @@RowCount
GO
