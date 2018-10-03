USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHDelete]
  @Original_ProjectID NVarChar(6),
  @Original_RecNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SitePkgH]
  WHERE
  [PAK_SitePkgH].[ProjectID] = @Original_ProjectID
  AND [PAK_SitePkgH].[RecNo] = @Original_RecNo
  SET @RowCount = @@RowCount
GO
