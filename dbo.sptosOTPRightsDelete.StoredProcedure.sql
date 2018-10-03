USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsDelete]
  @Original_UserID NVarChar(8),
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_UserViews]
  WHERE
  [TOS_UserViews].[UserID] = @Original_UserID
  AND [TOS_UserViews].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
