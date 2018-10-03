USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsDelete]
  @Original_VRSessionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRSessions]
  WHERE
  [SYS_VRSessions].[VRSessionID] = @Original_VRSessionID
  SET @RowCount = @@RowCount
GO
