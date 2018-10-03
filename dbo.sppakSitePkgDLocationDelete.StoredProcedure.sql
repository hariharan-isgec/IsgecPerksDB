USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationDelete]
  @Original_ProjectID NVarChar(6),
  @Original_RecNo Int,
  @Original_RecSrNo Int,
  @Original_RecSrLNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SitePkgDLocation]
  WHERE
  [PAK_SitePkgDLocation].[ProjectID] = @Original_ProjectID
  AND [PAK_SitePkgDLocation].[RecNo] = @Original_RecNo
  AND [PAK_SitePkgDLocation].[RecSrNo] = @Original_RecSrNo
  AND [PAK_SitePkgDLocation].[RecSrLNo] = @Original_RecSrLNo
  SET @RowCount = @@RowCount
GO
