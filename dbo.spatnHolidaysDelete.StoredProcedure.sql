USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_Holidays]
  WHERE
  [ATN_Holidays].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
