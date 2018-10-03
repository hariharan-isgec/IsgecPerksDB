USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRoleByUserDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRRoleByEmployee]
  WHERE
  [SYS_VRRoleByEmployee].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
