USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSiteAttendanceDelete]
  @Original_FinYear NVarChar(4),
  @Original_MonthID Int,
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_SiteAttendance]
  WHERE
  [ATN_SiteAttendance].[FinYear] = @Original_FinYear
  AND [ATN_SiteAttendance].[MonthID] = @Original_MonthID
  AND [ATN_SiteAttendance].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
