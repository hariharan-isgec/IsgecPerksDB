USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersDelete]
  @Original_ProjectID NVarChar(6),
  @Original_UserID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_AlertsToUsers]
  WHERE
  [TOS_AlertsToUsers].[ProjectID] = @Original_ProjectID
  AND [TOS_AlertsToUsers].[UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
