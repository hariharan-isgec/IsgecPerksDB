USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDDelete]
  @Original_ProjectID NVarChar(6),
  @Original_RecNo Int,
  @Original_RecSrNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SitePkgD]
  WHERE
  [PAK_SitePkgD].[ProjectID] = @Original_ProjectID
  AND [PAK_SitePkgD].[RecNo] = @Original_RecNo
  AND [PAK_SitePkgD].[RecSrNo] = @Original_RecSrNo
  SET @RowCount = @@RowCount
GO
