USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusDelete]
  @Original_VRMenuID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRMenus]
  WHERE
  [SYS_VRMenus].[VRMenuID] = @Original_VRMenuID
  SET @RowCount = @@RowCount
GO
