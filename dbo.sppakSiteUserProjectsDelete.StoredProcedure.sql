USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsDelete]
  @Original_UserID NVarChar(8),
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteUserProjects]
  WHERE
  [PAK_SiteUserProjects].[UserID] = @Original_UserID
  AND [PAK_SiteUserProjects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
