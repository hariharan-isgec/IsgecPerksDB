USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBDelete]
  @Original_UserID NVarChar(8),
  @Original_DashboardID Int,
  @Original_DBRows Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_newUserDB]
  WHERE
  [WF_newUserDB].[UserID] = @Original_UserID
  AND [WF_newUserDB].[DashboardID] = @Original_DashboardID
  AND [WF_newUserDB].[DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
