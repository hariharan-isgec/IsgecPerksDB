USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsUpdate]
  @Original_UserID NVarChar(8), 
  @Original_ProjectID NVarChar(6), 
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteUserProjects] SET 
   [UserID] = @UserID
  ,[ProjectID] = @ProjectID
  ,[Active] = @Active
  WHERE
  [UserID] = @Original_UserID
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
