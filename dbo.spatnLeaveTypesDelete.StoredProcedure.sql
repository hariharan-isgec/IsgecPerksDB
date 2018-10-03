USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesDelete]
  @Original_LeaveTypeID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_LeaveTypes]
  WHERE
  [ATN_LeaveTypes].[LeaveTypeID] = @Original_LeaveTypeID
  SET @RowCount = @@RowCount
GO
