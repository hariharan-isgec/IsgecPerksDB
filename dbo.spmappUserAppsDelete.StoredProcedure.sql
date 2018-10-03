USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsDelete]
  @Original_AppID Int,
  @Original_UserID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [MAPP_UserApps]
  WHERE
  [MAPP_UserApps].[AppID] = @Original_AppID
  AND [MAPP_UserApps].[UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
