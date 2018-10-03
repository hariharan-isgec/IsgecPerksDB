USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGMenusDelete]
  @Original_VRMenuID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRMenus]
  WHERE
  [SYS_VRMenus].[VRMenuID] = @Original_VRMenuID
  SET @RowCount = @@RowCount
GO
