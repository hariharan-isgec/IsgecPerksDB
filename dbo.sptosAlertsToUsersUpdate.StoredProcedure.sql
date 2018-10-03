USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_UserID NVarChar(8), 
  @ProjectID NVarChar(6),
  @UserID NVarChar(8),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_AlertsToUsers] SET 
   [ProjectID] = @ProjectID
  ,[UserID] = @UserID
  ,[Active] = @Active
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO
