USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByUserDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRSessionByEmployee]
  WHERE
  [SYS_VRSessionByEmployee].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
