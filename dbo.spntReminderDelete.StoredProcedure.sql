USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntReminderDelete]
  @Original_ReminderID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [Note_Reminder]
  WHERE
  [Note_Reminder].[ReminderID] = @Original_ReminderID
  SET @RowCount = @@RowCount
GO
