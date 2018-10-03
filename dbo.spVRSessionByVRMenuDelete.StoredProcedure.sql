USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionByVRMenuDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRSessionByVRMenu]
  WHERE
  [SYS_VRSessionByVRMenu].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
