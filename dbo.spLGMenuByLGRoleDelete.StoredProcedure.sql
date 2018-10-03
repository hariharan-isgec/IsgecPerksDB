USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGMenuByLGRoleDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRMenuByVRRole]
  WHERE
  [SYS_VRMenuByVRRole].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
